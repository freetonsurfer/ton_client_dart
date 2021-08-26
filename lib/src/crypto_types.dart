part of 'tonsdktypes.dart';

class CryptoErrorCode {
  String _value;
  String get value => _value;
  CryptoErrorCode.InvalidPublicKey() {
    _value = 'InvalidPublicKey';
  }
  CryptoErrorCode.InvalidSecretKey() {
    _value = 'InvalidSecretKey';
  }
  CryptoErrorCode.InvalidKey() {
    _value = 'InvalidKey';
  }
  CryptoErrorCode.InvalidFactorizeChallenge() {
    _value = 'InvalidFactorizeChallenge';
  }
  CryptoErrorCode.InvalidBigInt() {
    _value = 'InvalidBigInt';
  }
  CryptoErrorCode.ScryptFailed() {
    _value = 'ScryptFailed';
  }
  CryptoErrorCode.InvalidKeySize() {
    _value = 'InvalidKeySize';
  }
  CryptoErrorCode.NaclSecretBoxFailed() {
    _value = 'NaclSecretBoxFailed';
  }
  CryptoErrorCode.NaclBoxFailed() {
    _value = 'NaclBoxFailed';
  }
  CryptoErrorCode.NaclSignFailed() {
    _value = 'NaclSignFailed';
  }
  CryptoErrorCode.Bip39InvalidEntropy() {
    _value = 'Bip39InvalidEntropy';
  }
  CryptoErrorCode.Bip39InvalidPhrase() {
    _value = 'Bip39InvalidPhrase';
  }
  CryptoErrorCode.Bip32InvalidKey() {
    _value = 'Bip32InvalidKey';
  }
  CryptoErrorCode.Bip32InvalidDerivePath() {
    _value = 'Bip32InvalidDerivePath';
  }
  CryptoErrorCode.Bip39InvalidDictionary() {
    _value = 'Bip39InvalidDictionary';
  }
  CryptoErrorCode.Bip39InvalidWordCount() {
    _value = 'Bip39InvalidWordCount';
  }
  CryptoErrorCode.MnemonicGenerationFailed() {
    _value = 'MnemonicGenerationFailed';
  }
  CryptoErrorCode.MnemonicFromEntropyFailed() {
    _value = 'MnemonicFromEntropyFailed';
  }
  CryptoErrorCode.SigningBoxNotRegistered() {
    _value = 'SigningBoxNotRegistered';
  }
  CryptoErrorCode.InvalidSignature() {
    _value = 'InvalidSignature';
  }
  CryptoErrorCode.EncryptionBoxNotRegistered() {
    _value = 'EncryptionBoxNotRegistered';
  }
  CryptoErrorCode.InvalidIvSize() {
    _value = 'InvalidIvSize';
  }
  CryptoErrorCode.UnsupportedCipherMode() {
    _value = 'UnsupportedCipherMode';
  }
  CryptoErrorCode.CannotCreateCipher() {
    _value = 'CannotCreateCipher';
  }
  CryptoErrorCode.EncryptDataError() {
    _value = 'EncryptDataError';
  }
  CryptoErrorCode.DecryptDataError() {
    _value = 'DecryptDataError';
  }
  CryptoErrorCode.IvRequired() {
    _value = 'IvRequired';
  }
  @override
  String toString() {
    return '"$_value"';
  }

  CryptoErrorCode.fromMap(str) {
    _value = str;
  }
}

///Encryption box information
class EncryptionBoxInfo extends TonSdkStructure {
  ///Derivation path, for instance "m/44'/396'/0'/0/0"
  String _hdpath;
  String get hdpath => _hdpath;

  ///Cryptographic algorithm, used by this encryption box
  String _algorithm;
  String get algorithm => _algorithm;

  ///Options, depends on algorithm and specific encryption box implementation
  dynamic _options;
  dynamic get options => _options;

  ///Public information, depends on algorithm
  dynamic _public;
  dynamic get public => _public;
  EncryptionBoxInfo({
    String hdpath,
    String algorithm,
    dynamic options,
    dynamic public,
  }) {
    _hdpath = hdpath;
    _algorithm = algorithm;
    _options = options;
    _public = public;
  }
  EncryptionBoxInfo.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('hdpath') && (map['hdpath'] != null)) {
      _hdpath = map['hdpath'];
    }
    if (map.containsKey('algorithm') && (map['algorithm'] != null)) {
      _algorithm = map['algorithm'];
    }
    if (map.containsKey('options') && (map['options'] != null)) {
      _options = map['options'];
    }
    if (map.containsKey('public') && (map['public'] != null)) {
      _public = map['public'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_hdpath != null) {
      map['hdpath'] = _hdpath;
    }
    if (_algorithm != null) {
      map['algorithm'] = _algorithm;
    }
    if (_options != null) {
      map['options'] = _options;
    }
    if (_public != null) {
      map['public'] = _public;
    }
    return map;
  }
}

abstract class EncryptionAlgorithm extends TonSdkStructure {
  static EncryptionAlgorithm fromMap(Map<String, dynamic> map) {
    if (map['type'] == 'AES') {
      return EncryptionAlgorithm_AES.fromMap(map);
    }
    throw ('EncryptionAlgorithm unknown from map type');
  }
}

class EncryptionAlgorithm_AES extends EncryptionAlgorithm {
  String _type;
  String get type => _type;
  CipherMode _mode;
  CipherMode get mode => _mode;
  String _key;
  String get key => _key;
  String _iv;
  String get iv => _iv;
  EncryptionAlgorithm_AES({
    @required CipherMode mode,
    @required String key,
    String iv,
  }) {
    _type = 'AES';
    _mode = ArgumentError.checkNotNull(mode, 'EncryptionAlgorithm_AES mode');
    _key = ArgumentError.checkNotNull(key, 'EncryptionAlgorithm_AES key');
    _iv = iv;
  }
  EncryptionAlgorithm_AES.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'AES') {
      throw ('Wrong map data');
    } else {
      _type = 'AES';
    }
    if (map.containsKey('mode') && (map['mode'] != null)) {
      _mode = CipherMode.fromMap(map['mode']);
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('key') && (map['key'] != null)) {
      _key = map['key'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('iv') && (map['iv'] != null)) {
      _iv = map['iv'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_mode != null) {
      map['mode'] = _mode;
    }
    if (_key != null) {
      map['key'] = _key;
    }
    if (_iv != null) {
      map['iv'] = _iv;
    }
    map['type'] = _type;
    return map;
  }
}

class CipherMode {
  String _value;
  String get value => _value;
  CipherMode.CBC() {
    _value = 'CBC';
  }
  CipherMode.CFB() {
    _value = 'CFB';
  }
  CipherMode.CTR() {
    _value = 'CTR';
  }
  CipherMode.ECB() {
    _value = 'ECB';
  }
  CipherMode.OFB() {
    _value = 'OFB';
  }
  @override
  String toString() {
    return '"$_value"';
  }

  CipherMode.fromMap(str) {
    _value = str;
  }
}

class AesParams extends TonSdkStructure {
  CipherMode _mode;
  CipherMode get mode => _mode;
  String _key;
  String get key => _key;
  String _iv;
  String get iv => _iv;
  AesParams({
    @required CipherMode mode,
    @required String key,
    String iv,
  }) {
    _mode = ArgumentError.checkNotNull(mode, 'AesParams mode');
    _key = ArgumentError.checkNotNull(key, 'AesParams key');
    _iv = iv;
  }
  AesParams.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('mode') && (map['mode'] != null)) {
      _mode = CipherMode.fromMap(map['mode']);
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('key') && (map['key'] != null)) {
      _key = map['key'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('iv') && (map['iv'] != null)) {
      _iv = map['iv'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_mode != null) {
      map['mode'] = _mode;
    }
    if (_key != null) {
      map['key'] = _key;
    }
    if (_iv != null) {
      map['iv'] = _iv;
    }
    return map;
  }
}

class AesInfo extends TonSdkStructure {
  CipherMode _mode;
  CipherMode get mode => _mode;
  String _iv;
  String get iv => _iv;
  AesInfo({
    @required CipherMode mode,
    String iv,
  }) {
    _mode = ArgumentError.checkNotNull(mode, 'AesInfo mode');
    _iv = iv;
  }
  AesInfo.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('mode') && (map['mode'] != null)) {
      _mode = CipherMode.fromMap(map['mode']);
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('iv') && (map['iv'] != null)) {
      _iv = map['iv'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_mode != null) {
      map['mode'] = _mode;
    }
    if (_iv != null) {
      map['iv'] = _iv;
    }
    return map;
  }
}

class ParamsOfFactorize extends TonSdkStructure {
  ///Hexadecimal representation of u64 composite number.
  String _composite;
  String get composite => _composite;
  ParamsOfFactorize({
    @required String composite,
  }) {
    _composite =
        ArgumentError.checkNotNull(composite, 'ParamsOfFactorize composite');
  }
  ParamsOfFactorize.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('composite') && (map['composite'] != null)) {
      _composite = map['composite'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_composite != null) {
      map['composite'] = _composite;
    }
    return map;
  }
}

