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
}

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

  void openLibrary(String libPath) {
    try {
      if (Platform.isLinux) {
        final path = libPath + 'libton_client_dart.so';
        _sdkLib = DynamicLibrary.open(path);
      } else if (Platform.isWindows) {
        final path = libPath + 'ton_client_dart.dll';
        _sdkLib = DynamicLibrary.open(path);
      } else {
        throw ("Platform not implemented yet!");
      }
    } catch (e) {
      print('Error: Try to check dynamic library path.\n${e}');
      exit(1);
    }
  }

  void connect(Map<String, dynamic> config, String libPath) async {
    openLibrary(libPath);

    //create native port
    final store_dart_post_cobject = _sdkLib.lookupFunction<
        Void Function(
            Pointer<
                NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>>),
        void Function(
            Pointer<
                NativeFunction<
                    Int8 Function(Int64,
                        Pointer<Dart_CObject>)>>)>('store_dart_post_cobject');

    store_dart_post_cobject(NativeApi.postCObject);

    _interactiveCppRequests = ReceivePort()
      ..listen((data) {
        responseHandler(data);
      });
    final nativePort = _interactiveCppRequests.sendPort.nativePort;
    //create context
    final configStr = jsonEncode(config);

    final createContext = _sdkLib.lookupFunction<
        Pointer<Utf8> Function(Int64, Pointer<Utf8>),
        Pointer<Utf8> Function(int, Pointer<Utf8>)>("dart_create_context");
    final createContextPtr =
        createContext(nativePort, configStr.toNativeUtf8());
    final createContextMessage = createContextPtr.toDartString();

    final dartStringFree = _sdkLib.lookupFunction<Void Function(Pointer<Utf8>),
        void Function(Pointer<Utf8>)>("dart_string_free");

    final contextJson =
        jsonDecode(createContextMessage) as Map<String, dynamic>;

    if (!contextJson.containsKey('result')) {
      dartStringFree(createContextPtr);
      throw ("Can't create context! ${contextJson['error']}");
    }

    _context = contextJson['result'];

    dartStringFree(createContextPtr);

    //pointers to requests functions
    _sdkRequest = _sdkLib.lookupFunction<
        Void Function(Int32, Pointer<Utf8>, Pointer<Utf8>, Int32),
        void Function(int, Pointer<Utf8>, Pointer<Utf8>, int)>('dart_request');

    _sdkClearResponse = _sdkLib.lookupFunction<
        Void Function(Pointer<MyResponse>),
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
    final jsonStr = rs_val.params_json.toDartString();

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

    _sdkRequest(_context, fnName.toNativeUtf8(), fnParams.toNativeUtf8(), id);

    return completer.future;
  }
}
