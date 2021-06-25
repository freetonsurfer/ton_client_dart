part of 'tonsdktypes.dart';

abstract class AddressStringFormat extends TonSdkStructure {
  static AddressStringFormat fromMap(Map<String, dynamic> map) {
    if (map['type'] == 'AccountId') {
      return AddressStringFormat_AccountId.fromMap(map);
    }
    if (map['type'] == 'Hex') {
      return AddressStringFormat_Hex.fromMap(map);
    }
    if (map['type'] == 'Base64') {
      return AddressStringFormat_Base64.fromMap(map);
    }
    throw ('AddressStringFormat unknown from map type');
  }
}

class AddressStringFormat_AccountId extends AddressStringFormat {
  String _type;
  String get type => _type;
  AddressStringFormat_AccountId() {
    _type = 'AccountId';
  }
  AddressStringFormat_AccountId.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'AccountId') {
      throw ('Wrong map data');
    } else {
      _type = 'AccountId';
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['type'] = _type;
    return map;
  }
}

class AddressStringFormat_Hex extends AddressStringFormat {
  String _type;
  String get type => _type;
  AddressStringFormat_Hex() {
    _type = 'Hex';
  }
  AddressStringFormat_Hex.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Hex') {
      throw ('Wrong map data');
    } else {
      _type = 'Hex';
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['type'] = _type;
    return map;
  }
}

class AddressStringFormat_Base64 extends AddressStringFormat {
  String _type;
  String get type => _type;
  bool _url;
  bool get url => _url;
  bool _test;
  bool get test => _test;
  bool _bounce;
  bool get bounce => _bounce;
  AddressStringFormat_Base64({
    @required bool url,
    @required bool test,
    @required bool bounce,
  }) {
    _type = 'Base64';
    _url = ArgumentError.checkNotNull(url, 'AddressStringFormat_Base64 url');
    _test = ArgumentError.checkNotNull(test, 'AddressStringFormat_Base64 test');
    _bounce =
        ArgumentError.checkNotNull(bounce, 'AddressStringFormat_Base64 bounce');
  }
  AddressStringFormat_Base64.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Base64') {
      throw ('Wrong map data');
    } else {
      _type = 'Base64';
    }
    if (map.containsKey('url') && (map['url'] != null)) {
      _url = map['url'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('test') && (map['test'] != null)) {
      _test = map['test'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('bounce') && (map['bounce'] != null)) {
      _bounce = map['bounce'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_url != null) {
      map['url'] = _url;
    }
    if (_test != null) {
      map['test'] = _test;
    }
    if (_bounce != null) {
      map['bounce'] = _bounce;
    }
    map['type'] = _type;
    return map;
  }
}

class ParamsOfConvertAddress extends TonSdkStructure {
  ///Account address in any TON format.
  String _address;
  String get address => _address;

  ///Specify the format to convert to.
  AddressStringFormat _output_format;
  AddressStringFormat get output_format => _output_format;
  ParamsOfConvertAddress({
    @required String address,
    @required AddressStringFormat output_format,
  }) {
    _address =
        ArgumentError.checkNotNull(address, 'ParamsOfConvertAddress address');
    _output_format = ArgumentError.checkNotNull(
        output_format, 'ParamsOfConvertAddress output_format');
  }
  ParamsOfConvertAddress.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('address') && (map['address'] != null)) {
      _address = map['address'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('output_format') && (map['output_format'] != null)) {
      _output_format = AddressStringFormat.fromMap(map['output_format']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_address != null) {
      map['address'] = _address;
    }
    if (_output_format != null) {
      map['output_format'] = _output_format;
    }
    return map;
  }
}

class ResultOfConvertAddress extends TonSdkStructure {
  ///Address in the specified format
  String _address;
  String get address => _address;
  ResultOfConvertAddress({
    @required String address,
  }) {
    _address =
        ArgumentError.checkNotNull(address, 'ResultOfConvertAddress address');
  }
  ResultOfConvertAddress.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('address') && (map['address'] != null)) {
      _address = map['address'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_address != null) {
      map['address'] = _address;
    }
    return map;
  }
}