class ResultOfFactorize extends TonSdkStructure {
  ///Two factors of composite or empty if composite can't be factorized.
  List<String> _factors;
  List<String> get factors => _factors;
  ResultOfFactorize({
    @required List<String> factors,
  }) {
    _factors = ArgumentError.checkNotNull(factors, 'ResultOfFactorize factors');
  }
  ResultOfFactorize.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('factors') && (map['factors'] != null)) {
      _factors = [];
      for (var el in map['factors']) {
        if (el != null) {
          _factors.add(el);
        } else {
          _factors.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_factors != null) {
      map['factors'] = _factors;
    }
    return map;
  }
}

class ParamsOfModularPower extends TonSdkStructure {
  ///`base` argument of calculation.
  String _base;
  String get base => _base;

  ///`exponent` argument of calculation.
  String _exponent;
  String get exponent => _exponent;

  ///`modulus` argument of calculation.
  String _modulus;
  String get modulus => _modulus;
  ParamsOfModularPower({
    @required String base,
    @required String exponent,
    @required String modulus,
  }) {
    _base = ArgumentError.checkNotNull(base, 'ParamsOfModularPower base');
    _exponent =
        ArgumentError.checkNotNull(exponent, 'ParamsOfModularPower exponent');
    _modulus =
        ArgumentError.checkNotNull(modulus, 'ParamsOfModularPower modulus');
  }
  ParamsOfModularPower.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('base') && (map['base'] != null)) {
      _base = map['base'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('exponent') && (map['exponent'] != null)) {
      _exponent = map['exponent'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('modulus') && (map['modulus'] != null)) {
      _modulus = map['modulus'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_base != null) {
      map['base'] = _base;
    }
    if (_exponent != null) {
      map['exponent'] = _exponent;
    }
    if (_modulus != null) {
      map['modulus'] = _modulus;
    }
    return map;
  }
}

class ResultOfModularPower extends TonSdkStructure {
  ///Result of modular exponentiation
  String _modular_power;
  String get modular_power => _modular_power;
  ResultOfModularPower({
    @required String modular_power,
  }) {
    _modular_power = ArgumentError.checkNotNull(
        modular_power, 'ResultOfModularPower modular_power');
  }
  ResultOfModularPower.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('modular_power') && (map['modular_power'] != null)) {
      _modular_power = map['modular_power'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_modular_power != null) {
      map['modular_power'] = _modular_power;
    }
    return map;
  }
}

class ParamsOfTonCrc16 extends TonSdkStructure {
  ///Encoded with `base64`.
  String _data;
  String get data => _data;
  ParamsOfTonCrc16({
    @required String data,
  }) {
    _data = ArgumentError.checkNotNull(data, 'ParamsOfTonCrc16 data');
  }
  ParamsOfTonCrc16.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('data') && (map['data'] != null)) {
      _data = map['data'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_data != null) {
      map['data'] = _data;
    }
    return map;
  }
}

class ResultOfTonCrc16 extends TonSdkStructure {
  ///Calculated CRC for input data.
  int _crc;
  int get crc => _crc;
  ResultOfTonCrc16({
    @required int crc,
  }) {
    _crc = ArgumentError.checkNotNull(crc, 'ResultOfTonCrc16 crc');
  }
  ResultOfTonCrc16.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('crc') && (map['crc'] != null)) {
      _crc = map['crc'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_crc != null) {
      map['crc'] = _crc;
    }
    return map;
  }
}

class ParamsOfGenerateRandomBytes extends TonSdkStructure {
  ///Size of random byte array.
  int _length;
  int get length => _length;
  ParamsOfGenerateRandomBytes({
    @required int length,
  }) {
    _length = ArgumentError.checkNotNull(
        length, 'ParamsOfGenerateRandomBytes length');
  }
  ParamsOfGenerateRandomBytes.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('length') && (map['length'] != null)) {
      _length = map['length'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_length != null) {
      map['length'] = _length;
    }
    return map;
  }
}

class ResultOfGenerateRandomBytes extends TonSdkStructure {
  ///Generated bytes encoded in `base64`.
  String _bytes;
  String get bytes => _bytes;
  ResultOfGenerateRandomBytes({
    @required String bytes,
  }) {
    _bytes =
        ArgumentError.checkNotNull(bytes, 'ResultOfGenerateRandomBytes bytes');
  }
  ResultOfGenerateRandomBytes.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('bytes') && (map['bytes'] != null)) {
      _bytes = map['bytes'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_bytes != null) {
      map['bytes'] = _bytes;
    }
    return map;
  }
}

class ParamsOfConvertPublicKeyToTonSafeFormat extends TonSdkStructure {
  ///Public key - 64 symbols hex string
  String _public_key;
  String get public_key => _public_key;
  ParamsOfConvertPublicKeyToTonSafeFormat({
    @required String public_key,
  }) {
    _public_key = ArgumentError.checkNotNull(
        public_key, 'ParamsOfConvertPublicKeyToTonSafeFormat public_key');
  }
  ParamsOfConvertPublicKeyToTonSafeFormat.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('public_key') && (map['public_key'] != null)) {
      _public_key = map['public_key'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_public_key != null) {
      map['public_key'] = _public_key;
    }
    return map;
  }
}

class ResultOfConvertPublicKeyToTonSafeFormat extends TonSdkStructure {
  ///Public key represented in TON safe format.
  String _ton_public_key;
  String get ton_public_key => _ton_public_key;
  ResultOfConvertPublicKeyToTonSafeFormat({
    @required String ton_public_key,
  }) {
    _ton_public_key = ArgumentError.checkNotNull(ton_public_key,
        'ResultOfConvertPublicKeyToTonSafeFormat ton_public_key');
  }
  ResultOfConvertPublicKeyToTonSafeFormat.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('ton_public_key') && (map['ton_public_key'] != null)) {
      _ton_public_key = map['ton_public_key'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_ton_public_key != null) {
      map['ton_public_key'] = _ton_public_key;
    }
    return map;
  }
}

class KeyPair extends TonSdkStructure {
  ///Public key - 64 symbols hex string
  String _public;
  String get public => _public;

  ///Private key - u64 symbols hex string
  String _secret;
  String get secret => _secret;
  KeyPair({
    @required String public,
    @required String secret,
  }) {
    _public = ArgumentError.checkNotNull(public, 'KeyPair public');
    _secret = ArgumentError.checkNotNull(secret, 'KeyPair secret');
  }
  KeyPair.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('public') && (map['public'] != null)) {
      _public = map['public'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('secret') && (map['secret'] != null)) {
      _secret = map['secret'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_public != null) {
      map['public'] = _public;
    }
    if (_secret != null) {
      map['secret'] = _secret;
    }
    return map;
  }
}

class ParamsOfSign extends TonSdkStructure {
  ///Data that must be signed encoded in `base64`.
  String _unsigned;
  String get unsigned => _unsigned;

  ///Sign keys.
  KeyPair _keys;
  KeyPair get keys => _keys;
  ParamsOfSign({
    @required String unsigned,
    @required KeyPair keys,
  }) {
    _unsigned = ArgumentError.checkNotNull(unsigned, 'ParamsOfSign unsigned');
    _keys = ArgumentError.checkNotNull(keys, 'ParamsOfSign keys');
  }
  ParamsOfSign.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('unsigned') && (map['unsigned'] != null)) {
      _unsigned = map['unsigned'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('keys') && (map['keys'] != null)) {
      _keys = KeyPair.fromMap(map['keys']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_unsigned != null) {
      map['unsigned'] = _unsigned;
    }
    if (_keys != null) {
      map['keys'] = _keys;
    }
    return map;
  }
}

class ResultOfSign extends TonSdkStructure {
  ///Signed data combined with signature encoded in `base64`.
  String _signed;
  String get signed => _signed;

  ///Signature encoded in `hex`.
  String _signature;
  String get signature => _signature;
  ResultOfSign({
    @required String signed,
    @required String signature,
  }) {
    _signed = ArgumentError.checkNotNull(signed, 'ResultOfSign signed');
    _signature =
        ArgumentError.checkNotNull(signature, 'ResultOfSign signature');
  }
  ResultOfSign.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('signed') && (map['signed'] != null)) {
      _signed = map['signed'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('signature') && (map['signature'] != null)) {
      _signature = map['signature'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_signed != null) {
      map['signed'] = _signed;
    }
    if (_signature != null) {
      map['signature'] = _signature;
    }
    return map;
  }
}

class ParamsOfVerifySignature extends TonSdkStructure {
  ///Signed data that must be verified encoded in `base64`.
  String _signed;
  String get signed => _signed;

  ///Signer's public key - 64 symbols hex string
  String _public;
  String get public => _public;
  ParamsOfVerifySignature({
    @required String signed,
    @required String public,
  }) {
    _signed =
        ArgumentError.checkNotNull(signed, 'ParamsOfVerifySignature signed');
    _public =
        ArgumentError.checkNotNull(public, 'ParamsOfVerifySignature public');
  }
  ParamsOfVerifySignature.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('signed') && (map['signed'] != null)) {
      _signed = map['signed'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('public') && (map['public'] != null)) {
      _public = map['public'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_signed != null) {
      map['signed'] = _signed;
    }
    if (_public != null) {
      map['public'] = _public;
    }
    return map;
  }
}

