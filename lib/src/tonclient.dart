//import 'package:cli/tonsdkmodule.dart';
import 'tonsdkmodule.dart';
import 'tonsdktypes.dart';
import 'tonsdkcore.dart';
import 'dart:convert';
import "package:hex/hex.dart";
import 'dart:io';
import 'dart:ffi';

import 'dart:async';

export 'tonsdktypes.dart';

class TonClient {
  static final _tonCore = TonSdkCore();

  UtilsModule _utils;
  UtilsModule get utils {
    if (_utils == null) {
      throw ('Client core not connected! Use TonClient.connect to open connection!');
    }
    return _utils;
  }

  AbiModule _abi;
  AbiModule get abi {
    if (_abi == null) {
      throw ('Client core not connected! Use TonClient.connect to open connection!');
    }
    return _abi;
  }

  BocModule _boc;
  BocModule get boc {
    if (_boc == null) {
      throw ('Client core not connected! Use TonClient.connect to open connection!');
    }
    return _boc;
  }

  CryptoModule _crypto;
  CryptoModule get crypto {
    if (_crypto == null) {
      throw ('Client core not connected! Use TonClient.connect to open connection!');
    }
    return _crypto;
  }

  ProcessingModule _processing;
  ProcessingModule get processing {
    if (_processing == null) {
      throw ('Client core not connected! Use TonClient.connect to open connection!');
    }
    return _processing;
  }

  TvmModule _tvm;
  TvmModule get tvm {
    if (_tvm == null) {
      throw ('Client core not connected! Use TonClient.connect to open connection!');
    }
    return _tvm;
  }

  NetModule _net;
  NetModule get net {
    if (_net == null) {
      throw ('Client core not connected! Use TonClient.connect to open connection!');
    }
    return _net;
  }

  DebotModule _debot;
  DebotModule get debot {
    if (_net == null) {
      throw ('Client core not connected! Use TonClient.connect to open connection!');
    }
    return _debot;
  }

  ProofsModule _proofs;
  ProofsModule get proofs {
    if (_net == null) {
      throw ('Client core not connected! Use TonClient.connect to open connection!');
    }
    return _proofs;
  }

  ClientModule _client;

  DynamicLibrary getLibrary(String libPath) {
    try {
      if (Platform.isLinux) {
        final path = libPath + 'libton_client_dart.so';
        return DynamicLibrary.open(path);
      } else if (Platform.isWindows) {
        final path = libPath + 'ton_client_dart.dll';
        return DynamicLibrary.open(path);
      } else {
        throw ("Platform not implemented yet!");
      }
    } catch (e) {
      throw ('Error: Try to check dynamic library path.\n$e');
    }
  }

  ///Initialize TonClient with provided config
  /// Should be always run before usage
  Future<void> connect(Map<String, dynamic> config,
      {String libPath = ""}) async {
    if (_utils != null) {
      throw ('Client core already connected! Use TonClient.disconnect to close connection!');
    }

    _tonCore.connect(getLibrary(libPath), config);
    _utils = UtilsModule(_tonCore);
    _abi = AbiModule(_tonCore);
    _boc = BocModule(_tonCore);
    _crypto = CryptoModule(_tonCore);
    _processing = ProcessingModule(_tonCore);
    _tvm = TvmModule(_tonCore);
    _net = NetModule(_tonCore);
    _debot = DebotModule(_tonCore);
    _proofs = ProofsModule(_tonCore);
    _client = ClientModule(_tonCore);
  }

  ///Free TonClient and resources
  ///should be always run when you don't need client any more
  Future<void> disconnect() async {
    if (_utils == null) {
      throw ('Client core not connected! Use TonClient.connect to open connection!');
    }
    _tonCore.disconnect();
    _utils = null;
    _abi = null;
    _boc = null;
    _crypto = null;
    _processing = null;
    _tvm = null;
    _net = null;
    _debot = null;
    _proofs = null;
    _client = null;
  }

  /// Returns Core Library API reference
  Future<ResultOfGetApiReference> get_api_reference() async {
    if (_utils == null) {
      throw ('Client core not connected! Use TonClient.connect to open connection!');
    }
    return _client.get_api_reference();
  }

  /// Returns Core Library version
  Future<ResultOfVersion> version() async {
    if (_utils == null) {
      throw ('Client core not connected! Use TonClient.connect to open connection!');
    }
    return _client.version();
  }

  /// Returns detailed information about this build.
  Future<ResultOfBuildInfo> build_info() async {
    if (_utils == null) {
      throw ('Client core not connected! Use TonClient.connect to open connection!');
    }
    return _client.build_info();
  }

  /// encode String to Base64 string
  static String str2base64(String str) {
    var bytes = utf8.encode(str);
    return base64.encode(bytes);
  }

  /// decode String to Base64 string
  static String base642str(String base64_str) {
    var bytes = base64.decode(base64_str);
    return utf8.decode(bytes);
  }

  /// encode hex string to Base64 string
  static String hex2base64(String hex_str) {
    var bytes = HEX.decode(hex_str);
    return base64.encode(bytes);
  }

  static Future<String> loadAbiFromFile(String path) async {
    var abijson = await File(path).readAsStringSync();
    final safe = jsonDecode(abijson);
    abijson = jsonEncode(safe);
    return abijson.replaceAll('"', '\\"');
  }
}
