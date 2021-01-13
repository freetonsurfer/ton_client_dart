part of 'tonsdktypes.dart';

class BocErrorCode {
  String _value;
  String get value => _value;
  BocErrorCode.InvalidBoc() {
    _value = 'InvalidBoc';
  }
  BocErrorCode.SerializationError() {
    _value = 'SerializationError';
  }
  BocErrorCode.InappropriateBlock() {
    _value = 'InappropriateBlock';
  }
  BocErrorCode.MissingSourceBoc() {
    _value = 'MissingSourceBoc';
  }
  @override
  String toString() {
    return '"$_value"';
  }

  BocErrorCode.fromMap(str) {
    _value = str;
  }
}

class ParamsOfParse extends TonSdkStructure {
  ///BOC encoded as base64
  String _boc;
  String get boc => _boc;
  ParamsOfParse({
    @required String boc,
  }) {
    _boc = ArgumentError.checkNotNull(boc, 'ParamsOfParse boc');
  }
  ParamsOfParse.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('boc') && (map['boc'] != null)) {
      _boc = map['boc'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_boc != null) {
      map['boc'] = _boc;
    }
    return map;
  }
}

class ResultOfParse extends TonSdkStructure {
  ///JSON containing parsed BOC
  dynamic _parsed;
  dynamic get parsed => _parsed;
  ResultOfParse({
    @required dynamic parsed,
  }) {
    _parsed = ArgumentError.checkNotNull(parsed, 'ResultOfParse parsed');
  }
  ResultOfParse.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('parsed') && (map['parsed'] != null)) {
      _parsed = map['parsed'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_parsed != null) {
      map['parsed'] = _parsed;
    }
    return map;
  }
}

class ParamsOfParseShardstate extends TonSdkStructure {
  ///BOC encoded as base64
  String _boc;
  String get boc => _boc;

  ///Shardstate identificator
  String _id;
  String get id => _id;

  ///Workchain shardstate belongs to
  int _workchain_id;
  int get workchain_id => _workchain_id;
  ParamsOfParseShardstate({
    @required String boc,
    @required String id,
    @required int workchain_id,
  }) {
    _boc = ArgumentError.checkNotNull(boc, 'ParamsOfParseShardstate boc');
    _id = ArgumentError.checkNotNull(id, 'ParamsOfParseShardstate id');
    _workchain_id = ArgumentError.checkNotNull(
        workchain_id, 'ParamsOfParseShardstate workchain_id');
  }
  ParamsOfParseShardstate.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('boc') && (map['boc'] != null)) {
      _boc = map['boc'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('id') && (map['id'] != null)) {
      _id = map['id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('workchain_id') && (map['workchain_id'] != null)) {
      _workchain_id = map['workchain_id'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_boc != null) {
      map['boc'] = _boc;
    }
    if (_id != null) {
      map['id'] = _id;
    }
    if (_workchain_id != null) {
      map['workchain_id'] = _workchain_id;
    }
    return map;
  }
}

class ParamsOfGetBlockchainConfig extends TonSdkStructure {
  ///Key block BOC encoded as base64
  String _block_boc;
  String get block_boc => _block_boc;
  ParamsOfGetBlockchainConfig({
    @required String block_boc,
  }) {
    _block_boc = ArgumentError.checkNotNull(
        block_boc, 'ParamsOfGetBlockchainConfig block_boc');
  }
  ParamsOfGetBlockchainConfig.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('block_boc') && (map['block_boc'] != null)) {
      _block_boc = map['block_boc'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_block_boc != null) {
      map['block_boc'] = _block_boc;
    }
    return map;
  }
}

class ResultOfGetBlockchainConfig extends TonSdkStructure {
  ///Blockchain config BOC encoded as base64
  String _config_boc;
  String get config_boc => _config_boc;
  ResultOfGetBlockchainConfig({
    @required String config_boc,
  }) {
    _config_boc = ArgumentError.checkNotNull(
        config_boc, 'ResultOfGetBlockchainConfig config_boc');
  }
  ResultOfGetBlockchainConfig.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('config_boc') && (map['config_boc'] != null)) {
      _config_boc = map['config_boc'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_config_boc != null) {
      map['config_boc'] = _config_boc;
    }
    return map;
  }
}

class ParamsOfGetBocHash extends TonSdkStructure {
  ///BOC encoded as base64
  String _boc;
  String get boc => _boc;
  ParamsOfGetBocHash({
    @required String boc,
  }) {
    _boc = ArgumentError.checkNotNull(boc, 'ParamsOfGetBocHash boc');
  }
  ParamsOfGetBocHash.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('boc') && (map['boc'] != null)) {
      _boc = map['boc'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_boc != null) {
      map['boc'] = _boc;
    }
    return map;
  }
}

class ResultOfGetBocHash extends TonSdkStructure {
  ///BOC root hash encoded with hex
  String _hash;
  String get hash => _hash;
  ResultOfGetBocHash({
    @required String hash,
  }) {
    _hash = ArgumentError.checkNotNull(hash, 'ResultOfGetBocHash hash');
  }
  ResultOfGetBocHash.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('hash') && (map['hash'] != null)) {
      _hash = map['hash'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_hash != null) {
      map['hash'] = _hash;
    }
    return map;
  }
}

class ParamsOfGetCodeFromTvc extends TonSdkStructure {
  ///Contract TVC image encoded as base64
  String _tvc;
  String get tvc => _tvc;
  ParamsOfGetCodeFromTvc({
    @required String tvc,
  }) {
    _tvc = ArgumentError.checkNotNull(tvc, 'ParamsOfGetCodeFromTvc tvc');
  }
  ParamsOfGetCodeFromTvc.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('tvc') && (map['tvc'] != null)) {
      _tvc = map['tvc'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_tvc != null) {
      map['tvc'] = _tvc;
    }
    return map;
  }
}

class ResultOfGetCodeFromTvc extends TonSdkStructure {
  ///Contract code encoded as base64
  String _code;
  String get code => _code;
  ResultOfGetCodeFromTvc({
    @required String code,
  }) {
    _code = ArgumentError.checkNotNull(code, 'ResultOfGetCodeFromTvc code');
  }
  ResultOfGetCodeFromTvc.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('code') && (map['code'] != null)) {
      _code = map['code'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_code != null) {
      map['code'] = _code;
    }
    return map;
  }
}
