import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:convert';
import 'dart:isolate';
import 'dart:async';
import 'package:tuple/tuple.dart';
import 'dart:io';

//TODO refactor

typedef CreateContextFFI = Pointer<Utf8> Function(Int64, Pointer<Utf8>);
typedef CreateContext = Pointer<Utf8> Function(int, Pointer<Utf8>);
//typedef w_tc_create_context_func = Pointer<Utf8> Function(
//    Pointer<Utf8> str, Int32 length);
//typedef CreateContext = Pointer<Utf8> Function(Pointer<Utf8> str, int length);
typedef w_tc_request = Void Function(
    Int32, Pointer<Utf8>, Pointer<Utf8>, Int32);
typedef TcRequest = void Function(int, Pointer<Utf8>, Pointer<Utf8>, int);
typedef DartStringFree = void Function(Pointer<Utf8>);
typedef DartStringFreeFFI = Void Function(Pointer<Utf8>);

class MyResponse extends Struct {
  @Uint8()
  int finished;
  @Uint32()
  int request_id;
  @Uint32()
  int response_type;

  Pointer<Utf8> params_json;

  factory MyResponse.allocate(int fin, int id, int type, Pointer<Utf8> json) =>
      allocate<MyResponse>().ref
        ..finished = fin
        ..request_id = id
        ..response_type = type
        ..params_json = json;
}

///Core class
class TonSdkCore {
  DynamicLibrary _sdkLib;
  int _context = -1;
  ReceivePort _interactiveCppRequests;
  int _nextId = 1;
  var _tcRequest;
  var _clearResponse;
  final Map<int, Tuple2<Completer<Map<String, dynamic>>, Function>> _requests =
      {};

  void connect(Map<String, dynamic> config) async {
    if (Platform.isLinux) {
      final path = await Isolate.resolvePackageUri(Uri.parse(
          'package:ton_client_dart/src/tonsdklib/libton_client_dart.so'));
      _sdkLib = DynamicLibrary.open(path.toFilePath());
    } else if (Platform.isWindows) {
      final path = await Isolate.resolvePackageUri(Uri.parse(
          'package:ton_client_dart/src/tonsdklib/ton_client_dart.dll'));
      _sdkLib = DynamicLibrary.open(path.toFilePath());
    } else {
      throw ("Platform not implemented yet!");
    }
    /*if (Platform.isLinux) {
      _sdkLib = DynamicLibrary.open(uriLibPath.toFilePath());
    } else {
      throw ("Platform not implemented yet!");
    }*/

    //create native port
    final initializeApiDL = _sdkLib.lookupFunction<
        IntPtr Function(Pointer<Void>),
        int Function(Pointer<Void>)>('dart_initialize_api_dl');
    if (initializeApiDL(NativeApi.initializeApiDLData) != 0) {
      throw 'Failed to initialize Dart API';
    }
    _interactiveCppRequests = ReceivePort()
      ..listen((data) {
        responseHandler(data);
      });
    final nativePort = _interactiveCppRequests.sendPort.nativePort;

    //create context
    final configStr = jsonEncode(config);

    final createContextPointer =
        _sdkLib.lookup<NativeFunction<CreateContextFFI>>('dart_create_context');
    final createContext = createContextPointer.asFunction<CreateContext>();
    final createContextPtr = createContext(nativePort, Utf8.toUtf8(configStr));
    final createContextMessage = Utf8.fromUtf8(createContextPtr);

    final contextJson =
        jsonDecode(createContextMessage) as Map<String, dynamic>;

    if (!contextJson.containsKey('result')) {
      throw ("Can't create context! ${contextJson['error']}");
    }

    _context = contextJson['result'];
    //print("context: " + _context.toString());

    final dartStringFree = _sdkLib
        .lookup<NativeFunction<DartStringFreeFFI>>("dart_string_free")
        .asFunction<DartStringFree>();
    dartStringFree(createContextPtr);

    /*final setNativePort = _sdkLib
        .lookup<NativeFunction<Void Function(Int64 port)>>(
            'tonsdk_dart_set_nativeport')
        .asFunction<void Function(int port)>();

    setNativePort(nativePort);*/

    //pointers to requests functions
    _tcRequest = _sdkLib
        .lookup<NativeFunction<w_tc_request>>('dart_request')
        .asFunction<TcRequest>();

    _clearResponse = _sdkLib.lookupFunction<Void Function(Pointer<MyResponse>),
        void Function(Pointer<MyResponse>)>('dart_response_free');
  }

  void disconnect() {
    final contextClose =
        _sdkLib.lookupFunction<Void Function(Uint32), void Function(int)>(
            'dart_destroy_context');
    contextClose(_context);
    _interactiveCppRequests.close();
    _context = -1;
    _nextId = 1;
  }

  void responseHandler(int data) {
    final rs = Pointer<MyResponse>.fromAddress(data);
    final rs_val = rs.ref;
    final jsonStr = Utf8.fromUtf8(rs_val.params_json);

    if (!_requests.containsKey(rs_val.request_id)) {
      return;
    }

    final completer = _requests[rs_val.request_id].item1;
    final responseHandler = _requests[rs_val.request_id].item2;

    if (rs_val.finished == 1) {
      _requests.remove(rs_val.request_id);
    }

    final json =
        jsonStr != '' ? jsonDecode(jsonStr) as Map<String, dynamic> : null;
    switch (rs_val.response_type) {
      case 0: // RESULT
        completer.complete(json);
        break;
      case 1: // ERROR
        completer.completeError(json);
        break;
      default: // DATA
        if (rs_val.response_type >= 100 && responseHandler != null) {
          responseHandler(json);
        }
        break;
    }

    _clearResponse(rs);
  }

  Future<Map<String, dynamic>> request(String fnName,
      [String fnParams = '{}', Function responseHandler]) async {
    //TODO change id generation
    final id = _nextId++;

    final completer = Completer<Map<String, dynamic>>();
    final tuple = Tuple2<Completer<Map<String, dynamic>>, Function>(
        completer, responseHandler);
    _requests[id] = tuple;

    final param_utf = Utf8.toUtf8(fnParams);
    //final param_len = Utf8.strlen(param_utf);
    _tcRequest(_context, Utf8.toUtf8(fnName), param_utf, id);

    return completer.future;
  }
}
