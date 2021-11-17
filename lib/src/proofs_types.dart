part of 'tonsdktypes.dart';

class ProofsErrorCode {
  String _value;
  String get value => _value;
  ProofsErrorCode.InvalidData() {
    _value = 'InvalidData';
  }
  ProofsErrorCode.ProofCheckFailed() {
    _value = 'ProofCheckFailed';
  }
  ProofsErrorCode.InternalError() {
    _value = 'InternalError';
  }
  ProofsErrorCode.DataDiffersFromProven() {
    _value = 'DataDiffersFromProven';
  }
  @override
  String toString() {
    return '"$_value"';
  }

  ProofsErrorCode.fromMap(str) {
    _value = str;
  }
}

class ParamsOfProofBlockData extends TonSdkStructure {
  ///Single block's data, retrieved from TONOS API, that needs proof. Required fields are `id` and/or top-level `boc` (for block identification), others are optional.
  dynamic _block;
  dynamic get block => _block;
  ParamsOfProofBlockData({
    @required dynamic block,
  }) {
    _block = ArgumentError.checkNotNull(block, 'ParamsOfProofBlockData block');
  }
  ParamsOfProofBlockData.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('block') && (map['block'] != null)) {
      _block = map['block'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_block != null) {
      map['block'] = _block;
    }
    return map;
  }
}

class ParamsOfProofTransactionData extends TonSdkStructure {
  ///Single transaction's data as queried from DApp server, without modifications. The required fields are `id` and/or top-level `boc`, others are optional. In order to reduce network requests count, it is recommended to provide `block_id` and `boc` of transaction.
  dynamic _transaction;
  dynamic get transaction => _transaction;
  ParamsOfProofTransactionData({
    @required dynamic transaction,
  }) {
    _transaction = ArgumentError.checkNotNull(
        transaction, 'ParamsOfProofTransactionData transaction');
  }
  ParamsOfProofTransactionData.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('transaction') && (map['transaction'] != null)) {
      _transaction = map['transaction'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_transaction != null) {
      map['transaction'] = _transaction;
    }
    return map;
  }
}