class ResultOfVerifySignature extends TonSdkStructure {
  ///Unsigned data encoded in `base64`.
  String _unsigned;
  String get unsigned => _unsigned;
  ResultOfVerifySignature({
    @required String unsigned,
  }) {
    _unsigned = ArgumentError.checkNotNull(
        unsigned, 'ResultOfVerifySignature unsigned');
  }
  ResultOfVerifySignature.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('unsigned') && (map['unsigned'] != null)) {
      _unsigned = map['unsigned'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_unsigned != null) {
      map['unsigned'] = _unsigned;
    }
    return map;
  }
}

class ParamsOfHash extends TonSdkStructure {
  ///Encoded with `base64`.
  String _data;
  String get data => _data;
  ParamsOfHash({
    @required String data,
  }) {
    _data = ArgumentError.checkNotNull(data, 'ParamsOfHash data');
  }
  ParamsOfHash.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('data') && (map['data'] != null)) {
      _data = map['data'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_data != null) {
      map['data'] = _data;
    }
    return map;
  }
}

class ResultOfHash extends TonSdkStructure {
  ///Encoded with 'hex'.
  String _hash;
  String get hash => _hash;
  ResultOfHash({
    @required String hash,
  }) {
    _hash = ArgumentError.checkNotNull(hash, 'ResultOfHash hash');
  }
  ResultOfHash.fromMap(Map<String, dynamic> map) {
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

class ParamsOfScrypt extends TonSdkStructure {
  ///The password bytes to be hashed. Must be encoded with `base64`.
  String _password;
  String get password => _password;

  ///Salt bytes that modify the hash to protect against Rainbow table attacks. Must be encoded with `base64`.
  String _salt;
  String get salt => _salt;

  ///CPU/memory cost parameter
  int _log_n;
  int get log_n => _log_n;

  ///The block size parameter, which fine-tunes sequential memory read size and performance.
  int _r;
  int get r => _r;

  ///Parallelization parameter.
  int _p;
  int get p => _p;

  ///Intended output length in octets of the derived key.
  int _dk_len;
  int get dk_len => _dk_len;
  ParamsOfScrypt({
    @required String password,
    @required String salt,
    @required int log_n,
    @required int r,
    @required int p,
    @required int dk_len,
  }) {
    _password = ArgumentError.checkNotNull(password, 'ParamsOfScrypt password');
    _salt = ArgumentError.checkNotNull(salt, 'ParamsOfScrypt salt');
    _log_n = ArgumentError.checkNotNull(log_n, 'ParamsOfScrypt log_n');
    _r = ArgumentError.checkNotNull(r, 'ParamsOfScrypt r');
    _p = ArgumentError.checkNotNull(p, 'ParamsOfScrypt p');
    _dk_len = ArgumentError.checkNotNull(dk_len, 'ParamsOfScrypt dk_len');
  }
  ParamsOfScrypt.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('password') && (map['password'] != null)) {
      _password = map['password'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('salt') && (map['salt'] != null)) {
      _salt = map['salt'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('log_n') && (map['log_n'] != null)) {
      _log_n = map['log_n'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('r') && (map['r'] != null)) {
      _r = map['r'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('p') && (map['p'] != null)) {
      _p = map['p'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('dk_len') && (map['dk_len'] != null)) {
      _dk_len = map['dk_len'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_password != null) {
      map['password'] = _password;
    }
    if (_salt != null) {
      map['salt'] = _salt;
    }
    if (_log_n != null) {
      map['log_n'] = _log_n;
    }
    if (_r != null) {
      map['r'] = _r;
    }
    if (_p != null) {
      map['p'] = _p;
    }
    if (_dk_len != null) {
      map['dk_len'] = _dk_len;
    }
    return map;
  }
}

class ResultOfScrypt extends TonSdkStructure {
  ///Encoded with `hex`.
  String _key;
  String get key => _key;
  ResultOfScrypt({
    @required String key,
  }) {
    _key = ArgumentError.checkNotNull(key, 'ResultOfScrypt key');
  }
  ResultOfScrypt.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('key') && (map['key'] != null)) {
      _key = map['key'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_key != null) {
      map['key'] = _key;
    }
    return map;
  }
}

class ParamsOfNaclSignKeyPairFromSecret extends TonSdkStructure {
  ///Secret key - unprefixed 0-padded to 64 symbols hex string
  String _secret;
  String get secret => _secret;
  ParamsOfNaclSignKeyPairFromSecret({
    @required String secret,
  }) {
    _secret = ArgumentError.checkNotNull(
        secret, 'ParamsOfNaclSignKeyPairFromSecret secret');
  }
  ParamsOfNaclSignKeyPairFromSecret.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('secret') && (map['secret'] != null)) {
      _secret = map['secret'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_secret != null) {
      map['secret'] = _secret;
    }
    return map;
  }
}

class ParamsOfNaclSign extends TonSdkStructure {
  ///Data that must be signed encoded in `base64`.
  String _unsigned;
  String get unsigned => _unsigned;

  ///Signer's secret key - unprefixed 0-padded to 128 symbols hex string (concatenation of 64 symbols secret and 64 symbols public keys). See `nacl_sign_keypair_from_secret_key`.
  String _secret;
  String get secret => _secret;
  ParamsOfNaclSign({
    @required String unsigned,
    @required String secret,
  }) {
    _unsigned =
        ArgumentError.checkNotNull(unsigned, 'ParamsOfNaclSign unsigned');
    _secret = ArgumentError.checkNotNull(secret, 'ParamsOfNaclSign secret');
  }
  ParamsOfNaclSign.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('unsigned') && (map['unsigned'] != null)) {
      _unsigned = map['unsigned'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('secret') && (map['secret'] != null)) {
      _secret = map['secret'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_unsigned != null) {
      map['unsigned'] = _unsigned;
    }
    if (_secret != null) {
      map['secret'] = _secret;
    }
    return map;
  }
}

class ResultOfNaclSign extends TonSdkStructure {
  ///Signed data, encoded in `base64`.
  String _signed;
  String get signed => _signed;
  ResultOfNaclSign({
    @required String signed,
  }) {
    _signed = ArgumentError.checkNotNull(signed, 'ResultOfNaclSign signed');
  }
  ResultOfNaclSign.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('signed') && (map['signed'] != null)) {
      _signed = map['signed'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_signed != null) {
      map['signed'] = _signed;
    }
    return map;
  }
}

class ParamsOfNaclSignOpen extends TonSdkStructure {
  ///Encoded with `base64`.
  String _signed;
  String get signed => _signed;

  ///Signer's public key - unprefixed 0-padded to 64 symbols hex string
  String _public;
  String get public => _public;
  ParamsOfNaclSignOpen({
    @required String signed,
    @required String public,
  }) {
    _signed = ArgumentError.checkNotNull(signed, 'ParamsOfNaclSignOpen signed');
    _public = ArgumentError.checkNotNull(public, 'ParamsOfNaclSignOpen public');
  }
  ParamsOfNaclSignOpen.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('signed') && (map['signed'] != null)) {
      _signed = map['signed'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('public') && (map['public'] != null)) {
      _public = map['public'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_signed != null) {
      map['signed'] = _signed;
    }
    if (_public != null) {
      map['public'] = _public;
    }
    return map;
  }
}

class ResultOfNaclSignOpen extends TonSdkStructure {
  ///Unsigned data, encoded in `base64`.
  String _unsigned;
  String get unsigned => _unsigned;
  ResultOfNaclSignOpen({
    @required String unsigned,
  }) {
    _unsigned =
        ArgumentError.checkNotNull(unsigned, 'ResultOfNaclSignOpen unsigned');
  }
  ResultOfNaclSignOpen.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('unsigned') && (map['unsigned'] != null)) {
      _unsigned = map['unsigned'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_unsigned != null) {
      map['unsigned'] = _unsigned;
    }
    return map;
  }
}

class ResultOfNaclSignDetached extends TonSdkStructure {
  ///Signature encoded in `hex`.
  String _signature;
  String get signature => _signature;
  ResultOfNaclSignDetached({
    @required String signature,
  }) {
    _signature = ArgumentError.checkNotNull(
        signature, 'ResultOfNaclSignDetached signature');
  }
  ResultOfNaclSignDetached.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('signature') && (map['signature'] != null)) {
      _signature = map['signature'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_signature != null) {
      map['signature'] = _signature;
    }
    return map;
  }
}

class ParamsOfNaclSignDetachedVerify extends TonSdkStructure {
  ///Encoded with `base64`.
  String _unsigned;
  String get unsigned => _unsigned;

  ///Encoded with `hex`.
  String _signature;
  String get signature => _signature;