class ParamsOfCalcStorageFee extends TonSdkStructure {
  String _account;
  String get account => _account;
  int _period;
  int get period => _period;
  ParamsOfCalcStorageFee({
    @required String account,
    @required int period,
  }) {
    _account =
        ArgumentError.checkNotNull(account, 'ParamsOfCalcStorageFee account');
    _period =
        ArgumentError.checkNotNull(period, 'ParamsOfCalcStorageFee period');
  }
  ParamsOfCalcStorageFee.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('account') && (map['account'] != null)) {
      _account = map['account'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('period') && (map['period'] != null)) {
      _period = map['period'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_account != null) {
      map['account'] = _account;
    }
    if (_period != null) {
      map['period'] = _period;
    }
    return map;
  }
}

class ResultOfCalcStorageFee extends TonSdkStructure {
  String _fee;
  String get fee => _fee;
  ResultOfCalcStorageFee({
    @required String fee,
  }) {
    _fee = ArgumentError.checkNotNull(fee, 'ResultOfCalcStorageFee fee');
  }
  ResultOfCalcStorageFee.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('fee') && (map['fee'] != null)) {
      _fee = map['fee'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_fee != null) {
      map['fee'] = _fee;
    }
    return map;
  }
}

class ParamsOfCompressZstd extends TonSdkStructure {
  ///Must be encoded as base64.
  String _uncompressed;
  String get uncompressed => _uncompressed;

  ///Compression level, from 1 to 21. Where: 1 - lowest compression level (fastest compression); 21 - highest compression level (slowest compression). If level is omitted, the default compression level is used (currently `3`).
  int _level;
  int get level => _level;
  ParamsOfCompressZstd({
    @required String uncompressed,
    int level,
  }) {
    _uncompressed = ArgumentError.checkNotNull(
        uncompressed, 'ParamsOfCompressZstd uncompressed');
    _level = level;
  }
  ParamsOfCompressZstd.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('uncompressed') && (map['uncompressed'] != null)) {
      _uncompressed = map['uncompressed'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('level') && (map['level'] != null)) {
      _level = map['level'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_uncompressed != null) {
      map['uncompressed'] = _uncompressed;
    }
    if (_level != null) {
      map['level'] = _level;
    }
    return map;
  }
}

class ResultOfCompressZstd extends TonSdkStructure {
  ///Must be encoded as base64.
  String _compressed;
  String get compressed => _compressed;
  ResultOfCompressZstd({
    @required String compressed,
  }) {
    _compressed = ArgumentError.checkNotNull(
        compressed, 'ResultOfCompressZstd compressed');
  }
  ResultOfCompressZstd.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('compressed') && (map['compressed'] != null)) {
      _compressed = map['compressed'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_compressed != null) {
      map['compressed'] = _compressed;
    }
    return map;
  }
}

class ParamsOfDecompressZstd extends TonSdkStructure {
  ///Must be encoded as base64.
  String _compressed;
  String get compressed => _compressed;
  ParamsOfDecompressZstd({
    @required String compressed,
  }) {
    _compressed = ArgumentError.checkNotNull(
        compressed, 'ParamsOfDecompressZstd compressed');
  }
  ParamsOfDecompressZstd.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('compressed') && (map['compressed'] != null)) {
      _compressed = map['compressed'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_compressed != null) {
      map['compressed'] = _compressed;
    }
    return map;
  }
}

class ResultOfDecompressZstd extends TonSdkStructure {
  ///Must be encoded as base64.
  String _decompressed;
  String get decompressed => _decompressed;
  ResultOfDecompressZstd({
    @required String decompressed,
  }) {
    _decompressed = ArgumentError.checkNotNull(
        decompressed, 'ResultOfDecompressZstd decompressed');
  }
  ResultOfDecompressZstd.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('decompressed') && (map['decompressed'] != null)) {
      _decompressed = map['decompressed'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_decompressed != null) {
      map['decompressed'] = _decompressed;
    }
    return map;
  }
}
