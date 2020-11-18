import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:convert';
import 'dart:isolate';
import 'dart:async';
import 'package:tuple/tuple.dart';
import 'dart:io';

//TODO refactor

typedef w_tc_create_context_func = Pointer<Utf8> Function(
    Pointer<Utf8> str, Int32 length);
typedef CreateContext = Pointer<Utf8> Function(Pointer<Utf8> str, int length);
typedef w_tc_request = Void Function(
    Int32, Pointer<Utf8>, Int32, Pointer<Utf8>, Int32, Int32);
typedef TcRequest = void Function(
    int, Pointer<Utf8>, int, Pointer<Utf8>, int, int);

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
  String _pathtosdklib = '';
  var _tcRequest;
  final Map<int, Tuple2<Completer<Map<String, dynamic>>, Function>> _requests =
      {};

  void connect(Map<String, dynamic> config, Uri uriLibPath) async {
    if (Platform.isLinux) {
      _sdkLib = DynamicLibrary.open(uriLibPath.toFilePath());
      _pathtosdklib = uriLibPath.toFilePath();
      _pathtosdklib =
          _pathtosdklib.substring(0, _pathtosdklib.lastIndexOf('/') + 1) +
              'tonclient_1_linux.so';
    } else {
      Exception("Platform not implemented yet!");
    }

    final wrapperOpen = _sdkLib.lookupFunction<
        Void Function(Pointer<Utf8> str, Int32 length),
        void Function(Pointer<Utf8> str, int length)>('wrapper_open');
    wrapperOpen(Utf8.toUtf8(_pathtosdklib), _pathtosdklib.length);

    final configStr = jsonEncode(config);

    final createContextPointer =
        _sdkLib.lookup<NativeFunction<w_tc_create_context_func>>(
            'wrapper_tc_create_context');
    final createContext = createContextPointer.asFunction<CreateContext>();
    final createContextMessage =
        Utf8.fromUtf8(createContext(Utf8.toUtf8(configStr), configStr.length));

    final contextJson =
        jsonDecode(createContextMessage) as Map<String, dynamic>;

    if (!contextJson.containsKey('result')) {
      throw ("Can't create context! ${contextJson['error']}");
    }

    _context = contextJson['result'];
    //create native port
    final initializeApiDL = _sdkLib.lookupFunction<
        IntPtr Function(Pointer<Void>),
        int Function(Pointer<Void>)>('Dart_InitializeApiDL');
    if (initializeApiDL(NativeApi.initializeApiDLData) != 0) {
      throw 'Failed to initialize Dart API';
    }
    _interactiveCppRequests = ReceivePort()
      ..listen((data) {
        responseHandler(data);
      });
    final nativePort = _interactiveCppRequests.sendPort.nativePort;

    final setNativePort = _sdkLib
        .lookup<NativeFunction<Void Function(Int64 port)>>('setNativePort')
        .asFunction<void Function(int port)>();

    setNativePort(nativePort);

    _tcRequest = _sdkLib
        .lookup<NativeFunction<w_tc_request>>('wrapper_tc_request')
        .asFunction<TcRequest>();
  }

  void disconnect() {
    final contextClose =
        _sdkLib.lookupFunction<Void Function(Uint32), void Function(int)>(
            'wrapper_tc_destroy_context');
    contextClose(_context);
    final wrapperClose = _sdkLib
        .lookupFunction<Void Function(), void Function()>('wrapper_close');
    wrapperClose();
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

    final clearResponse = _sdkLib.lookupFunction<
        Void Function(Pointer<MyResponse>),
        void Function(Pointer<MyResponse>)>('clear_response');
    clearResponse(rs);
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
    final param_len = Utf8.strlen(param_utf);
    _tcRequest(
        _context, Utf8.toUtf8(fnName), fnName.length, param_utf, param_len, id);

    return completer.future;
  }
}