  ///Signer's public key - unprefixed 0-padded to 64 symbols hex string.
  String _public;
  String get public => _public;
  ParamsOfNaclSignDetachedVerify({
    @required String unsigned,
    @required String signature,
    @required String public,
  }) {
    _unsigned = ArgumentError.checkNotNull(
        unsigned, 'ParamsOfNaclSignDetachedVerify unsigned');
    _signature = ArgumentError.checkNotNull(
        signature, 'ParamsOfNaclSignDetachedVerify signature');
    _public = ArgumentError.checkNotNull(
        public, 'ParamsOfNaclSignDetachedVerify public');
  }
  ParamsOfNaclSignDetachedVerify.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('unsigned') && (map['unsigned'] != null)) {
      _unsigned = map['unsigned'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('signature') && (map['signature'] != null)) {
      _signature = map['signature'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('public') && (map['public'] != null)) {
      _public = map['public'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_unsigned != null) {
      map['unsigned'] = _unsigned;
    }
    if (_signature != null) {
      map['signature'] = _signature;
    }
    if (_public != null) {
      map['public'] = _public;
    }
    return map;
  }
}

class ResultOfNaclSignDetachedVerify extends TonSdkStructure {
  ///`true` if verification succeeded or `false` if it failed
  bool _succeeded;
  bool get succeeded => _succeeded;
  ResultOfNaclSignDetachedVerify({
    @required bool succeeded,
  }) {
    _succeeded = ArgumentError.checkNotNull(
        succeeded, 'ResultOfNaclSignDetachedVerify succeeded');
  }
  ResultOfNaclSignDetachedVerify.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('succeeded') && (map['succeeded'] != null)) {
      _succeeded = map['succeeded'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_succeeded != null) {
      map['succeeded'] = _succeeded;
    }
    return map;
  }
}

class ParamsOfNaclBoxKeyPairFromSecret extends TonSdkStructure {
  ///Secret key - unprefixed 0-padded to 64 symbols hex string
  String _secret;
  String get secret => _secret;
  ParamsOfNaclBoxKeyPairFromSecret({
    @required String secret,
  }) {
    _secret = ArgumentError.checkNotNull(
        secret, 'ParamsOfNaclBoxKeyPairFromSecret secret');
  }
  ParamsOfNaclBoxKeyPairFromSecret.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('secret') && (map['secret'] != null)) {
      _secret = map['secret'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_secret != null) {
      map['secret'] = _secret;
    }
    return map;
  }
}

class ParamsOfNaclBox extends TonSdkStructure {
  ///Data that must be encrypted encoded in `base64`.
  String _decrypted;
  String get decrypted => _decrypted;

  ///Nonce, encoded in `hex`
  String _nonce;
  String get nonce => _nonce;

  ///Receiver's public key - unprefixed 0-padded to 64 symbols hex string
  String _their_public;
  String get their_public => _their_public;

  ///Sender's private key - unprefixed 0-padded to 64 symbols hex string
  String _secret;
  String get secret => _secret;
  ParamsOfNaclBox({
    @required String decrypted,
    @required String nonce,
    @required String their_public,
    @required String secret,
  }) {
    _decrypted =
        ArgumentError.checkNotNull(decrypted, 'ParamsOfNaclBox decrypted');
    _nonce = ArgumentError.checkNotNull(nonce, 'ParamsOfNaclBox nonce');
    _their_public = ArgumentError.checkNotNull(
        their_public, 'ParamsOfNaclBox their_public');
    _secret = ArgumentError.checkNotNull(secret, 'ParamsOfNaclBox secret');
  }
  ParamsOfNaclBox.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('decrypted') && (map['decrypted'] != null)) {
      _decrypted = map['decrypted'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('nonce') && (map['nonce'] != null)) {
      _nonce = map['nonce'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('their_public') && (map['their_public'] != null)) {
      _their_public = map['their_public'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('secret') && (map['secret'] != null)) {
      _secret = map['secret'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_decrypted != null) {
      map['decrypted'] = _decrypted;
    }
    if (_nonce != null) {
      map['nonce'] = _nonce;
    }
    if (_their_public != null) {
      map['their_public'] = _their_public;
    }
    if (_secret != null) {
      map['secret'] = _secret;
    }
    return map;
  }
}

class ResultOfNaclBox extends TonSdkStructure {
  ///Encrypted data encoded in `base64`.
  String _encrypted;
  String get encrypted => _encrypted;
  ResultOfNaclBox({
    @required String encrypted,
  }) {
    _encrypted =
        ArgumentError.checkNotNull(encrypted, 'ResultOfNaclBox encrypted');
  }
  ResultOfNaclBox.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('encrypted') && (map['encrypted'] != null)) {
      _encrypted = map['encrypted'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_encrypted != null) {
      map['encrypted'] = _encrypted;
    }
    return map;
  }
}

class ParamsOfNaclBoxOpen extends TonSdkStructure {
  ///Encoded with `base64`.
  String _encrypted;
  String get encrypted => _encrypted;
  String _nonce;
  String get nonce => _nonce;

  ///Sender's public key - unprefixed 0-padded to 64 symbols hex string
  String _their_public;
  String get their_public => _their_public;

  ///Receiver's private key - unprefixed 0-padded to 64 symbols hex string
  String _secret;
  String get secret => _secret;
  ParamsOfNaclBoxOpen({
    @required String encrypted,
    @required String nonce,
    @required String their_public,
    @required String secret,
  }) {
    _encrypted =
        ArgumentError.checkNotNull(encrypted, 'ParamsOfNaclBoxOpen encrypted');
    _nonce = ArgumentError.checkNotNull(nonce, 'ParamsOfNaclBoxOpen nonce');
    _their_public = ArgumentError.checkNotNull(
        their_public, 'ParamsOfNaclBoxOpen their_public');
    _secret = ArgumentError.checkNotNull(secret, 'ParamsOfNaclBoxOpen secret');
  }
  ParamsOfNaclBoxOpen.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('encrypted') && (map['encrypted'] != null)) {
      _encrypted = map['encrypted'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('nonce') && (map['nonce'] != null)) {
      _nonce = map['nonce'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('their_public') && (map['their_public'] != null)) {
      _their_public = map['their_public'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('secret') && (map['secret'] != null)) {
      _secret = map['secret'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_encrypted != null) {
      map['encrypted'] = _encrypted;
    }
    if (_nonce != null) {
      map['nonce'] = _nonce;
    }
    if (_their_public != null) {
      map['their_public'] = _their_public;
    }
    if (_secret != null) {
      map['secret'] = _secret;
    }
    return map;
  }
}

class ResultOfNaclBoxOpen extends TonSdkStructure {
  ///Decrypted data encoded in `base64`.
  String _decrypted;
  String get decrypted => _decrypted;
  ResultOfNaclBoxOpen({
    @required String decrypted,
  }) {
    _decrypted =
        ArgumentError.checkNotNull(decrypted, 'ResultOfNaclBoxOpen decrypted');
  }
  ResultOfNaclBoxOpen.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('decrypted') && (map['decrypted'] != null)) {
      _decrypted = map['decrypted'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_decrypted != null) {
      map['decrypted'] = _decrypted;
    }
    return map;
  }
}

class ParamsOfNaclSecretBox extends TonSdkStructure {
  ///Encoded with `base64`.
  String _decrypted;
  String get decrypted => _decrypted;

  ///Nonce in `hex`
  String _nonce;
  String get nonce => _nonce;

  ///Secret key - unprefixed 0-padded to 64 symbols hex string
  String _key;
  String get key => _key;
  ParamsOfNaclSecretBox({
    @required String decrypted,
    @required String nonce,
    @required String key,
  }) {
    _decrypted = ArgumentError.checkNotNull(
        decrypted, 'ParamsOfNaclSecretBox decrypted');
    _nonce = ArgumentError.checkNotNull(nonce, 'ParamsOfNaclSecretBox nonce');
    _key = ArgumentError.checkNotNull(key, 'ParamsOfNaclSecretBox key');
  }
  ParamsOfNaclSecretBox.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('decrypted') && (map['decrypted'] != null)) {
      _decrypted = map['decrypted'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('nonce') && (map['nonce'] != null)) {
      _nonce = map['nonce'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('key') && (map['key'] != null)) {
      _key = map['key'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_decrypted != null) {
      map['decrypted'] = _decrypted;
    }
    if (_nonce != null) {
      map['nonce'] = _nonce;
    }
    if (_key != null) {
      map['key'] = _key;
    }
    return map;
  }
}

class ParamsOfNaclSecretBoxOpen extends TonSdkStructure {
  ///Encoded with `base64`.
  String _encrypted;
  String get encrypted => _encrypted;

  ///Nonce in `hex`
  String _nonce;
  String get nonce => _nonce;

  ///Public key - unprefixed 0-padded to 64 symbols hex string
  String _key;
  String get key => _key;
  ParamsOfNaclSecretBoxOpen({
    @required String encrypted,
    @required String nonce,
    @required String key,
  }) {
    _encrypted = ArgumentError.checkNotNull(
        encrypted, 'ParamsOfNaclSecretBoxOpen encrypted');
    _nonce =
        ArgumentError.checkNotNull(nonce, 'ParamsOfNaclSecretBoxOpen nonce');
    _key = ArgumentError.checkNotNull(key, 'ParamsOfNaclSecretBoxOpen key');
  }
  ParamsOfNaclSecretBoxOpen.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('encrypted') && (map['encrypted'] != null)) {
      _encrypted = map['encrypted'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('nonce') && (map['nonce'] != null)) {
      _nonce = map['nonce'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('key') && (map['key'] != null)) {
      _key = map['key'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_encrypted != null) {
      map['encrypted'] = _encrypted;
    }
    if (_nonce != null) {
      map['nonce'] = _nonce;
    }
    if (_key != null) {
      map['key'] = _key;
    }
    return map;
  }
}

class ParamsOfMnemonicWords extends TonSdkStructure {
  ///Dictionary identifier
  int _dictionary;
  int get dictionary => _dictionary;
  ParamsOfMnemonicWords({
    int dictionary,
  }) {
    _dictionary = dictionary;
  }
  ParamsOfMnemonicWords.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('dictionary') && (map['dictionary'] != null)) {
      _dictionary = map['dictionary'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_dictionary != null) {
      map['dictionary'] = _dictionary;
    }
    return map;
  }
}

class ResultOfMnemonicWords extends TonSdkStructure {
  ///The list of mnemonic words
  String _words;
  String get words => _words;
  ResultOfMnemonicWords({
    @required String words,
  }) {
    _words = ArgumentError.checkNotNull(words, 'ResultOfMnemonicWords words');
  }
  ResultOfMnemonicWords.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('words') && (map['words'] != null)) {
      _words = map['words'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_words != null) {
      map['words'] = _words;
    }
    return map;
  }
}

class ParamsOfMnemonicFromRandom extends TonSdkStructure {
  ///Dictionary identifier
  int _dictionary;
  int get dictionary => _dictionary;

  ///Mnemonic word count
  int _word_count;
  int get word_count => _word_count;
  ParamsOfMnemonicFromRandom({
    int dictionary,
    int word_count,
  }) {
    _dictionary = dictionary;
    _word_count = word_count;
  }
  ParamsOfMnemonicFromRandom.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('dictionary') && (map['dictionary'] != null)) {
      _dictionary = map['dictionary'];
    }
    if (map.containsKey('word_count') && (map['word_count'] != null)) {
      _word_count = map['word_count'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_dictionary != null) {
      map['dictionary'] = _dictionary;
    }
    if (_word_count != null) {
      map['word_count'] = _word_count;
    }
    return map;
  }
}

class ResultOfMnemonicFromRandom extends TonSdkStructure {
  ///String of mnemonic words
  String _phrase;
  String get phrase => _phrase;
  ResultOfMnemonicFromRandom({
    @required String phrase,
  }) {
    _phrase =
        ArgumentError.checkNotNull(phrase, 'ResultOfMnemonicFromRandom phrase');
  }
  ResultOfMnemonicFromRandom.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('phrase') && (map['phrase'] != null)) {
      _phrase = map['phrase'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_phrase != null) {
      map['phrase'] = _phrase;
    }
    return map;
  }
}

