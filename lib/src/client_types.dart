part of 'tonsdktypes.dart';

class ClientError extends TonSdkStructure {
  int _code;
  int get code => _code;
  String _message;
  String get message => _message;
  dynamic _data;
  dynamic get data => _data;
  ClientError({
    @required int code,
    @required String message,
    @required dynamic data,
  }) {
    _code = ArgumentError.checkNotNull(code, 'ClientError code');
    _message = ArgumentError.checkNotNull(message, 'ClientError message');
    _data = ArgumentError.checkNotNull(data, 'ClientError data');
  }
  ClientError.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('code') && (map['code'] != null)) {
      _code = map['code'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('message') && (map['message'] != null)) {
      _message = map['message'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('data') && (map['data'] != null)) {
      _data = map['data'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_code != null) {
      map['code'] = _code;
    }
    if (_message != null) {
      map['message'] = _message;
    }
    if (_data != null) {
      map['data'] = _data;
    }
    return map;
  }
}

class ClientConfig extends TonSdkStructure {
  NetworkConfig _network;
  NetworkConfig get network => _network;
  CryptoConfig _crypto;
  CryptoConfig get crypto => _crypto;
  AbiConfig _abi;
  AbiConfig get abi => _abi;
  ClientConfig({
    NetworkConfig network,
    CryptoConfig crypto,
    AbiConfig abi,
  }) {
    _network = network;
    _crypto = crypto;
    _abi = abi;
  }
  ClientConfig.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('network') && (map['network'] != null)) {
      _network = NetworkConfig.fromMap(map['network']);
    }
    if (map.containsKey('crypto') && (map['crypto'] != null)) {
      _crypto = CryptoConfig.fromMap(map['crypto']);
    }
    if (map.containsKey('abi') && (map['abi'] != null)) {
      _abi = AbiConfig.fromMap(map['abi']);
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_network != null) {
      map['network'] = _network;
    }
    if (_crypto != null) {
      map['crypto'] = _crypto;
    }
    if (_abi != null) {
      map['abi'] = _abi;
    }
    return map;
  }
}

class NetworkConfig extends TonSdkStructure {
  String _server_address;
  String get server_address => _server_address;
  int _network_retries_count;
  int get network_retries_count => _network_retries_count;
  int _message_retries_count;
  int get message_retries_count => _message_retries_count;
  int _message_processing_timeout;
  int get message_processing_timeout => _message_processing_timeout;
  int _wait_for_timeout;
  int get wait_for_timeout => _wait_for_timeout;
  int _out_of_sync_threshold;
  int get out_of_sync_threshold => _out_of_sync_threshold;
  String _access_key;
  String get access_key => _access_key;
  NetworkConfig({
    @required String server_address,
    int network_retries_count,
    int message_retries_count,
    int message_processing_timeout,
    int wait_for_timeout,
    int out_of_sync_threshold,
    String access_key,
  }) {
    _server_address = ArgumentError.checkNotNull(
        server_address, 'NetworkConfig server_address');
    _network_retries_count = network_retries_count;
    _message_retries_count = message_retries_count;
    _message_processing_timeout = message_processing_timeout;
    _wait_for_timeout = wait_for_timeout;
    _out_of_sync_threshold = out_of_sync_threshold;
    _access_key = access_key;
  }
  NetworkConfig.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('server_address') && (map['server_address'] != null)) {
      _server_address = map['server_address'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('network_retries_count') &&
        (map['network_retries_count'] != null)) {
      _network_retries_count = map['network_retries_count'];
    }
    if (map.containsKey('message_retries_count') &&
        (map['message_retries_count'] != null)) {
      _message_retries_count = map['message_retries_count'];
    }
    if (map.containsKey('message_processing_timeout') &&
        (map['message_processing_timeout'] != null)) {
      _message_processing_timeout = map['message_processing_timeout'];
    }
    if (map.containsKey('wait_for_timeout') &&
        (map['wait_for_timeout'] != null)) {
      _wait_for_timeout = map['wait_for_timeout'];
    }
    if (map.containsKey('out_of_sync_threshold') &&
        (map['out_of_sync_threshold'] != null)) {
      _out_of_sync_threshold = map['out_of_sync_threshold'];
    }
    if (map.containsKey('access_key') && (map['access_key'] != null)) {
      _access_key = map['access_key'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_server_address != null) {
      map['server_address'] = _server_address;
    }
    if (_network_retries_count != null) {
      map['network_retries_count'] = _network_retries_count;
    }
    if (_message_retries_count != null) {
      map['message_retries_count'] = _message_retries_count;
    }
    if (_message_processing_timeout != null) {
      map['message_processing_timeout'] = _message_processing_timeout;
    }
    if (_wait_for_timeout != null) {
      map['wait_for_timeout'] = _wait_for_timeout;
    }
    if (_out_of_sync_threshold != null) {
      map['out_of_sync_threshold'] = _out_of_sync_threshold;
    }
    if (_access_key != null) {
      map['access_key'] = _access_key;
    }
    return map;
  }
}

