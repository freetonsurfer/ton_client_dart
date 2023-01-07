part of 'tonsdktypes.dart';

class ProcessingErrorCode {
  String _value;
  String get value => _value;
  ProcessingErrorCode.MessageAlreadyExpired() {
    _value = 'MessageAlreadyExpired';
  }
  ProcessingErrorCode.MessageHasNotDestinationAddress() {
    _value = 'MessageHasNotDestinationAddress';
  }
  ProcessingErrorCode.CanNotBuildMessageCell() {
    _value = 'CanNotBuildMessageCell';
  }
  ProcessingErrorCode.FetchBlockFailed() {
    _value = 'FetchBlockFailed';
  }
  ProcessingErrorCode.SendMessageFailed() {
    _value = 'SendMessageFailed';
  }
  ProcessingErrorCode.InvalidMessageBoc() {
    _value = 'InvalidMessageBoc';
  }
  ProcessingErrorCode.MessageExpired() {
    _value = 'MessageExpired';
  }
  ProcessingErrorCode.TransactionWaitTimeout() {
    _value = 'TransactionWaitTimeout';
  }
  ProcessingErrorCode.InvalidBlockReceived() {
    _value = 'InvalidBlockReceived';
  }
  ProcessingErrorCode.CanNotCheckBlockShard() {
    _value = 'CanNotCheckBlockShard';
  }
  ProcessingErrorCode.BlockNotFound() {
    _value = 'BlockNotFound';
  }
  ProcessingErrorCode.InvalidData() {
    _value = 'InvalidData';
  }
  ProcessingErrorCode.ExternalSignerMustNotBeUsed() {
    _value = 'ExternalSignerMustNotBeUsed';
  }
  ProcessingErrorCode.MessageRejected() {
    _value = 'MessageRejected';
  }
  ProcessingErrorCode.InvalidRempStatus() {
    _value = 'InvalidRempStatus';
  }
  ProcessingErrorCode.NextRempStatusTimeout() {
    _value = 'NextRempStatusTimeout';
  }
  @override
  String toString() {
    return '"$_value"';
  }

  ProcessingErrorCode.fromMap(str) {
    _value = str;
  }
}

abstract class ProcessingEvent extends TonSdkStructure {
  static ProcessingEvent fromMap(Map<String, dynamic> map) {
    if (map['type'] == 'WillFetchFirstBlock') {
      return ProcessingEvent_WillFetchFirstBlock.fromMap(map);
    }
    if (map['type'] == 'FetchFirstBlockFailed') {
      return ProcessingEvent_FetchFirstBlockFailed.fromMap(map);
    }
    if (map['type'] == 'WillSend') {
      return ProcessingEvent_WillSend.fromMap(map);
    }
    if (map['type'] == 'DidSend') {
      return ProcessingEvent_DidSend.fromMap(map);
    }
    if (map['type'] == 'SendFailed') {
      return ProcessingEvent_SendFailed.fromMap(map);
    }
    if (map['type'] == 'WillFetchNextBlock') {
      return ProcessingEvent_WillFetchNextBlock.fromMap(map);
    }
    if (map['type'] == 'FetchNextBlockFailed') {
      return ProcessingEvent_FetchNextBlockFailed.fromMap(map);
    }
    if (map['type'] == 'MessageExpired') {
      return ProcessingEvent_MessageExpired.fromMap(map);
    }
    if (map['type'] == 'RempSentToValidators') {
      return ProcessingEvent_RempSentToValidators.fromMap(map);
    }
    if (map['type'] == 'RempIncludedIntoBlock') {
      return ProcessingEvent_RempIncludedIntoBlock.fromMap(map);
    }
    if (map['type'] == 'RempIncludedIntoAcceptedBlock') {
      return ProcessingEvent_RempIncludedIntoAcceptedBlock.fromMap(map);
    }
    if (map['type'] == 'RempOther') {
      return ProcessingEvent_RempOther.fromMap(map);
    }
    if (map['type'] == 'RempError') {
      return ProcessingEvent_RempError.fromMap(map);
    }
    throw ('ProcessingEvent unknown from map type');
  }
}