class ParamsOfMnemonicFromEntropy extends TonSdkStructure {
  ///Hex encoded.
  String _entropy;
  String get entropy => _entropy;

  ///Dictionary identifier
  int _dictionary;
  int get dictionary => _dictionary;

  ///Mnemonic word count
  int _word_count;
  int get word_count => _word_count;
  ParamsOfMnemonicFromEntropy({
    @required String entropy,
    int dictionary,
    int word_count,
  }) {
    _entropy = ArgumentError.checkNotNull(
        entropy, 'ParamsOfMnemonicFromEntropy entropy');
    _dictionary = dictionary;
    _word_count = word_count;
  }
  ParamsOfMnemonicFromEntropy.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('entropy') && (map['entropy'] != null)) {
      _entropy = map['entropy'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('dictionary') && (map['dictionary'] != null)) {
      _dictionary = map['dictionary'];
    }
    if (map.containsKey('word_count') && (map['word_count'] != null)) {
      _word_count = map['word_count'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_entropy != null) {
      map['entropy'] = _entropy;
    }
    if (_dictionary != null) {
      map['dictionary'] = _dictionary;
    }
    if (_word_count != null) {
      map['word_count'] = _word_count;
    }
    return map;
  }
}

class ResultOfMnemonicFromEntropy extends TonSdkStructure {
  ///Phrase
  String _phrase;
  String get phrase => _phrase;
  ResultOfMnemonicFromEntropy({
    @required String phrase,
  }) {
    _phrase = ArgumentError.checkNotNull(
        phrase, 'ResultOfMnemonicFromEntropy phrase');
  }
  ResultOfMnemonicFromEntropy.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('phrase') && (map['phrase'] != null)) {
      _phrase = map['phrase'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_phrase != null) {
      map['phrase'] = _phrase;
    }
    return map;
  }
}

class ParamsOfMnemonicVerify extends TonSdkStructure {
  ///Phrase
  String _phrase;
  String get phrase => _phrase;

  ///Dictionary identifier
  int _dictionary;
  int get dictionary => _dictionary;

  ///Word count
  int _word_count;
  int get word_count => _word_count;
  ParamsOfMnemonicVerify({
    @required String phrase,
    int dictionary,
    int word_count,
  }) {
    _phrase =
        ArgumentError.checkNotNull(phrase, 'ParamsOfMnemonicVerify phrase');
    _dictionary = dictionary;
    _word_count = word_count;
  }
  ParamsOfMnemonicVerify.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('phrase') && (map['phrase'] != null)) {
      _phrase = map['phrase'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('dictionary') && (map['dictionary'] != null)) {
      _dictionary = map['dictionary'];
    }
    if (map.containsKey('word_count') && (map['word_count'] != null)) {
      _word_count = map['word_count'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_phrase != null) {
      map['phrase'] = _phrase;
    }
    if (_dictionary != null) {
      map['dictionary'] = _dictionary;
    }
    if (_word_count != null) {
      map['word_count'] = _word_count;
    }
    return map;
  }
}

class ResultOfMnemonicVerify extends TonSdkStructure {
  ///Flag indicating if the mnemonic is valid or not
  bool _valid;
  bool get valid => _valid;
  ResultOfMnemonicVerify({
    @required bool valid,
  }) {
    _valid = ArgumentError.checkNotNull(valid, 'ResultOfMnemonicVerify valid');
  }
  ResultOfMnemonicVerify.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('valid') && (map['valid'] != null)) {
      _valid = map['valid'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_valid != null) {
      map['valid'] = _valid;
    }
    return map;
  }
}

class ParamsOfMnemonicDeriveSignKeys extends TonSdkStructure {
  ///Phrase
  String _phrase;
  String get phrase => _phrase;

  ///Derivation path, for instance "m/44'/396'/0'/0/0"
  String _path;
  String get path => _path;

  ///Dictionary identifier
  int _dictionary;
  int get dictionary => _dictionary;

  ///Word count
  int _word_count;
  int get word_count => _word_count;
  ParamsOfMnemonicDeriveSignKeys({
    @required String phrase,
    String path,
    int dictionary,
    int word_count,
  }) {
    _phrase = ArgumentError.checkNotNull(
        phrase, 'ParamsOfMnemonicDeriveSignKeys phrase');
    _path = path;
    _dictionary = dictionary;
    _word_count = word_count;
  }
  ParamsOfMnemonicDeriveSignKeys.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('phrase') && (map['phrase'] != null)) {
      _phrase = map['phrase'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('path') && (map['path'] != null)) {
      _path = map['path'];
    }
    if (map.containsKey('dictionary') && (map['dictionary'] != null)) {
      _dictionary = map['dictionary'];
    }
    if (map.containsKey('word_count') && (map['word_count'] != null)) {
      _word_count = map['word_count'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_phrase != null) {
      map['phrase'] = _phrase;
    }
    if (_path != null) {
      map['path'] = _path;
    }
    if (_dictionary != null) {
      map['dictionary'] = _dictionary;
    }
    if (_word_count != null) {
      map['word_count'] = _word_count;
    }
    return map;
  }
}

class ParamsOfHDKeyXPrvFromMnemonic extends TonSdkStructure {
  ///String with seed phrase
  String _phrase;
  String get phrase => _phrase;

  ///Dictionary identifier
  int _dictionary;
  int get dictionary => _dictionary;

  ///Mnemonic word count
  int _word_count;
  int get word_count => _word_count;
  ParamsOfHDKeyXPrvFromMnemonic({
    @required String phrase,
    int dictionary,
    int word_count,
  }) {
    _phrase = ArgumentError.checkNotNull(
        phrase, 'ParamsOfHDKeyXPrvFromMnemonic phrase');
    _dictionary = dictionary;
    _word_count = word_count;
  }
  ParamsOfHDKeyXPrvFromMnemonic.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('phrase') && (map['phrase'] != null)) {
      _phrase = map['phrase'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('dictionary') && (map['dictionary'] != null)) {
      _dictionary = map['dictionary'];
    }
    if (map.containsKey('word_count') && (map['word_count'] != null)) {
      _word_count = map['word_count'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_phrase != null) {
      map['phrase'] = _phrase;
    }
    if (_dictionary != null) {
      map['dictionary'] = _dictionary;
    }
    if (_word_count != null) {
      map['word_count'] = _word_count;
    }
    return map;
  }
}