class CryptoConfig extends TonSdkStructure {
  int _mnemonic_dictionary;
  int get mnemonic_dictionary => _mnemonic_dictionary;
  int _mnemonic_word_count;
  int get mnemonic_word_count => _mnemonic_word_count;
  String _hdkey_derivation_path;
  String get hdkey_derivation_path => _hdkey_derivation_path;
  CryptoConfig({
    int mnemonic_dictionary,
    int mnemonic_word_count,
    String hdkey_derivation_path,
  }) {
    _mnemonic_dictionary = mnemonic_dictionary;
    _mnemonic_word_count = mnemonic_word_count;
    _hdkey_derivation_path = hdkey_derivation_path;
  }
  CryptoConfig.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('mnemonic_dictionary') &&
        (map['mnemonic_dictionary'] != null)) {
      _mnemonic_dictionary = map['mnemonic_dictionary'];
    }
    if (map.containsKey('mnemonic_word_count') &&
        (map['mnemonic_word_count'] != null)) {
      _mnemonic_word_count = map['mnemonic_word_count'];
    }
    if (map.containsKey('hdkey_derivation_path') &&
        (map['hdkey_derivation_path'] != null)) {
      _hdkey_derivation_path = map['hdkey_derivation_path'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_mnemonic_dictionary != null) {
      map['mnemonic_dictionary'] = _mnemonic_dictionary;
    }
    if (_mnemonic_word_count != null) {
      map['mnemonic_word_count'] = _mnemonic_word_count;
    }
    if (_hdkey_derivation_path != null) {
      map['hdkey_derivation_path'] = _hdkey_derivation_path;
    }
    return map;
  }
}

class AbiConfig extends TonSdkStructure {
  int _workchain;
  int get workchain => _workchain;
  int _message_expiration_timeout;
  int get message_expiration_timeout => _message_expiration_timeout;
  int _message_expiration_timeout_grow_factor;
  int get message_expiration_timeout_grow_factor =>
      _message_expiration_timeout_grow_factor;
  AbiConfig({
    int workchain,
    int message_expiration_timeout,
    int message_expiration_timeout_grow_factor,
  }) {
    _workchain = workchain;
    _message_expiration_timeout = message_expiration_timeout;
    _message_expiration_timeout_grow_factor =
        message_expiration_timeout_grow_factor;
  }
  AbiConfig.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('workchain') && (map['workchain'] != null)) {
      _workchain = map['workchain'];
    }
    if (map.containsKey('message_expiration_timeout') &&
        (map['message_expiration_timeout'] != null)) {
      _message_expiration_timeout = map['message_expiration_timeout'];
    }
    if (map.containsKey('message_expiration_timeout_grow_factor') &&
        (map['message_expiration_timeout_grow_factor'] != null)) {
      _message_expiration_timeout_grow_factor =
          map['message_expiration_timeout_grow_factor'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_workchain != null) {
      map['workchain'] = _workchain;
    }
    if (_message_expiration_timeout != null) {
      map['message_expiration_timeout'] = _message_expiration_timeout;
    }
    if (_message_expiration_timeout_grow_factor != null) {
      map['message_expiration_timeout_grow_factor'] =
          _message_expiration_timeout_grow_factor;
    }
    return map;
  }
}

class BuildInfoDependency extends TonSdkStructure {
  /// Dependency name. Usually it is a crate name.
  String _name;
  String get name => _name;

  /// Git commit hash of the related repository.
  String _git_commit;
  String get git_commit => _git_commit;
  BuildInfoDependency({
    @required String name,
    @required String git_commit,
  }) {
    _name = ArgumentError.checkNotNull(name, 'BuildInfoDependency name');
    _git_commit = ArgumentError.checkNotNull(
        git_commit, 'BuildInfoDependency git_commit');
  }
  BuildInfoDependency.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('name') && (map['name'] != null)) {
      _name = map['name'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('git_commit') && (map['git_commit'] != null)) {
      _git_commit = map['git_commit'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_name != null) {
      map['name'] = _name;
    }
    if (_git_commit != null) {
      map['git_commit'] = _git_commit;
    }
    return map;
  }
}

class ParamsOfAppRequest extends TonSdkStructure {
  /// Request ID. Should be used in `resolve_app_request` call
  int _app_request_id;
  int get app_request_id => _app_request_id;

  /// Request describing data
  dynamic _request_data;
  dynamic get request_data => _request_data;
  ParamsOfAppRequest({
    @required int app_request_id,
    @required dynamic request_data,
  }) {
    _app_request_id = ArgumentError.checkNotNull(
        app_request_id, 'ParamsOfAppRequest app_request_id');
    _request_data = ArgumentError.checkNotNull(
        request_data, 'ParamsOfAppRequest request_data');
  }
  ParamsOfAppRequest.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('app_request_id') && (map['app_request_id'] != null)) {
      _app_request_id = map['app_request_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('request_data') && (map['request_data'] != null)) {
      _request_data = map['request_data'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_app_request_id != null) {
      map['app_request_id'] = _app_request_id;
    }
    if (_request_data != null) {
      map['request_data'] = _request_data;
    }
    return map;
  }
}