///Fetched block will be used later in waiting phase.
class ProcessingEvent_WillFetchFirstBlock extends ProcessingEvent {
  String _type;
  String get type => _type;
  ProcessingEvent_WillFetchFirstBlock() {
    _type = 'WillFetchFirstBlock';
  }
  ProcessingEvent_WillFetchFirstBlock.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'WillFetchFirstBlock') {
      throw ('Wrong map data');
    } else {
      _type = 'WillFetchFirstBlock';
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['type'] = _type;
    return map;
  }
}

///This may happen due to the network issues. Receiving this event means that message processing will not proceed -
///message was not sent, and Developer can try to run `process_message` again,
///in the hope that the connection is restored.
class ProcessingEvent_FetchFirstBlockFailed extends ProcessingEvent {
  String _type;
  String get type => _type;
  ClientError _error;
  ClientError get error => _error;
  ProcessingEvent_FetchFirstBlockFailed({
    @required ClientError error,
  }) {
    _type = 'FetchFirstBlockFailed';
    _error = ArgumentError.checkNotNull(
        error, 'ProcessingEvent_FetchFirstBlockFailed error');
  }
  ProcessingEvent_FetchFirstBlockFailed.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'FetchFirstBlockFailed') {
      throw ('Wrong map data');
    } else {
      _type = 'FetchFirstBlockFailed';
    }
    if (map.containsKey('error') && (map['error'] != null)) {
      _error = ClientError.fromMap(map['error']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_error != null) {
      map['error'] = _error;
    }
    map['type'] = _type;
    return map;
  }
}