class ResultOfHDKeyXPrvFromMnemonic extends TonSdkStructure {
  ///Serialized extended master private key
  String _xprv;
  String get xprv => _xprv;
  ResultOfHDKeyXPrvFromMnemonic({
    @required String xprv,
  }) {
    _xprv =
        ArgumentError.checkNotNull(xprv, 'ResultOfHDKeyXPrvFromMnemonic xprv');
  }
  ResultOfHDKeyXPrvFromMnemonic.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('xprv') && (map['xprv'] != null)) {
      _xprv = map['xprv'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_xprv != null) {
      map['xprv'] = _xprv;
    }
    return map;
  }
}

class ParamsOfHDKeyDeriveFromXPrv extends TonSdkStructure {
  ///Serialized extended private key
  String _xprv;
  String get xprv => _xprv;

  ///Child index (see BIP-0032)
  int _child_index;
  int get child_index => _child_index;

  ///Indicates the derivation of hardened/not-hardened key (see BIP-0032)
  bool _hardened;
  bool get hardened => _hardened;
  ParamsOfHDKeyDeriveFromXPrv({
    @required String xprv,
    @required int child_index,
    @required bool hardened,
  }) {
    _xprv =
        ArgumentError.checkNotNull(xprv, 'ParamsOfHDKeyDeriveFromXPrv xprv');
    _child_index = ArgumentError.checkNotNull(
        child_index, 'ParamsOfHDKeyDeriveFromXPrv child_index');
    _hardened = ArgumentError.checkNotNull(
        hardened, 'ParamsOfHDKeyDeriveFromXPrv hardened');
  }
  ParamsOfHDKeyDeriveFromXPrv.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('xprv') && (map['xprv'] != null)) {
      _xprv = map['xprv'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('child_index') && (map['child_index'] != null)) {
      _child_index = map['child_index'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('hardened') && (map['hardened'] != null)) {
      _hardened = map['hardened'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_xprv != null) {
      map['xprv'] = _xprv;
    }
    if (_child_index != null) {
      map['child_index'] = _child_index;
    }
    if (_hardened != null) {
      map['hardened'] = _hardened;
    }
    return map;
  }
}

class ResultOfHDKeyDeriveFromXPrv extends TonSdkStructure {
  ///Serialized extended private key
  String _xprv;
  String get xprv => _xprv;
  ResultOfHDKeyDeriveFromXPrv({
    @required String xprv,
  }) {
    _xprv =
        ArgumentError.checkNotNull(xprv, 'ResultOfHDKeyDeriveFromXPrv xprv');
  }
  ResultOfHDKeyDeriveFromXPrv.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('xprv') && (map['xprv'] != null)) {
      _xprv = map['xprv'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_xprv != null) {
      map['xprv'] = _xprv;
    }
    return map;
  }
}

class ParamsOfHDKeyDeriveFromXPrvPath extends TonSdkStructure {
  ///Serialized extended private key
  String _xprv;
  String get xprv => _xprv;

  ///Derivation path, for instance "m/44'/396'/0'/0/0"
  String _path;
  String get path => _path;
  ParamsOfHDKeyDeriveFromXPrvPath({
    @required String xprv,
    @required String path,
  }) {
    _xprv = ArgumentError.checkNotNull(
        xprv, 'ParamsOfHDKeyDeriveFromXPrvPath xprv');
    _path = ArgumentError.checkNotNull(
        path, 'ParamsOfHDKeyDeriveFromXPrvPath path');
  }
  ParamsOfHDKeyDeriveFromXPrvPath.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('xprv') && (map['xprv'] != null)) {
      _xprv = map['xprv'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('path') && (map['path'] != null)) {
      _path = map['path'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_xprv != null) {
      map['xprv'] = _xprv;
    }
    if (_path != null) {
      map['path'] = _path;
    }
    return map;
  }
}

class ResultOfHDKeyDeriveFromXPrvPath extends TonSdkStructure {
  ///Derived serialized extended private key
  String _xprv;
  String get xprv => _xprv;
  ResultOfHDKeyDeriveFromXPrvPath({
    @required String xprv,
  }) {
    _xprv = ArgumentError.checkNotNull(
        xprv, 'ResultOfHDKeyDeriveFromXPrvPath xprv');
  }
  ResultOfHDKeyDeriveFromXPrvPath.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('xprv') && (map['xprv'] != null)) {
      _xprv = map['xprv'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_xprv != null) {
      map['xprv'] = _xprv;
    }
    return map;
  }
}

class ParamsOfHDKeySecretFromXPrv extends TonSdkStructure {
  ///Serialized extended private key
  String _xprv;
  String get xprv => _xprv;
  ParamsOfHDKeySecretFromXPrv({
    @required String xprv,
  }) {
    _xprv =
        ArgumentError.checkNotNull(xprv, 'ParamsOfHDKeySecretFromXPrv xprv');
  }
  ParamsOfHDKeySecretFromXPrv.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('xprv') && (map['xprv'] != null)) {
      _xprv = map['xprv'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_xprv != null) {
      map['xprv'] = _xprv;
    }
    return map;
  }
}

class ResultOfHDKeySecretFromXPrv extends TonSdkStructure {
  ///Private key - 64 symbols hex string
  String _secret;
  String get secret => _secret;
  ResultOfHDKeySecretFromXPrv({
    @required String secret,
  }) {
    _secret = ArgumentError.checkNotNull(
        secret, 'ResultOfHDKeySecretFromXPrv secret');
  }
  ResultOfHDKeySecretFromXPrv.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('secret') && (map['secret'] != null)) {
      _secret = map['secret'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_secret != null) {
      map['secret'] = _secret;
    }
    return map;
  }
}

class ParamsOfHDKeyPublicFromXPrv extends TonSdkStructure {
  ///Serialized extended private key
  String _xprv;
  String get xprv => _xprv;
  ParamsOfHDKeyPublicFromXPrv({
    @required String xprv,
  }) {
    _xprv =
        ArgumentError.checkNotNull(xprv, 'ParamsOfHDKeyPublicFromXPrv xprv');
  }
  ParamsOfHDKeyPublicFromXPrv.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('xprv') && (map['xprv'] != null)) {
      _xprv = map['xprv'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_xprv != null) {
      map['xprv'] = _xprv;
    }
    return map;
  }
}

class ResultOfHDKeyPublicFromXPrv extends TonSdkStructure {
  ///Public key - 64 symbols hex string
  String _public;
  String get public => _public;
  ResultOfHDKeyPublicFromXPrv({
    @required String public,
  }) {
    _public = ArgumentError.checkNotNull(
        public, 'ResultOfHDKeyPublicFromXPrv public');
  }
  ResultOfHDKeyPublicFromXPrv.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('public') && (map['public'] != null)) {
      _public = map['public'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_public != null) {
      map['public'] = _public;
    }
    return map;
  }
}

class ParamsOfChaCha20 extends TonSdkStructure {
  ///Must be encoded with `base64`.
  String _data;
  String get data => _data;

  ///Must be encoded with `hex`.
  String _key;
  String get key => _key;

  ///Must be encoded with `hex`.
  String _nonce;
  String get nonce => _nonce;
  ParamsOfChaCha20({
    @required String data,
    @required String key,
    @required String nonce,
  }) {
    _data = ArgumentError.checkNotNull(data, 'ParamsOfChaCha20 data');
    _key = ArgumentError.checkNotNull(key, 'ParamsOfChaCha20 key');
    _nonce = ArgumentError.checkNotNull(nonce, 'ParamsOfChaCha20 nonce');
  }
  ParamsOfChaCha20.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('data') && (map['data'] != null)) {
      _data = map['data'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('key') && (map['key'] != null)) {
      _key = map['key'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('nonce') && (map['nonce'] != null)) {
      _nonce = map['nonce'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_data != null) {
      map['data'] = _data;
    }
    if (_key != null) {
      map['key'] = _key;
    }
    if (_nonce != null) {
      map['nonce'] = _nonce;
    }
    return map;
  }
}

class ResultOfChaCha20 extends TonSdkStructure {
  ///Encoded with `base64`.
  String _data;
  String get data => _data;
  ResultOfChaCha20({
    @required String data,
  }) {
    _data = ArgumentError.checkNotNull(data, 'ResultOfChaCha20 data');
  }
  ResultOfChaCha20.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('data') && (map['data'] != null)) {
      _data = map['data'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_data != null) {
      map['data'] = _data;
    }
    return map;
  }
}

class RegisteredSigningBox extends TonSdkStructure {
  ///Handle of the signing box.
  int _handle;
  int get handle => _handle;
  RegisteredSigningBox({
    @required int handle,
  }) {
    _handle = ArgumentError.checkNotNull(handle, 'RegisteredSigningBox handle');
  }
  RegisteredSigningBox.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('handle') && (map['handle'] != null)) {
      _handle = map['handle'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_handle != null) {
      map['handle'] = _handle;
    }
    return map;
  }
}