abstract class AppRequestResult extends TonSdkStructure {
  static AppRequestResult fromMap(Map<String, dynamic> map) {
    if (map['type'] == 'Error') {
      return AppRequestResult_Error.fromMap(map);
    }
    if (map['type'] == 'Ok') {
      return AppRequestResult_Ok.fromMap(map);
    }
    throw ('AppRequestResult unknown from map type');
  }
}

/// Error occured during request processing
class AppRequestResult_Error extends AppRequestResult {
  String _type;
  String get type => _type;

  /// Error description
  String _text;
  String get text => _text;
  AppRequestResult_Error({
    @required String text,
  }) {
    _type = 'Error';
    _text = ArgumentError.checkNotNull(text, 'AppRequestResult_Error text');
  }
  AppRequestResult_Error.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Error') {
      throw ('Wrong map data');
    } else {
      _type = 'Error';
    }
    if (map.containsKey('text') && (map['text'] != null)) {
      _text = map['text'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_text != null) {
      map['text'] = _text;
    }
    map['type'] = _type;
    return map;
  }
}

/// Request processed successfully
class AppRequestResult_Ok extends AppRequestResult {
  String _type;
  String get type => _type;

  /// Request processing result
  dynamic _result;
  dynamic get result => _result;
  AppRequestResult_Ok({
    @required dynamic result,
  }) {
    _type = 'Ok';
    _result = ArgumentError.checkNotNull(result, 'AppRequestResult_Ok result');
  }
  AppRequestResult_Ok.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Ok') {
      throw ('Wrong map data');
    } else {
      _type = 'Ok';
    }
    if (map.containsKey('result') && (map['result'] != null)) {
      _result = map['result'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_result != null) {
      map['result'] = _result;
    }
    map['type'] = _type;
    return map;
  }
}

class ResultOfGetApiReference extends TonSdkStructure {
  dynamic _api;
  dynamic get api => _api;
  ResultOfGetApiReference({
    @required dynamic api,
  }) {
    _api = ArgumentError.checkNotNull(api, 'ResultOfGetApiReference api');
  }
  ResultOfGetApiReference.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('api') && (map['api'] != null)) {
      _api = map['api'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_api != null) {
      map['api'] = _api;
    }
    return map;
  }
}

class ResultOfVersion extends TonSdkStructure {
  /// Core Library version
  String _version;
  String get version => _version;
  ResultOfVersion({
    @required String version,
  }) {
    _version = ArgumentError.checkNotNull(version, 'ResultOfVersion version');
  }
  ResultOfVersion.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('version') && (map['version'] != null)) {
      _version = map['version'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_version != null) {
      map['version'] = _version;
    }
    return map;
  }
}

class ResultOfBuildInfo extends TonSdkStructure {
  /// Build number assigned to this build by the CI.
  int _build_number;
  int get build_number => _build_number;

  /// Fingerprint of the most important dependencies.
  List<BuildInfoDependency> _dependencies;
  List<BuildInfoDependency> get dependencies => _dependencies;
  ResultOfBuildInfo({
    @required int build_number,
    @required List<BuildInfoDependency> dependencies,
  }) {
    _build_number = ArgumentError.checkNotNull(
        build_number, 'ResultOfBuildInfo build_number');
    _dependencies = ArgumentError.checkNotNull(
        dependencies, 'ResultOfBuildInfo dependencies');
  }
  ResultOfBuildInfo.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('build_number') && (map['build_number'] != null)) {
      _build_number = map['build_number'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('dependencies') && (map['dependencies'] != null)) {
      _dependencies = [];
      for (var el in map['dependencies']) {
        if (el != null) {
          _dependencies.add(BuildInfoDependency.fromMap(el));
        } else {
          _dependencies.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_build_number != null) {
      map['build_number'] = _build_number;
    }
    if (_dependencies != null) {
      map['dependencies'] = _dependencies;
    }
    return map;
  }
}

class ParamsOfResolveAppRequest extends TonSdkStructure {
  /// Request ID received from SDK
  int _app_request_id;
  int get app_request_id => _app_request_id;

  /// Result of request processing
  AppRequestResult _result;
  AppRequestResult get result => _result;
  ParamsOfResolveAppRequest({
    @required int app_request_id,
    @required AppRequestResult result,
  }) {
    _app_request_id = ArgumentError.checkNotNull(
        app_request_id, 'ParamsOfResolveAppRequest app_request_id');
    _result =
        ArgumentError.checkNotNull(result, 'ParamsOfResolveAppRequest result');
  }
  ParamsOfResolveAppRequest.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('app_request_id') && (map['app_request_id'] != null)) {
      _app_request_id = map['app_request_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('result') && (map['result'] != null)) {
      _result = AppRequestResult.fromMap(map['result']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_app_request_id != null) {
      map['app_request_id'] = _app_request_id;
    }
    if (_result != null) {
      map['result'] = _result;
    }
    return map;
  }
}