///Notifies the app that the message will be sent to the network. This event means that the account's current shard block was successfully fetched and the message was successfully created (`abi.encode_message` function was executed successfully).
class ProcessingEvent_WillSend extends ProcessingEvent {
  String _type;
  String get type => _type;
  String _shard_block_id;
  String get shard_block_id => _shard_block_id;
  String _message_id;
  String get message_id => _message_id;
  String _message;
  String get message => _message;
  ProcessingEvent_WillSend({
    @required String shard_block_id,
    @required String message_id,
    @required String message,
  }) {
    _type = 'WillSend';
    _shard_block_id = ArgumentError.checkNotNull(
        shard_block_id, 'ProcessingEvent_WillSend shard_block_id');
    _message_id = ArgumentError.checkNotNull(
        message_id, 'ProcessingEvent_WillSend message_id');
    _message =
        ArgumentError.checkNotNull(message, 'ProcessingEvent_WillSend message');
  }
  ProcessingEvent_WillSend.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'WillSend') {
      throw ('Wrong map data');
    } else {
      _type = 'WillSend';
    }
    if (map.containsKey('shard_block_id') && (map['shard_block_id'] != null)) {
      _shard_block_id = map['shard_block_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('message_id') && (map['message_id'] != null)) {
      _message_id = map['message_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('message') && (map['message'] != null)) {
      _message = map['message'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_shard_block_id != null) {
      map['shard_block_id'] = _shard_block_id;
    }
    if (_message_id != null) {
      map['message_id'] = _message_id;
    }
    if (_message != null) {
      map['message'] = _message;
    }
    map['type'] = _type;
    return map;
  }
}

///Do not forget to specify abi of your contract as well, it is crucial for processing. See `processing.wait_for_transaction` documentation.
class ProcessingEvent_DidSend extends ProcessingEvent {
  String _type;
  String get type => _type;
  String _shard_block_id;
  String get shard_block_id => _shard_block_id;
  String _message_id;
  String get message_id => _message_id;
  String _message;
  String get message => _message;
  ProcessingEvent_DidSend({
    @required String shard_block_id,
    @required String message_id,
    @required String message,
  }) {
    _type = 'DidSend';
    _shard_block_id = ArgumentError.checkNotNull(
        shard_block_id, 'ProcessingEvent_DidSend shard_block_id');
    _message_id = ArgumentError.checkNotNull(
        message_id, 'ProcessingEvent_DidSend message_id');
    _message =
        ArgumentError.checkNotNull(message, 'ProcessingEvent_DidSend message');
  }
  ProcessingEvent_DidSend.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'DidSend') {
      throw ('Wrong map data');
    } else {
      _type = 'DidSend';
    }
    if (map.containsKey('shard_block_id') && (map['shard_block_id'] != null)) {
      _shard_block_id = map['shard_block_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('message_id') && (map['message_id'] != null)) {
      _message_id = map['message_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('message') && (map['message'] != null)) {
      _message = map['message'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_shard_block_id != null) {
      map['shard_block_id'] = _shard_block_id;
    }
    if (_message_id != null) {
      map['message_id'] = _message_id;
    }
    if (_message != null) {
      map['message'] = _message;
    }
    map['type'] = _type;
    return map;
  }
}

///Nevertheless the processing will be continued at the waiting
///phase because the message possibly has been delivered to the
///node.
///If Application exits at this phase, Developer needs to proceed with processing
///after the application is restored with `wait_for_transaction` function, passing
///shard_block_id and message from this event. Do not forget to specify abi of your contract
///as well, it is crucial for processing. See `processing.wait_for_transaction` documentation.
class ProcessingEvent_SendFailed extends ProcessingEvent {
  String _type;
  String get type => _type;
  String _shard_block_id;
  String get shard_block_id => _shard_block_id;
  String _message_id;
  String get message_id => _message_id;
  String _message;
  String get message => _message;
  ClientError _error;
  ClientError get error => _error;
  ProcessingEvent_SendFailed({
    @required String shard_block_id,
    @required String message_id,
    @required String message,
    @required ClientError error,
  }) {
    _type = 'SendFailed';
    _shard_block_id = ArgumentError.checkNotNull(
        shard_block_id, 'ProcessingEvent_SendFailed shard_block_id');
    _message_id = ArgumentError.checkNotNull(
        message_id, 'ProcessingEvent_SendFailed message_id');
    _message = ArgumentError.checkNotNull(
        message, 'ProcessingEvent_SendFailed message');
    _error =
        ArgumentError.checkNotNull(error, 'ProcessingEvent_SendFailed error');
  }
  ProcessingEvent_SendFailed.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'SendFailed') {
      throw ('Wrong map data');
    } else {
      _type = 'SendFailed';
    }
    if (map.containsKey('shard_block_id') && (map['shard_block_id'] != null)) {
      _shard_block_id = map['shard_block_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('message_id') && (map['message_id'] != null)) {
      _message_id = map['message_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('message') && (map['message'] != null)) {
      _message = map['message'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('error') && (map['error'] != null)) {
      _error = ClientError.fromMap(map['error']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_shard_block_id != null) {
      map['shard_block_id'] = _shard_block_id;
    }
    if (_message_id != null) {
      map['message_id'] = _message_id;
    }
    if (_message != null) {
      map['message'] = _message;
    }
    if (_error != null) {
      map['error'] = _error;
    }
    map['type'] = _type;
    return map;
  }
}

///Event can occurs more than one time due to block walking
///procedure.
///If Application exits at this phase, Developer needs to proceed with processing
///after the application is restored with `wait_for_transaction` function, passing
///shard_block_id and message from this event. Do not forget to specify abi of your contract
///as well, it is crucial for processing. See `processing.wait_for_transaction` documentation.
class ProcessingEvent_WillFetchNextBlock extends ProcessingEvent {
  String _type;
  String get type => _type;
  String _shard_block_id;
  String get shard_block_id => _shard_block_id;
  String _message_id;
  String get message_id => _message_id;
  String _message;
  String get message => _message;
  ProcessingEvent_WillFetchNextBlock({
    @required String shard_block_id,
    @required String message_id,
    @required String message,
  }) {
    _type = 'WillFetchNextBlock';
    _shard_block_id = ArgumentError.checkNotNull(
        shard_block_id, 'ProcessingEvent_WillFetchNextBlock shard_block_id');
    _message_id = ArgumentError.checkNotNull(
        message_id, 'ProcessingEvent_WillFetchNextBlock message_id');
    _message = ArgumentError.checkNotNull(
        message, 'ProcessingEvent_WillFetchNextBlock message');
  }
  ProcessingEvent_WillFetchNextBlock.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'WillFetchNextBlock') {
      throw ('Wrong map data');
    } else {
      _type = 'WillFetchNextBlock';
    }
    if (map.containsKey('shard_block_id') && (map['shard_block_id'] != null)) {
      _shard_block_id = map['shard_block_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('message_id') && (map['message_id'] != null)) {
      _message_id = map['message_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('message') && (map['message'] != null)) {
      _message = map['message'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_shard_block_id != null) {
      map['shard_block_id'] = _shard_block_id;
    }
    if (_message_id != null) {
      map['message_id'] = _message_id;
    }
    if (_message != null) {
      map['message'] = _message;
    }
    map['type'] = _type;
    return map;
  }
}

///If no block was fetched within `NetworkConfig.wait_for_timeout` then processing stops.
///This may happen when the shard stops, or there are other network issues.
///In this case Developer should resume message processing with `wait_for_transaction`, passing shard_block_id,
///message and contract abi to it. Note that passing ABI is crucial, because it will influence the processing strategy.
///
///Another way to tune this is to specify long timeout in `NetworkConfig.wait_for_timeout`
class ProcessingEvent_FetchNextBlockFailed extends ProcessingEvent {
  String _type;
  String get type => _type;
  String _shard_block_id;
  String get shard_block_id => _shard_block_id;
  String _message_id;
  String get message_id => _message_id;
  String _message;
  String get message => _message;
  ClientError _error;
  ClientError get error => _error;
  ProcessingEvent_FetchNextBlockFailed({
    @required String shard_block_id,
    @required String message_id,
    @required String message,
    @required ClientError error,
  }) {
    _type = 'FetchNextBlockFailed';
    _shard_block_id = ArgumentError.checkNotNull(
        shard_block_id, 'ProcessingEvent_FetchNextBlockFailed shard_block_id');
    _message_id = ArgumentError.checkNotNull(
        message_id, 'ProcessingEvent_FetchNextBlockFailed message_id');
    _message = ArgumentError.checkNotNull(
        message, 'ProcessingEvent_FetchNextBlockFailed message');
    _error = ArgumentError.checkNotNull(
        error, 'ProcessingEvent_FetchNextBlockFailed error');
  }
  ProcessingEvent_FetchNextBlockFailed.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'FetchNextBlockFailed') {
      throw ('Wrong map data');
    } else {
      _type = 'FetchNextBlockFailed';
    }
    if (map.containsKey('shard_block_id') && (map['shard_block_id'] != null)) {
      _shard_block_id = map['shard_block_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('message_id') && (map['message_id'] != null)) {
      _message_id = map['message_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('message') && (map['message'] != null)) {
      _message = map['message'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('error') && (map['error'] != null)) {
      _error = ClientError.fromMap(map['error']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_shard_block_id != null) {
      map['shard_block_id'] = _shard_block_id;
    }
    if (_message_id != null) {
      map['message_id'] = _message_id;
    }
    if (_message != null) {
      map['message'] = _message;
    }
    if (_error != null) {
      map['error'] = _error;
    }
    map['type'] = _type;
    return map;
  }
}

///This event occurs only for the contracts which ABI includes "expire" header.
///
///If Application specifies `NetworkConfig.message_retries_count` > 0, then `process_message`
///will perform retries: will create a new message and send it again and repeat it until it reaches
///the maximum retries count or receives a successful result.  All the processing
///events will be repeated.
class ProcessingEvent_MessageExpired extends ProcessingEvent {
  String _type;
  String get type => _type;
  String _message_id;
  String get message_id => _message_id;
  String _message;
  String get message => _message;
  ClientError _error;
  ClientError get error => _error;
  ProcessingEvent_MessageExpired({
    @required String message_id,
    @required String message,
    @required ClientError error,
  }) {
    _type = 'MessageExpired';
    _message_id = ArgumentError.checkNotNull(
        message_id, 'ProcessingEvent_MessageExpired message_id');
    _message = ArgumentError.checkNotNull(
        message, 'ProcessingEvent_MessageExpired message');
    _error = ArgumentError.checkNotNull(
        error, 'ProcessingEvent_MessageExpired error');
  }
  ProcessingEvent_MessageExpired.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'MessageExpired') {
      throw ('Wrong map data');
    } else {
      _type = 'MessageExpired';
    }
    if (map.containsKey('message_id') && (map['message_id'] != null)) {
      _message_id = map['message_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('message') && (map['message'] != null)) {
      _message = map['message'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('error') && (map['error'] != null)) {
      _error = ClientError.fromMap(map['error']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_message_id != null) {
      map['message_id'] = _message_id;
    }
    if (_message != null) {
      map['message'] = _message;
    }
    if (_error != null) {
      map['error'] = _error;
    }
    map['type'] = _type;
    return map;
  }
}

///Notifies the app that the message has been delivered to the thread's validators
class ProcessingEvent_RempSentToValidators extends ProcessingEvent {
  String _type;
  String get type => _type;
  String _message_id;
  String get message_id => _message_id;
  BigInt _timestamp;
  BigInt get timestamp => _timestamp;
  dynamic _json;
  dynamic get json => _json;
  ProcessingEvent_RempSentToValidators({
    @required String message_id,
    @required BigInt timestamp,
    @required dynamic json,
  }) {
    _type = 'RempSentToValidators';
    _message_id = ArgumentError.checkNotNull(
        message_id, 'ProcessingEvent_RempSentToValidators message_id');
    _timestamp = ArgumentError.checkNotNull(
        timestamp, 'ProcessingEvent_RempSentToValidators timestamp');
    _json = ArgumentError.checkNotNull(
        json, 'ProcessingEvent_RempSentToValidators json');
  }
  ProcessingEvent_RempSentToValidators.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'RempSentToValidators') {
      throw ('Wrong map data');
    } else {
      _type = 'RempSentToValidators';
    }
    if (map.containsKey('message_id') && (map['message_id'] != null)) {
      _message_id = map['message_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('timestamp') && (map['timestamp'] != null)) {
      _timestamp = BigInt.from(map['timestamp']);
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('json') && (map['json'] != null)) {
      _json = map['json'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_message_id != null) {
      map['message_id'] = _message_id;
    }
    if (_timestamp != null) {
      map['timestamp'] = _timestamp;
    }
    if (_json != null) {
      map['json'] = _json;
    }
    map['type'] = _type;
    return map;
  }
}

///Notifies the app that the message has been successfully included into a block candidate by the thread's collator
class ProcessingEvent_RempIncludedIntoBlock extends ProcessingEvent {
  String _type;
  String get type => _type;
  String _message_id;
  String get message_id => _message_id;
  BigInt _timestamp;
  BigInt get timestamp => _timestamp;
  dynamic _json;
  dynamic get json => _json;
  ProcessingEvent_RempIncludedIntoBlock({
    @required String message_id,
    @required BigInt timestamp,
    @required dynamic json,
  }) {
    _type = 'RempIncludedIntoBlock';
    _message_id = ArgumentError.checkNotNull(
        message_id, 'ProcessingEvent_RempIncludedIntoBlock message_id');
    _timestamp = ArgumentError.checkNotNull(
        timestamp, 'ProcessingEvent_RempIncludedIntoBlock timestamp');
    _json = ArgumentError.checkNotNull(
        json, 'ProcessingEvent_RempIncludedIntoBlock json');
  }
  ProcessingEvent_RempIncludedIntoBlock.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'RempIncludedIntoBlock') {
      throw ('Wrong map data');
    } else {
      _type = 'RempIncludedIntoBlock';
    }
    if (map.containsKey('message_id') && (map['message_id'] != null)) {
      _message_id = map['message_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('timestamp') && (map['timestamp'] != null)) {
      _timestamp = BigInt.from(map['timestamp']);
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('json') && (map['json'] != null)) {
      _json = map['json'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_message_id != null) {
      map['message_id'] = _message_id;
    }
    if (_timestamp != null) {
      map['timestamp'] = _timestamp;
    }
    if (_json != null) {
      map['json'] = _json;
    }
    map['type'] = _type;
    return map;
  }
}

///Notifies the app that the block candidate with the message has been accepted by the thread's validators
class ProcessingEvent_RempIncludedIntoAcceptedBlock extends ProcessingEvent {
  String _type;
  String get type => _type;
  String _message_id;
  String get message_id => _message_id;
  BigInt _timestamp;
  BigInt get timestamp => _timestamp;
  dynamic _json;
  dynamic get json => _json;
  ProcessingEvent_RempIncludedIntoAcceptedBlock({
    @required String message_id,
    @required BigInt timestamp,
    @required dynamic json,
  }) {
    _type = 'RempIncludedIntoAcceptedBlock';
    _message_id = ArgumentError.checkNotNull(
        message_id, 'ProcessingEvent_RempIncludedIntoAcceptedBlock message_id');
    _timestamp = ArgumentError.checkNotNull(
        timestamp, 'ProcessingEvent_RempIncludedIntoAcceptedBlock timestamp');
    _json = ArgumentError.checkNotNull(
        json, 'ProcessingEvent_RempIncludedIntoAcceptedBlock json');
  }
  ProcessingEvent_RempIncludedIntoAcceptedBlock.fromMap(
      Map<String, dynamic> map) {
    if (!map.containsKey('type') ||
        map['type'] != 'RempIncludedIntoAcceptedBlock') {
      throw ('Wrong map data');
    } else {
      _type = 'RempIncludedIntoAcceptedBlock';
    }
    if (map.containsKey('message_id') && (map['message_id'] != null)) {
      _message_id = map['message_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('timestamp') && (map['timestamp'] != null)) {
      _timestamp = BigInt.from(map['timestamp']);
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('json') && (map['json'] != null)) {
      _json = map['json'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_message_id != null) {
      map['message_id'] = _message_id;
    }
    if (_timestamp != null) {
      map['timestamp'] = _timestamp;
    }
    if (_json != null) {
      map['json'] = _json;
    }
    map['type'] = _type;
    return map;
  }
}

///Notifies the app about some other minor REMP statuses occurring during message processing
class ProcessingEvent_RempOther extends ProcessingEvent {
  String _type;
  String get type => _type;
  String _message_id;
  String get message_id => _message_id;
  BigInt _timestamp;
  BigInt get timestamp => _timestamp;
  dynamic _json;
  dynamic get json => _json;
  ProcessingEvent_RempOther({
    @required String message_id,
    @required BigInt timestamp,
    @required dynamic json,
  }) {
    _type = 'RempOther';
    _message_id = ArgumentError.checkNotNull(
        message_id, 'ProcessingEvent_RempOther message_id');
    _timestamp = ArgumentError.checkNotNull(
        timestamp, 'ProcessingEvent_RempOther timestamp');
    _json = ArgumentError.checkNotNull(json, 'ProcessingEvent_RempOther json');
  }
  ProcessingEvent_RempOther.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'RempOther') {
      throw ('Wrong map data');
    } else {
      _type = 'RempOther';
    }
    if (map.containsKey('message_id') && (map['message_id'] != null)) {
      _message_id = map['message_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('timestamp') && (map['timestamp'] != null)) {
      _timestamp = BigInt.from(map['timestamp']);
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('json') && (map['json'] != null)) {
      _json = map['json'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_message_id != null) {
      map['message_id'] = _message_id;
    }
    if (_timestamp != null) {
      map['timestamp'] = _timestamp;
    }
    if (_json != null) {
      map['json'] = _json;
    }
    map['type'] = _type;
    return map;
  }
}

///Notifies the app about any problem that has occurred in REMP processing - in this case library switches to the fallback transaction awaiting scenario (sequential block reading).
class ProcessingEvent_RempError extends ProcessingEvent {
  String _type;
  String get type => _type;
  ClientError _error;
  ClientError get error => _error;
  ProcessingEvent_RempError({
    @required ClientError error,
  }) {
    _type = 'RempError';
    _error =
        ArgumentError.checkNotNull(error, 'ProcessingEvent_RempError error');
  }
  ProcessingEvent_RempError.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'RempError') {
      throw ('Wrong map data');
    } else {
      _type = 'RempError';
    }
    if (map.containsKey('error') && (map['error'] != null)) {
      _error = ClientError.fromMap(map['error']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_error != null) {
      map['error'] = _error;
    }
    map['type'] = _type;
    return map;
  }
}

class ResultOfProcessMessage extends TonSdkStructure {
  ///In addition to the regular transaction fields there is a
  ///`boc` field encoded with `base64` which contains source
  ///transaction BOC.
  dynamic _transaction;
  dynamic get transaction => _transaction;

  ///Encoded as `base64`
  List<String> _out_messages;
  List<String> get out_messages => _out_messages;

  ///Optional decoded message bodies according to the optional `abi` parameter.
  DecodedOutput _decoded;
  DecodedOutput get decoded => _decoded;

  ///Transaction fees
  TransactionFees _fees;
  TransactionFees get fees => _fees;
  ResultOfProcessMessage({
    @required dynamic transaction,
    @required List<String> out_messages,
    DecodedOutput decoded,
    @required TransactionFees fees,
  }) {
    _transaction = ArgumentError.checkNotNull(
        transaction, 'ResultOfProcessMessage transaction');
    _out_messages = ArgumentError.checkNotNull(
        out_messages, 'ResultOfProcessMessage out_messages');
    _decoded = decoded;
    _fees = ArgumentError.checkNotNull(fees, 'ResultOfProcessMessage fees');
  }
  ResultOfProcessMessage.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('transaction') && (map['transaction'] != null)) {
      _transaction = map['transaction'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('out_messages') && (map['out_messages'] != null)) {
      _out_messages = [];
      for (var el in map['out_messages']) {
        if (el != null) {
          _out_messages.add(el);
        } else {
          _out_messages.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('decoded') && (map['decoded'] != null)) {
      _decoded = DecodedOutput.fromMap(map['decoded']);
    }
    if (map.containsKey('fees') && (map['fees'] != null)) {
      _fees = TransactionFees.fromMap(map['fees']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_transaction != null) {
      map['transaction'] = _transaction;
    }
    if (_out_messages != null) {
      map['out_messages'] = _out_messages;
    }
    if (_decoded != null) {
      map['decoded'] = _decoded;
    }
    if (_fees != null) {
      map['fees'] = _fees;
    }
    return map;
  }
}

class DecodedOutput extends TonSdkStructure {
  ///If the message can't be decoded, then `None` will be stored in
  ///the appropriate position.
  List<DecodedMessageBody> _out_messages;
  List<DecodedMessageBody> get out_messages => _out_messages;

  ///Decoded body of the function output message.
  dynamic _output;
  dynamic get output => _output;
  DecodedOutput({
    @required List<DecodedMessageBody> out_messages,
    dynamic output,
  }) {
    _out_messages =
        ArgumentError.checkNotNull(out_messages, 'DecodedOutput out_messages');
    _output = output;
  }
  DecodedOutput.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('out_messages') && (map['out_messages'] != null)) {
      _out_messages = [];
      for (var el in map['out_messages']) {
        if (el != null) {
          _out_messages.add(DecodedMessageBody.fromMap(el));
        } else {
          _out_messages.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('output') && (map['output'] != null)) {
      _output = map['output'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_out_messages != null) {
      map['out_messages'] = _out_messages;
    }
    if (_output != null) {
      map['output'] = _output;
    }
    return map;
  }
}

class ParamsOfSendMessage extends TonSdkStructure {
  ///Message BOC.
  String _message;
  String get message => _message;

  ///If this parameter is specified and the message has the
  ///`expire` header then expiration time will be checked against
  ///the current time to prevent unnecessary sending of already expired message.
  ///
  ///The `message already expired` error will be returned in this
  ///case.
  ///
  ///Note, that specifying `abi` for ABI compliant contracts is
  ///strongly recommended, so that proper processing strategy can be
  ///chosen.
  Abi _abi;
  Abi get abi => _abi;

  ///Flag for requesting events sending
  bool _send_events;
  bool get send_events => _send_events;
  ParamsOfSendMessage({
    @required String message,
    Abi abi,
    @required bool send_events,
  }) {
    _message =
        ArgumentError.checkNotNull(message, 'ParamsOfSendMessage message');
    _abi = abi;
    _send_events = ArgumentError.checkNotNull(
        send_events, 'ParamsOfSendMessage send_events');
  }
  ParamsOfSendMessage.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('message') && (map['message'] != null)) {
      _message = map['message'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('abi') && (map['abi'] != null)) {
      _abi = Abi.fromMap(map['abi']);
    }
    if (map.containsKey('send_events') && (map['send_events'] != null)) {
      _send_events = map['send_events'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_message != null) {
      map['message'] = _message;
    }
    if (_abi != null) {
      map['abi'] = _abi;
    }
    if (_send_events != null) {
      map['send_events'] = _send_events;
    }
    return map;
  }
}

class ResultOfSendMessage extends TonSdkStructure {
  ///This block id must be used as a parameter of the
  ///`wait_for_transaction`.
  String _shard_block_id;
  String get shard_block_id => _shard_block_id;

  ///This list id must be used as a parameter of the
  ///`wait_for_transaction`.
  List<String> _sending_endpoints;
  List<String> get sending_endpoints => _sending_endpoints;
  ResultOfSendMessage({
    @required String shard_block_id,
    @required List<String> sending_endpoints,
  }) {
    _shard_block_id = ArgumentError.checkNotNull(
        shard_block_id, 'ResultOfSendMessage shard_block_id');
    _sending_endpoints = ArgumentError.checkNotNull(
        sending_endpoints, 'ResultOfSendMessage sending_endpoints');
  }
  ResultOfSendMessage.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('shard_block_id') && (map['shard_block_id'] != null)) {
      _shard_block_id = map['shard_block_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('sending_endpoints') &&
        (map['sending_endpoints'] != null)) {
      _sending_endpoints = [];
      for (var el in map['sending_endpoints']) {
        if (el != null) {
          _sending_endpoints.add(el);
        } else {
          _sending_endpoints.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_shard_block_id != null) {
      map['shard_block_id'] = _shard_block_id;
    }
    if (_sending_endpoints != null) {
      map['sending_endpoints'] = _sending_endpoints;
    }
    return map;
  }
}

class ParamsOfWaitForTransaction extends TonSdkStructure {
  ///If it is specified, then the output messages' bodies will be
  ///decoded according to this ABI.
  ///
  ///The `abi_decoded` result field will be filled out.
  Abi _abi;
  Abi get abi => _abi;

  ///Encoded with `base64`.
  String _message;
  String get message => _message;

  ///You must provide the same value as the `send_message` has returned.
  String _shard_block_id;
  String get shard_block_id => _shard_block_id;

  ///Flag that enables/disables intermediate events
  bool _send_events;
  bool get send_events => _send_events;

  ///Use this field to get more informative errors.
  ///Provide the same value as the `send_message` has returned.
  ///If the message was not delivered (expired), SDK will log the endpoint URLs, used for its sending.
  List<String> _sending_endpoints;
  List<String> get sending_endpoints => _sending_endpoints;
  ParamsOfWaitForTransaction({
    Abi abi,
    @required String message,
    @required String shard_block_id,
    @required bool send_events,
    List<String> sending_endpoints,
  }) {
    _abi = abi;
    _message = ArgumentError.checkNotNull(
        message, 'ParamsOfWaitForTransaction message');
    _shard_block_id = ArgumentError.checkNotNull(
        shard_block_id, 'ParamsOfWaitForTransaction shard_block_id');
    _send_events = ArgumentError.checkNotNull(
        send_events, 'ParamsOfWaitForTransaction send_events');
    _sending_endpoints = sending_endpoints;
  }
  ParamsOfWaitForTransaction.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('abi') && (map['abi'] != null)) {
      _abi = Abi.fromMap(map['abi']);
    }
    if (map.containsKey('message') && (map['message'] != null)) {
      _message = map['message'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('shard_block_id') && (map['shard_block_id'] != null)) {
      _shard_block_id = map['shard_block_id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('send_events') && (map['send_events'] != null)) {
      _send_events = map['send_events'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('sending_endpoints') &&
        (map['sending_endpoints'] != null)) {
      _sending_endpoints = [];
      for (var el in map['sending_endpoints']) {
        if (el != null) {
          _sending_endpoints.add(el);
        } else {
          _sending_endpoints.add(null);
        }
      }
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_abi != null) {
      map['abi'] = _abi;
    }
    if (_message != null) {
      map['message'] = _message;
    }
    if (_shard_block_id != null) {
      map['shard_block_id'] = _shard_block_id;
    }
    if (_send_events != null) {
      map['send_events'] = _send_events;
    }
    if (_sending_endpoints != null) {
      map['sending_endpoints'] = _sending_endpoints;
    }
    return map;
  }
}

class ParamsOfProcessMessage extends TonSdkStructure {
  ///Message encode parameters.
  ParamsOfEncodeMessage _message_encode_params;
  ParamsOfEncodeMessage get message_encode_params => _message_encode_params;

  ///Flag for requesting events sending
  bool _send_events;
  bool get send_events => _send_events;
  ParamsOfProcessMessage({
    @required ParamsOfEncodeMessage message_encode_params,
    @required bool send_events,
  }) {
    _message_encode_params = ArgumentError.checkNotNull(
        message_encode_params, 'ParamsOfProcessMessage message_encode_params');
    _send_events = ArgumentError.checkNotNull(
        send_events, 'ParamsOfProcessMessage send_events');
  }
  ParamsOfProcessMessage.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('message_encode_params') &&
        (map['message_encode_params'] != null)) {
      _message_encode_params =
          ParamsOfEncodeMessage.fromMap(map['message_encode_params']);
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('send_events') && (map['send_events'] != null)) {
      _send_events = map['send_events'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_message_encode_params != null) {
      map['message_encode_params'] = _message_encode_params;
    }
    if (_send_events != null) {
      map['send_events'] = _send_events;
    }
    return map;
  }
}