///Signing box callbacks.
abstract class ParamsOfAppSigningBox extends TonSdkStructure {
  static ParamsOfAppSigningBox fromMap(Map<String, dynamic> map) {
    if (map['type'] == 'GetPublicKey') {
      return ParamsOfAppSigningBox_GetPublicKey.fromMap(map);
    }
    if (map['type'] == 'Sign') {
      return ParamsOfAppSigningBox_Sign.fromMap(map);
    }
    throw ('ParamsOfAppSigningBox unknown from map type');
  }
}

///Get signing box public key
class ParamsOfAppSigningBox_GetPublicKey extends ParamsOfAppSigningBox {
  String _type;
  String get type => _type;
  ParamsOfAppSigningBox_GetPublicKey() {
    _type = 'GetPublicKey';
  }
  ParamsOfAppSigningBox_GetPublicKey.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'GetPublicKey') {
      throw ('Wrong map data');
    } else {
      _type = 'GetPublicKey';
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['type'] = _type;
    return map;
  }
}

///Sign data
class ParamsOfAppSigningBox_Sign extends ParamsOfAppSigningBox {
  String _type;
  String get type => _type;

  ///Data to sign encoded as base64
  String _unsigned;
  String get unsigned => _unsigned;
  ParamsOfAppSigningBox_Sign({
    @required String unsigned,
  }) {
    _type = 'Sign';
    _unsigned = ArgumentError.checkNotNull(
        unsigned, 'ParamsOfAppSigningBox_Sign unsigned');
  }
  ParamsOfAppSigningBox_Sign.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Sign') {
      throw ('Wrong map data');
    } else {
      _type = 'Sign';
    }
    if (map.containsKey('unsigned') && (map['unsigned'] != null)) {
      _unsigned = map['unsigned'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_unsigned != null) {
      map['unsigned'] = _unsigned;
    }
    map['type'] = _type;
    return map;
  }
}

///Returning values from signing box callbacks.
abstract class ResultOfAppSigningBox extends TonSdkStructure {
  static ResultOfAppSigningBox fromMap(Map<String, dynamic> map) {
    if (map['type'] == 'GetPublicKey') {
      return ResultOfAppSigningBox_GetPublicKey.fromMap(map);
    }
    if (map['type'] == 'Sign') {
      return ResultOfAppSigningBox_Sign.fromMap(map);
    }
    throw ('ResultOfAppSigningBox unknown from map type');
  }
}

///Result of getting public key
class ResultOfAppSigningBox_GetPublicKey extends ResultOfAppSigningBox {
  String _type;
  String get type => _type;

  ///Signing box public key
  String _public_key;
  String get public_key => _public_key;
  ResultOfAppSigningBox_GetPublicKey({
    @required String public_key,
  }) {
    _type = 'GetPublicKey';
    _public_key = ArgumentError.checkNotNull(
        public_key, 'ResultOfAppSigningBox_GetPublicKey public_key');
  }
  ResultOfAppSigningBox_GetPublicKey.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'GetPublicKey') {
      throw ('Wrong map data');
    } else {
      _type = 'GetPublicKey';
    }
    if (map.containsKey('public_key') && (map['public_key'] != null)) {
      _public_key = map['public_key'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_public_key != null) {
      map['public_key'] = _public_key;
    }
    map['type'] = _type;
    return map;
  }
}

///Result of signing data
class ResultOfAppSigningBox_Sign extends ResultOfAppSigningBox {
  String _type;
  String get type => _type;

  ///Data signature encoded as hex
  String _signature;
  String get signature => _signature;
  ResultOfAppSigningBox_Sign({
    @required String signature,
  }) {
    _type = 'Sign';
    _signature = ArgumentError.checkNotNull(
        signature, 'ResultOfAppSigningBox_Sign signature');
  }
  ResultOfAppSigningBox_Sign.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Sign') {
      throw ('Wrong map data');
    } else {
      _type = 'Sign';
    }
    if (map.containsKey('signature') && (map['signature'] != null)) {
      _signature = map['signature'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_signature != null) {
      map['signature'] = _signature;
    }
    map['type'] = _type;
    return map;
  }
}

class ResultOfSigningBoxGetPublicKey extends TonSdkStructure {
  ///Encoded with hex
  String _pubkey;
  String get pubkey => _pubkey;
  ResultOfSigningBoxGetPublicKey({
    @required String pubkey,
  }) {
    _pubkey = ArgumentError.checkNotNull(
        pubkey, 'ResultOfSigningBoxGetPublicKey pubkey');
  }
  ResultOfSigningBoxGetPublicKey.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('pubkey') && (map['pubkey'] != null)) {
      _pubkey = map['pubkey'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_pubkey != null) {
      map['pubkey'] = _pubkey;
    }
    return map;
  }
}

class ParamsOfSigningBoxSign extends TonSdkStructure {
  ///Signing Box handle.
  int _signing_box;
  int get signing_box => _signing_box;

  ///Must be encoded with `base64`.
  String _unsigned;
  String get unsigned => _unsigned;
  ParamsOfSigningBoxSign({
    @required int signing_box,
    @required String unsigned,
  }) {
    _signing_box = ArgumentError.checkNotNull(
        signing_box, 'ParamsOfSigningBoxSign signing_box');
    _unsigned =
        ArgumentError.checkNotNull(unsigned, 'ParamsOfSigningBoxSign unsigned');
  }
  ParamsOfSigningBoxSign.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('signing_box') && (map['signing_box'] != null)) {
      _signing_box = map['signing_box'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('unsigned') && (map['unsigned'] != null)) {
      _unsigned = map['unsigned'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_signing_box != null) {
      map['signing_box'] = _signing_box;
    }
    if (_unsigned != null) {
      map['unsigned'] = _unsigned;
    }
    return map;
  }
}

class ResultOfSigningBoxSign extends TonSdkStructure {
  ///Encoded with `hex`.
  String _signature;
  String get signature => _signature;
  ResultOfSigningBoxSign({
    @required String signature,
  }) {
    _signature = ArgumentError.checkNotNull(
        signature, 'ResultOfSigningBoxSign signature');
  }
  ResultOfSigningBoxSign.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('signature') && (map['signature'] != null)) {
      _signature = map['signature'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_signature != null) {
      map['signature'] = _signature;
    }
    return map;
  }
}

class RegisteredEncryptionBox extends TonSdkStructure {
  ///Handle of the encryption box
  int _handle;
  int get handle => _handle;
  RegisteredEncryptionBox({
    @required int handle,
  }) {
    _handle =
        ArgumentError.checkNotNull(handle, 'RegisteredEncryptionBox handle');
  }
  RegisteredEncryptionBox.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('handle') && (map['handle'] != null)) {
      _handle = map['handle'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_handle != null) {
      map['handle'] = _handle;
    }
    return map;
  }
}

///Encryption box callbacks.
abstract class ParamsOfAppEncryptionBox extends TonSdkStructure {
  static ParamsOfAppEncryptionBox fromMap(Map<String, dynamic> map) {
    if (map['type'] == 'GetInfo') {
      return ParamsOfAppEncryptionBox_GetInfo.fromMap(map);
    }
    if (map['type'] == 'Encrypt') {
      return ParamsOfAppEncryptionBox_Encrypt.fromMap(map);
    }
    if (map['type'] == 'Decrypt') {
      return ParamsOfAppEncryptionBox_Decrypt.fromMap(map);
    }
    throw ('ParamsOfAppEncryptionBox unknown from map type');
  }
}

///Get encryption box info
class ParamsOfAppEncryptionBox_GetInfo extends ParamsOfAppEncryptionBox {
  String _type;
  String get type => _type;
  ParamsOfAppEncryptionBox_GetInfo() {
    _type = 'GetInfo';
  }
  ParamsOfAppEncryptionBox_GetInfo.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'GetInfo') {
      throw ('Wrong map data');
    } else {
      _type = 'GetInfo';
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['type'] = _type;
    return map;
  }
}

///Encrypt data
class ParamsOfAppEncryptionBox_Encrypt extends ParamsOfAppEncryptionBox {
  String _type;
  String get type => _type;

  ///Data, encoded in Base64
  String _data;
  String get data => _data;
  ParamsOfAppEncryptionBox_Encrypt({
    @required String data,
  }) {
    _type = 'Encrypt';
    _data = ArgumentError.checkNotNull(
        data, 'ParamsOfAppEncryptionBox_Encrypt data');
  }
  ParamsOfAppEncryptionBox_Encrypt.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Encrypt') {
      throw ('Wrong map data');
    } else {
      _type = 'Encrypt';
    }
    if (map.containsKey('data') && (map['data'] != null)) {
      _data = map['data'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_data != null) {
      map['data'] = _data;
    }
    map['type'] = _type;
    return map;
  }
}

///Decrypt data
class ParamsOfAppEncryptionBox_Decrypt extends ParamsOfAppEncryptionBox {
  String _type;
  String get type => _type;

