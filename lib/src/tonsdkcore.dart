import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:convert';
import 'dart:isolate';
import 'dart:async';
import 'package:tuple/tuple.dart';
import 'dart:io';

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

typedef _store_dart_post_cobject_C = Void Function(
    Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>> ptr,
    );
typedef _store_dart_post_cobject_Dart = void Function(
    Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>> ptr,
    );

///Core class
class TonSdkCore {
  DynamicLibrary _sdkLib;
  int _context = -1;
  ReceivePort _interactiveCppRequests;
  int _nextId = 1;
  var _sdkRequest;
  var _sdkClearResponse;
  final Map<int, Tuple2<Completer<Map<String, dynamic>>, Function>> _requests =
  {};

  void connect(Map<String, dynamic> config) async {
    /*if (Platform.isLinux) {
      final path = await Isolate.resolvePackageUri(Uri.parse(
          'package:ton_client_dart/src/tonsdklib/libton_client_dart.so'));
      _sdkLib = DynamicLibrary.open(path.toFilePath());
    } else if (Platform.isWindows) {
      final path = await Isolate.resolvePackageUri(Uri.parse(
          'package:ton_client_dart/src/tonsdklib/ton_client_dart.dll'));
      _sdkLib = DynamicLibrary.open(path.toFilePath());
    } else */
    if (Platform.isAndroid) {
      _sdkLib = DynamicLibrary.open('libton_client_dart.so');
    } else if (Platform.isIOS) {
      _sdkLib = DynamicLibrary.process();
    } else {
      throw ("Platform not implemented yet!");
    }

    //create native port
    /*final initializeApiDL = _sdkLib.lookupFunction<
        IntPtr Function(Pointer<Void>),
        int Function(Pointer<Void>)>('dart_initialize_api_dl');
    if (initializeApiDL(NativeApi.initializeApiDLData) != 0) {
      throw 'Failed to initialize Dart API';
    }*/

    final _store_dart_post_cobject_Dart store_dart_post_cobject =
    _sdkLib.lookupFunction<_store_dart_post_cobject_C,
        _store_dart_post_cobject_Dart>('store_dart_post_cobject');

    store_dart_post_cobject(NativeApi.postCObject);
    //print("Setup Done");

    _interactiveCppRequests = ReceivePort()
      ..listen((data) {
        responseHandler(data);
      });
    final nativePort = _interactiveCppRequests.sendPort.nativePort;
    //print('native port $nativePort');
    //create context
    final configStr = jsonEncode(config);

    final createContext = _sdkLib.lookupFunction<
        Pointer<Utf8> Function(Int64, Pointer<Utf8>),
        Pointer<Utf8> Function(int, Pointer<Utf8>)>("dart_create_context");
    final createContextPtr = createContext(nativePort, Utf8.toUtf8(configStr));
    final createContextMessage = Utf8.fromUtf8(createContextPtr);

    final dartStringFree = _sdkLib.lookupFunction<Void Function(Pointer<Utf8>),
        void Function(Pointer<Utf8>)>("dart_string_free");

    final contextJson =
    jsonDecode(createContextMessage) as Map<String, dynamic>;

    if (!contextJson.containsKey('result')) {
      dartStringFree(createContextPtr);
      throw ("Can't create context! ${contextJson['error']}");
    }

    _context = contextJson['result'];
    //print("context: " + _context.toString());

    dartStringFree(createContextPtr);

    //pointers to requests functions
    _sdkRequest = _sdkLib.lookupFunction<
        Void Function(Int32, Pointer<Utf8>, Pointer<Utf8>, Int32),
        void Function(int, Pointer<Utf8>, Pointer<Utf8>, int)>('dart_request');

    _sdkClearResponse = _sdkLib.lookupFunction<
        Void Function(Pointer<MyResponse>),
        void Function(Pointer<MyResponse>)>('dart_response_free');
    //print("connect done");
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
    //print('responseHandler in');
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

    _sdkClearResponse(rs);
  }

  Future<Map<String, dynamic>> request(String fnName,
      [String fnParams = '{}', Function responseHandler]) async {
    //TODO change id generation
    final id = _nextId++;

    final completer = Completer<Map<String, dynamic>>();
    final tuple = Tuple2<Completer<Map<String, dynamic>>, Function>(
        completer, responseHandler);
    _requests[id] = tuple;

    _sdkRequest(_context, Utf8.toUtf8(fnName), Utf8.toUtf8(fnParams), id);

    return completer.future;
  }
}