  ///Data, encoded in Base64
  String _data;
  String get data => _data;
  ParamsOfAppEncryptionBox_Decrypt({
    @required String data,
  }) {
    _type = 'Decrypt';
    _data = ArgumentError.checkNotNull(
        data, 'ParamsOfAppEncryptionBox_Decrypt data');
  }
  ParamsOfAppEncryptionBox_Decrypt.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Decrypt') {
      throw ('Wrong map data');
    } else {
      _type = 'Decrypt';
    }
    if (map.containsKey('data') && (map['data'] != null)) {
      _data = map['data'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_data != null) {
      map['data'] = _data;
    }
    map['type'] = _type;
    return map;
  }
}

///Returning values from signing box callbacks.
abstract class ResultOfAppEncryptionBox extends TonSdkStructure {
  static ResultOfAppEncryptionBox fromMap(Map<String, dynamic> map) {
    if (map['type'] == 'GetInfo') {
      return ResultOfAppEncryptionBox_GetInfo.fromMap(map);
    }
    if (map['type'] == 'Encrypt') {
      return ResultOfAppEncryptionBox_Encrypt.fromMap(map);
    }
    if (map['type'] == 'Decrypt') {
      return ResultOfAppEncryptionBox_Decrypt.fromMap(map);
    }
    throw ('ResultOfAppEncryptionBox unknown from map type');
  }
}

///Result of getting encryption box info
class ResultOfAppEncryptionBox_GetInfo extends ResultOfAppEncryptionBox {
  String _type;
  String get type => _type;
  EncryptionBoxInfo _info;
  EncryptionBoxInfo get info => _info;
  ResultOfAppEncryptionBox_GetInfo({
    @required EncryptionBoxInfo info,
  }) {
    _type = 'GetInfo';
    _info = ArgumentError.checkNotNull(
        info, 'ResultOfAppEncryptionBox_GetInfo info');
  }
  ResultOfAppEncryptionBox_GetInfo.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'GetInfo') {
      throw ('Wrong map data');
    } else {
      _type = 'GetInfo';
    }
    if (map.containsKey('info') && (map['info'] != null)) {
      _info = EncryptionBoxInfo.fromMap(map['info']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_info != null) {
      map['info'] = _info;
    }
    map['type'] = _type;
    return map;
  }
}

///Result of encrypting data
class ResultOfAppEncryptionBox_Encrypt extends ResultOfAppEncryptionBox {
  String _type;
  String get type => _type;

  ///Encrypted data, encoded in Base64
  String _data;
  String get data => _data;
  ResultOfAppEncryptionBox_Encrypt({
    @required String data,
  }) {
    _type = 'Encrypt';
    _data = ArgumentError.checkNotNull(
        data, 'ResultOfAppEncryptionBox_Encrypt data');
  }
  ResultOfAppEncryptionBox_Encrypt.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Encrypt') {
      throw ('Wrong map data');
    } else {
      _type = 'Encrypt';
    }
    if (map.containsKey('data') && (map['data'] != null)) {
      _data = map['data'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_data != null) {
      map['data'] = _data;
    }
    map['type'] = _type;
    return map;
  }
}

///Result of decrypting data
class ResultOfAppEncryptionBox_Decrypt extends ResultOfAppEncryptionBox {
  String _type;
  String get type => _type;

  ///Decrypted data, encoded in Base64
  String _data;
  String get data => _data;
  ResultOfAppEncryptionBox_Decrypt({
    @required String data,
  }) {
    _type = 'Decrypt';
    _data = ArgumentError.checkNotNull(
        data, 'ResultOfAppEncryptionBox_Decrypt data');
  }
  ResultOfAppEncryptionBox_Decrypt.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Decrypt') {
      throw ('Wrong map data');
    } else {
      _type = 'Decrypt';
    }
    if (map.containsKey('data') && (map['data'] != null)) {
      _data = map['data'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_data != null) {
      map['data'] = _data;
    }
    map['type'] = _type;
    return map;
  }
}

class ParamsOfEncryptionBoxGetInfo extends TonSdkStructure {
  ///Encryption box handle
  int _encryption_box;
  int get encryption_box => _encryption_box;
  ParamsOfEncryptionBoxGetInfo({
    @required int encryption_box,
  }) {
    _encryption_box = ArgumentError.checkNotNull(
        encryption_box, 'ParamsOfEncryptionBoxGetInfo encryption_box');
  }
  ParamsOfEncryptionBoxGetInfo.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('encryption_box') && (map['encryption_box'] != null)) {
      _encryption_box = map['encryption_box'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_encryption_box != null) {
      map['encryption_box'] = _encryption_box;
    }
    return map;
  }
}

class ResultOfEncryptionBoxGetInfo extends TonSdkStructure {
  ///Encryption box information
  EncryptionBoxInfo _info;
  EncryptionBoxInfo get info => _info;
  ResultOfEncryptionBoxGetInfo({
    @required EncryptionBoxInfo info,
  }) {
    _info =
        ArgumentError.checkNotNull(info, 'ResultOfEncryptionBoxGetInfo info');
  }
  ResultOfEncryptionBoxGetInfo.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('info') && (map['info'] != null)) {
      _info = EncryptionBoxInfo.fromMap(map['info']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_info != null) {
      map['info'] = _info;
    }
    return map;
  }
}

class ParamsOfEncryptionBoxEncrypt extends TonSdkStructure {
  ///Encryption box handle
  int _encryption_box;
  int get encryption_box => _encryption_box;

  ///Data to be encrypted, encoded in Base64
  String _data;
  String get data => _data;
  ParamsOfEncryptionBoxEncrypt({
    @required int encryption_box,
    @required String data,
  }) {
    _encryption_box = ArgumentError.checkNotNull(
        encryption_box, 'ParamsOfEncryptionBoxEncrypt encryption_box');
    _data =
        ArgumentError.checkNotNull(data, 'ParamsOfEncryptionBoxEncrypt data');
  }
  ParamsOfEncryptionBoxEncrypt.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('encryption_box') && (map['encryption_box'] != null)) {
      _encryption_box = map['encryption_box'];
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
    if (_encryption_box != null) {
      map['encryption_box'] = _encryption_box;
    }
    if (_data != null) {
      map['data'] = _data;
    }
    return map;
  }
}

class ResultOfEncryptionBoxEncrypt extends TonSdkStructure {
  ///Padded to cipher block size
  String _data;
  String get data => _data;
  ResultOfEncryptionBoxEncrypt({
    @required String data,
  }) {
    _data =
        ArgumentError.checkNotNull(data, 'ResultOfEncryptionBoxEncrypt data');
  }
  ResultOfEncryptionBoxEncrypt.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('data') && (map['data'] != null)) {
      _data = map['data'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_data != null) {
      map['data'] = _data;
    }
    return map;
  }
}

class ParamsOfEncryptionBoxDecrypt extends TonSdkStructure {
  ///Encryption box handle
  int _encryption_box;
  int get encryption_box => _encryption_box;

  ///Data to be decrypted, encoded in Base64
  String _data;
  String get data => _data;
  ParamsOfEncryptionBoxDecrypt({
    @required int encryption_box,
    @required String data,
  }) {
    _encryption_box = ArgumentError.checkNotNull(
        encryption_box, 'ParamsOfEncryptionBoxDecrypt encryption_box');
    _data =
        ArgumentError.checkNotNull(data, 'ParamsOfEncryptionBoxDecrypt data');
  }
  ParamsOfEncryptionBoxDecrypt.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('encryption_box') && (map['encryption_box'] != null)) {
      _encryption_box = map['encryption_box'];
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
    if (_encryption_box != null) {
      map['encryption_box'] = _encryption_box;
    }
    if (_data != null) {
      map['data'] = _data;
    }
    return map;
  }
}

class ResultOfEncryptionBoxDecrypt extends TonSdkStructure {
  ///Decrypted data, encoded in Base64.
  String _data;
  String get data => _data;
  ResultOfEncryptionBoxDecrypt({
    @required String data,
  }) {
    _data =
        ArgumentError.checkNotNull(data, 'ResultOfEncryptionBoxDecrypt data');
  }
  ResultOfEncryptionBoxDecrypt.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('data') && (map['data'] != null)) {
      _data = map['data'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_data != null) {
      map['data'] = _data;
    }
    return map;
  }
}

class ParamsOfCreateEncryptionBox extends TonSdkStructure {
  ///Encryption algorithm specifier including cipher parameters (key, IV, etc)
  EncryptionAlgorithm _algorithm;
  EncryptionAlgorithm get algorithm => _algorithm;
  ParamsOfCreateEncryptionBox({
    @required EncryptionAlgorithm algorithm,
  }) {
    _algorithm = ArgumentError.checkNotNull(
        algorithm, 'ParamsOfCreateEncryptionBox algorithm');
  }
  ParamsOfCreateEncryptionBox.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('algorithm') && (map['algorithm'] != null)) {
      _algorithm = EncryptionAlgorithm.fromMap(map['algorithm']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_algorithm != null) {
      map['algorithm'] = _algorithm;
    }
    return map;
  }
}
