part of 'tonsdktypes.dart';

class NetErrorCode {
  String _value;
  String get value => _value;
  NetErrorCode.QueryFailed() {
    _value = 'QueryFailed';
  }
  NetErrorCode.SubscribeFailed() {
    _value = 'SubscribeFailed';
  }
  NetErrorCode.WaitForFailed() {
    _value = 'WaitForFailed';
  }
  NetErrorCode.GetSubscriptionResultFailed() {
    _value = 'GetSubscriptionResultFailed';
  }
  NetErrorCode.InvalidServerResponse() {
    _value = 'InvalidServerResponse';
  }
  NetErrorCode.ClockOutOfSync() {
    _value = 'ClockOutOfSync';
  }
  NetErrorCode.WaitForTimeout() {
    _value = 'WaitForTimeout';
  }
  NetErrorCode.GraphqlError() {
    _value = 'GraphqlError';
  }
  NetErrorCode.NetworkModuleSuspended() {
    _value = 'NetworkModuleSuspended';
  }
  NetErrorCode.WebsocketDisconnected() {
    _value = 'WebsocketDisconnected';
  }
  NetErrorCode.NotSupported() {
    _value = 'NotSupported';
  }
  NetErrorCode.NoEndpointsProvided() {
    _value = 'NoEndpointsProvided';
  }
  NetErrorCode.GraphqlWebsocketInitError() {
    _value = 'GraphqlWebsocketInitError';
  }
  NetErrorCode.NetworkModuleResumed() {
    _value = 'NetworkModuleResumed';
  }
  @override
  String toString() {
    return '"$_value"';
  }

  NetErrorCode.fromMap(str) {
    _value = str;
  }
}

class OrderBy extends TonSdkStructure {
  String _path;
  String get path => _path;
  SortDirection _direction;
  SortDirection get direction => _direction;
  OrderBy({
    @required String path,
    @required SortDirection direction,
  }) {
    _path = ArgumentError.checkNotNull(path, 'OrderBy path');
    _direction = ArgumentError.checkNotNull(direction, 'OrderBy direction');
  }
  OrderBy.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('path') && (map['path'] != null)) {
      _path = map['path'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('direction') && (map['direction'] != null)) {
      _direction = SortDirection.fromMap(map['direction']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_path != null) {
      map['path'] = _path;
    }
    if (_direction != null) {
      map['direction'] = _direction;
    }
    return map;
  }
}

class SortDirection {
  String _value;
  String get value => _value;
  SortDirection.ASC() {
    _value = 'ASC';
  }
  SortDirection.DESC() {
    _value = 'DESC';
  }
  @override
  String toString() {
    return '"$_value"';
  }

  SortDirection.fromMap(str) {
    _value = str;
  }
}

abstract class ParamsOfQueryOperation extends TonSdkStructure {
  static ParamsOfQueryOperation fromMap(Map<String, dynamic> map) {
    if (map['type'] == 'QueryCollection') {
      return ParamsOfQueryOperation_QueryCollection.fromMap(map);
    }
    if (map['type'] == 'WaitForCollection') {
      return ParamsOfQueryOperation_WaitForCollection.fromMap(map);
    }
    if (map['type'] == 'AggregateCollection') {
      return ParamsOfQueryOperation_AggregateCollection.fromMap(map);
    }
    if (map['type'] == 'QueryCounterparties') {
      return ParamsOfQueryOperation_QueryCounterparties.fromMap(map);
    }
    throw ('ParamsOfQueryOperation unknown from map type');
  }
}

class ParamsOfQueryOperation_QueryCollection extends ParamsOfQueryOperation {
  String _type;
  String get type => _type;

  ///Collection name (accounts, blocks, transactions, messages, block_signatures)
  String _collection;
  String get collection => _collection;

  ///Collection filter
  dynamic _filter;
  dynamic get filter => _filter;

  ///Projection (result) string
  String _result;
  String get result => _result;

  ///Sorting order
  List<OrderBy> _order;
  List<OrderBy> get order => _order;

  ///Number of documents to return
  int _limit;
  int get limit => _limit;
  ParamsOfQueryOperation_QueryCollection({
    @required String collection,
    dynamic filter,
    @required String result,
    List<OrderBy> order,
    int limit,
  }) {
    _type = 'QueryCollection';
    _collection = ArgumentError.checkNotNull(
        collection, 'ParamsOfQueryOperation_QueryCollection collection');
    _filter = filter;
    _result = ArgumentError.checkNotNull(
        result, 'ParamsOfQueryOperation_QueryCollection result');
    _order = order;
    _limit = limit;
  }
  ParamsOfQueryOperation_QueryCollection.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'QueryCollection') {
      throw ('Wrong map data');
    } else {
      _type = 'QueryCollection';
    }
    if (map.containsKey('collection') && (map['collection'] != null)) {
      _collection = map['collection'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('filter') && (map['filter'] != null)) {
      _filter = map['filter'];
    }
    if (map.containsKey('result') && (map['result'] != null)) {
      _result = map['result'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('order') && (map['order'] != null)) {
      _order = [];
      for (var el in map['order']) {
        if (el != null) {
          _order.add(OrderBy.fromMap(el));
        } else {
          _order.add(null);
        }
      }
    }
    if (map.containsKey('limit') && (map['limit'] != null)) {
      _limit = map['limit'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_collection != null) {
      map['collection'] = _collection;
    }
    if (_filter != null) {
      map['filter'] = _filter;
    }
    if (_result != null) {
      map['result'] = _result;
    }
    if (_order != null) {
      map['order'] = _order;
    }
    if (_limit != null) {
      map['limit'] = _limit;
    }
    map['type'] = _type;
    return map;
  }
}

class ParamsOfQueryOperation_WaitForCollection extends ParamsOfQueryOperation {
  String _type;
  String get type => _type;

  ///Collection name (accounts, blocks, transactions, messages, block_signatures)
  String _collection;
  String get collection => _collection;

  ///Collection filter
  dynamic _filter;
  dynamic get filter => _filter;

  ///Projection (result) string
  String _result;
  String get result => _result;

  ///Query timeout
  int _timeout;
  int get timeout => _timeout;
  ParamsOfQueryOperation_WaitForCollection({
    @required String collection,
    dynamic filter,
    @required String result,
    int timeout,
  }) {
    _type = 'WaitForCollection';
    _collection = ArgumentError.checkNotNull(
        collection, 'ParamsOfQueryOperation_WaitForCollection collection');
    _filter = filter;
    _result = ArgumentError.checkNotNull(
        result, 'ParamsOfQueryOperation_WaitForCollection result');
    _timeout = timeout;
  }
  ParamsOfQueryOperation_WaitForCollection.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'WaitForCollection') {
      throw ('Wrong map data');
    } else {
      _type = 'WaitForCollection';
    }
    if (map.containsKey('collection') && (map['collection'] != null)) {
      _collection = map['collection'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('filter') && (map['filter'] != null)) {
      _filter = map['filter'];
    }
    if (map.containsKey('result') && (map['result'] != null)) {
      _result = map['result'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('timeout') && (map['timeout'] != null)) {
      _timeout = map['timeout'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_collection != null) {
      map['collection'] = _collection;
    }
    if (_filter != null) {
      map['filter'] = _filter;
    }
    if (_result != null) {
      map['result'] = _result;
    }
    if (_timeout != null) {
      map['timeout'] = _timeout;
    }
    map['type'] = _type;
    return map;
  }
}

class ParamsOfQueryOperation_AggregateCollection
    extends ParamsOfQueryOperation {
  String _type;
  String get type => _type;

  ///Collection name (accounts, blocks, transactions, messages, block_signatures)
  String _collection;
  String get collection => _collection;

  ///Collection filter
  dynamic _filter;
  dynamic get filter => _filter;

  ///Projection (result) string
  List<FieldAggregation> _fields;
  List<FieldAggregation> get fields => _fields;
  ParamsOfQueryOperation_AggregateCollection({
    @required String collection,
    dynamic filter,
    List<FieldAggregation> fields,
  }) {
    _type = 'AggregateCollection';
    _collection = ArgumentError.checkNotNull(
        collection, 'ParamsOfQueryOperation_AggregateCollection collection');
    _filter = filter;
    _fields = fields;
  }
  ParamsOfQueryOperation_AggregateCollection.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'AggregateCollection') {
      throw ('Wrong map data');
    } else {
      _type = 'AggregateCollection';
    }
    if (map.containsKey('collection') && (map['collection'] != null)) {
      _collection = map['collection'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('filter') && (map['filter'] != null)) {
      _filter = map['filter'];
    }
    if (map.containsKey('fields') && (map['fields'] != null)) {
      _fields = [];
      for (var el in map['fields']) {
        if (el != null) {
          _fields.add(FieldAggregation.fromMap(el));
        } else {
          _fields.add(null);
        }
      }
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_collection != null) {
      map['collection'] = _collection;
    }
    if (_filter != null) {
      map['filter'] = _filter;
    }
    if (_fields != null) {
      map['fields'] = _fields;
    }
    map['type'] = _type;
    return map;
  }
}

class ParamsOfQueryOperation_QueryCounterparties
    extends ParamsOfQueryOperation {
  String _type;
  String get type => _type;

  ///Account address
  String _account;
  String get account => _account;

  ///Projection (result) string
  String _result;
  String get result => _result;

  ///Number of counterparties to return
  int _first;
  int get first => _first;

  ///`cursor` field of the last received result
  String _after;
  String get after => _after;
  ParamsOfQueryOperation_QueryCounterparties({
    @required String account,
    @required String result,
    int first,
    String after,
  }) {
    _type = 'QueryCounterparties';
    _account = ArgumentError.checkNotNull(
        account, 'ParamsOfQueryOperation_QueryCounterparties account');
    _result = ArgumentError.checkNotNull(
        result, 'ParamsOfQueryOperation_QueryCounterparties result');
    _first = first;
    _after = after;
  }
  ParamsOfQueryOperation_QueryCounterparties.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'QueryCounterparties') {
      throw ('Wrong map data');
    } else {
      _type = 'QueryCounterparties';
    }
    if (map.containsKey('account') && (map['account'] != null)) {
      _account = map['account'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('result') && (map['result'] != null)) {
      _result = map['result'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('first') && (map['first'] != null)) {
      _first = map['first'];
    }
    if (map.containsKey('after') && (map['after'] != null)) {
      _after = map['after'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_account != null) {
      map['account'] = _account;
    }
    if (_result != null) {
      map['result'] = _result;
    }
    if (_first != null) {
      map['first'] = _first;
    }
    if (_after != null) {
      map['after'] = _after;
    }
    map['type'] = _type;
    return map;
  }
}

class FieldAggregation extends TonSdkStructure {
  ///Dot separated path to the field
  String _field;
  String get field => _field;

  ///Aggregation function that must be applied to field values
  AggregationFn _fn;
  AggregationFn get fn => _fn;
  FieldAggregation({
    @required String field,
    @required AggregationFn fn,
  }) {
    _field = ArgumentError.checkNotNull(field, 'FieldAggregation field');
    _fn = ArgumentError.checkNotNull(fn, 'FieldAggregation fn');
  }
  FieldAggregation.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('field') && (map['field'] != null)) {
      _field = map['field'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('fn') && (map['fn'] != null)) {
      _fn = AggregationFn.fromMap(map['fn']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_field != null) {
      map['field'] = _field;
    }
    if (_fn != null) {
      map['fn'] = _fn;
    }
    return map;
  }
}

class AggregationFn {
  String _value;
  String get value => _value;

  ///Returns count of filtered record
  AggregationFn.COUNT() {
    _value = 'COUNT';
  }

  ///Returns the minimal value for a field in filtered records
  AggregationFn.MIN() {
    _value = 'MIN';
  }

  ///Returns the maximal value for a field in filtered records
  AggregationFn.MAX() {
    _value = 'MAX';
  }

  ///Returns a sum of values for a field in filtered records
  AggregationFn.SUM() {
    _value = 'SUM';
  }

  ///Returns an average value for a field in filtered records
  AggregationFn.AVERAGE() {
    _value = 'AVERAGE';
  }
  @override
  String toString() {
    return '"$_value"';
  }

  AggregationFn.fromMap(str) {
    _value = str;
  }
}

class TransactionNode extends TonSdkStructure {
  ///Transaction id.
  String _id;
  String get id => _id;

  ///In message id.
  String _in_msg;
  String get in_msg => _in_msg;

  ///Out message ids.
  List<String> _out_msgs;
  List<String> get out_msgs => _out_msgs;

  ///Account address.
  String _account_addr;
  String get account_addr => _account_addr;

  ///Transactions total fees.
  String _total_fees;
  String get total_fees => _total_fees;

  ///Aborted flag.
  bool _aborted;
  bool get aborted => _aborted;

  ///Compute phase exit code.
  int _exit_code;
  int get exit_code => _exit_code;
  TransactionNode({
    @required String id,
    @required String in_msg,
    @required List<String> out_msgs,
    @required String account_addr,
    @required String total_fees,
    @required bool aborted,
    int exit_code,
  }) {
    _id = ArgumentError.checkNotNull(id, 'TransactionNode id');
    _in_msg = ArgumentError.checkNotNull(in_msg, 'TransactionNode in_msg');
    _out_msgs =
        ArgumentError.checkNotNull(out_msgs, 'TransactionNode out_msgs');
    _account_addr = ArgumentError.checkNotNull(
        account_addr, 'TransactionNode account_addr');
    _total_fees =
        ArgumentError.checkNotNull(total_fees, 'TransactionNode total_fees');
    _aborted = ArgumentError.checkNotNull(aborted, 'TransactionNode aborted');
    _exit_code = exit_code;
  }
  TransactionNode.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('id') && (map['id'] != null)) {
      _id = map['id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('in_msg') && (map['in_msg'] != null)) {
      _in_msg = map['in_msg'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('out_msgs') && (map['out_msgs'] != null)) {
      _out_msgs = [];
      for (var el in map['out_msgs']) {
        if (el != null) {
          _out_msgs.add(el);
        } else {
          _out_msgs.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('account_addr') && (map['account_addr'] != null)) {
      _account_addr = map['account_addr'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('total_fees') && (map['total_fees'] != null)) {
      _total_fees = map['total_fees'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('aborted') && (map['aborted'] != null)) {
      _aborted = map['aborted'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('exit_code') && (map['exit_code'] != null)) {
      _exit_code = map['exit_code'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_id != null) {
      map['id'] = _id;
    }
    if (_in_msg != null) {
      map['in_msg'] = _in_msg;
    }
    if (_out_msgs != null) {
      map['out_msgs'] = _out_msgs;
    }
    if (_account_addr != null) {
      map['account_addr'] = _account_addr;
    }
    if (_total_fees != null) {
      map['total_fees'] = _total_fees;
    }
    if (_aborted != null) {
      map['aborted'] = _aborted;
    }
    if (_exit_code != null) {
      map['exit_code'] = _exit_code;
    }
    return map;
  }
}

class MessageNode extends TonSdkStructure {
  ///Message id.
  String _id;
  String get id => _id;

  ///This field is missing for an external inbound messages.
  String _src_transaction_id;
  String get src_transaction_id => _src_transaction_id;

  ///This field is missing for an external outbound messages.
  String _dst_transaction_id;
  String get dst_transaction_id => _dst_transaction_id;

  ///Source address.
  String _src;
  String get src => _src;

  ///Destination address.
  String _dst;
  String get dst => _dst;

  ///Transferred tokens value.
  String _value;
  String get value => _value;

  ///Bounce flag.
  bool _bounce;
  bool get bounce => _bounce;

  ///Library tries to decode message body using provided `params.abi_registry`.
  ///This field will be missing if none of the provided abi can be used to decode.
  DecodedMessageBody _decoded_body;
  DecodedMessageBody get decoded_body => _decoded_body;
  MessageNode({
    @required String id,
    String src_transaction_id,
    String dst_transaction_id,
    String src,
    String dst,
    String value,
    @required bool bounce,
    DecodedMessageBody decoded_body,
  }) {
    _id = ArgumentError.checkNotNull(id, 'MessageNode id');
    _src_transaction_id = src_transaction_id;
    _dst_transaction_id = dst_transaction_id;
    _src = src;
    _dst = dst;
    _value = value;
    _bounce = ArgumentError.checkNotNull(bounce, 'MessageNode bounce');
    _decoded_body = decoded_body;
  }
  MessageNode.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('id') && (map['id'] != null)) {
      _id = map['id'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('src_transaction_id') &&
        (map['src_transaction_id'] != null)) {
      _src_transaction_id = map['src_transaction_id'];
    }
    if (map.containsKey('dst_transaction_id') &&
        (map['dst_transaction_id'] != null)) {
      _dst_transaction_id = map['dst_transaction_id'];
    }
    if (map.containsKey('src') && (map['src'] != null)) {
      _src = map['src'];
    }
    if (map.containsKey('dst') && (map['dst'] != null)) {
      _dst = map['dst'];
    }
    if (map.containsKey('value') && (map['value'] != null)) {
      _value = map['value'];
    }
    if (map.containsKey('bounce') && (map['bounce'] != null)) {
      _bounce = map['bounce'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('decoded_body') && (map['decoded_body'] != null)) {
      _decoded_body = DecodedMessageBody.fromMap(map['decoded_body']);
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_id != null) {
      map['id'] = _id;
    }
    if (_src_transaction_id != null) {
      map['src_transaction_id'] = _src_transaction_id;
    }
    if (_dst_transaction_id != null) {
      map['dst_transaction_id'] = _dst_transaction_id;
    }
    if (_src != null) {
      map['src'] = _src;
    }
    if (_dst != null) {
      map['dst'] = _dst;
    }
    if (_value != null) {
      map['value'] = _value;
    }
    if (_bounce != null) {
      map['bounce'] = _bounce;
    }
    if (_decoded_body != null) {
      map['decoded_body'] = _decoded_body;
    }
    return map;
  }
}

class ParamsOfQuery extends TonSdkStructure {
  ///GraphQL query text.
  String _query;
  String get query => _query;

  ///Must be a map with named values that can be used in query.
  dynamic _variables;
  dynamic get variables => _variables;
  ParamsOfQuery({
    @required String query,
    dynamic variables,
  }) {
    _query = ArgumentError.checkNotNull(query, 'ParamsOfQuery query');
    _variables = variables;
  }
  ParamsOfQuery.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('query') && (map['query'] != null)) {
      _query = map['query'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('variables') && (map['variables'] != null)) {
      _variables = map['variables'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_query != null) {
      map['query'] = _query;
    }
    if (_variables != null) {
      map['variables'] = _variables;
    }
    return map;
  }
}

class ResultOfQuery extends TonSdkStructure {
  ///Result provided by DAppServer.
  dynamic _result;
  dynamic get result => _result;
  ResultOfQuery({
    @required dynamic result,
  }) {
    _result = ArgumentError.checkNotNull(result, 'ResultOfQuery result');
  }
  ResultOfQuery.fromMap(Map<String, dynamic> map) {
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
    return map;
  }
}

class ParamsOfBatchQuery extends TonSdkStructure {
  ///List of query operations that must be performed per single fetch.
  List<ParamsOfQueryOperation> _operations;
  List<ParamsOfQueryOperation> get operations => _operations;
  ParamsOfBatchQuery({
    @required List<ParamsOfQueryOperation> operations,
  }) {
    _operations =
        ArgumentError.checkNotNull(operations, 'ParamsOfBatchQuery operations');
  }
  ParamsOfBatchQuery.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('operations') && (map['operations'] != null)) {
      _operations = [];
      for (var el in map['operations']) {
        if (el != null) {
          _operations.add(ParamsOfQueryOperation.fromMap(el));
        } else {
          _operations.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_operations != null) {
      map['operations'] = _operations;
    }
    return map;
  }
}

class ResultOfBatchQuery extends TonSdkStructure {
  ///Returns an array of values. Each value corresponds to `queries` item.
  List<dynamic> _results;
  List<dynamic> get results => _results;
  ResultOfBatchQuery({
    @required List<dynamic> results,
  }) {
    _results =
        ArgumentError.checkNotNull(results, 'ResultOfBatchQuery results');
  }
  ResultOfBatchQuery.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('results') && (map['results'] != null)) {
      _results = [];
      for (var el in map['results']) {
        if (el != null) {
          _results.add(el);
        } else {
          _results.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_results != null) {
      map['results'] = _results;
    }
    return map;
  }
}

class ParamsOfQueryCollection extends TonSdkStructure {
  ///Collection name (accounts, blocks, transactions, messages, block_signatures)
  String _collection;
  String get collection => _collection;

  ///Collection filter
  dynamic _filter;
  dynamic get filter => _filter;

  ///Projection (result) string
  String _result;
  String get result => _result;

  ///Sorting order
  List<OrderBy> _order;
  List<OrderBy> get order => _order;

  ///Number of documents to return
  int _limit;
  int get limit => _limit;
  ParamsOfQueryCollection({
    @required String collection,
    dynamic filter,
    @required String result,
    List<OrderBy> order,
    int limit,
  }) {
    _collection = ArgumentError.checkNotNull(
        collection, 'ParamsOfQueryCollection collection');
    _filter = filter;
    _result =
        ArgumentError.checkNotNull(result, 'ParamsOfQueryCollection result');
    _order = order;
    _limit = limit;
  }
  ParamsOfQueryCollection.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('collection') && (map['collection'] != null)) {
      _collection = map['collection'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('filter') && (map['filter'] != null)) {
      _filter = map['filter'];
    }
    if (map.containsKey('result') && (map['result'] != null)) {
      _result = map['result'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('order') && (map['order'] != null)) {
      _order = [];
      for (var el in map['order']) {
        if (el != null) {
          _order.add(OrderBy.fromMap(el));
        } else {
          _order.add(null);
        }
      }
    }
    if (map.containsKey('limit') && (map['limit'] != null)) {
      _limit = map['limit'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_collection != null) {
      map['collection'] = _collection;
    }
    if (_filter != null) {
      map['filter'] = _filter;
    }
    if (_result != null) {
      map['result'] = _result;
    }
    if (_order != null) {
      map['order'] = _order;
    }
    if (_limit != null) {
      map['limit'] = _limit;
    }
    return map;
  }
}

class ResultOfQueryCollection extends TonSdkStructure {
  ///Objects that match the provided criteria
  List<dynamic> _result;
  List<dynamic> get result => _result;
  ResultOfQueryCollection({
    @required List<dynamic> result,
  }) {
    _result =
        ArgumentError.checkNotNull(result, 'ResultOfQueryCollection result');
  }
  ResultOfQueryCollection.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('result') && (map['result'] != null)) {
      _result = [];
      for (var el in map['result']) {
        if (el != null) {
          _result.add(el);
        } else {
          _result.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_result != null) {
      map['result'] = _result;
    }
    return map;
  }
}

class ParamsOfAggregateCollection extends TonSdkStructure {
  ///Collection name (accounts, blocks, transactions, messages, block_signatures)
  String _collection;
  String get collection => _collection;

  ///Collection filter
  dynamic _filter;
  dynamic get filter => _filter;

  ///Projection (result) string
  List<FieldAggregation> _fields;
  List<FieldAggregation> get fields => _fields;
  ParamsOfAggregateCollection({
    @required String collection,
    dynamic filter,
    List<FieldAggregation> fields,
  }) {
    _collection = ArgumentError.checkNotNull(
        collection, 'ParamsOfAggregateCollection collection');
    _filter = filter;
    _fields = fields;
  }
  ParamsOfAggregateCollection.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('collection') && (map['collection'] != null)) {
      _collection = map['collection'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('filter') && (map['filter'] != null)) {
      _filter = map['filter'];
    }
    if (map.containsKey('fields') && (map['fields'] != null)) {
      _fields = [];
      for (var el in map['fields']) {
        if (el != null) {
          _fields.add(FieldAggregation.fromMap(el));
        } else {
          _fields.add(null);
        }
      }
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_collection != null) {
      map['collection'] = _collection;
    }
    if (_filter != null) {
      map['filter'] = _filter;
    }
    if (_fields != null) {
      map['fields'] = _fields;
    }
    return map;
  }
}

class ResultOfAggregateCollection extends TonSdkStructure {
  ///Returns an array of strings. Each string refers to the corresponding `fields` item.
  ///Numeric value is returned as a decimal string representations.
  dynamic _values;
  dynamic get values => _values;
  ResultOfAggregateCollection({
    @required dynamic values,
  }) {
    _values = ArgumentError.checkNotNull(
        values, 'ResultOfAggregateCollection values');
  }
  ResultOfAggregateCollection.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('values') && (map['values'] != null)) {
      _values = map['values'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_values != null) {
      map['values'] = _values;
    }
    return map;
  }
}

class ParamsOfWaitForCollection extends TonSdkStructure {
  ///Collection name (accounts, blocks, transactions, messages, block_signatures)
  String _collection;
  String get collection => _collection;

  ///Collection filter
  dynamic _filter;
  dynamic get filter => _filter;

  ///Projection (result) string
  String _result;
  String get result => _result;

  ///Query timeout
  int _timeout;
  int get timeout => _timeout;
  ParamsOfWaitForCollection({
    @required String collection,
    dynamic filter,
    @required String result,
    int timeout,
  }) {
    _collection = ArgumentError.checkNotNull(
        collection, 'ParamsOfWaitForCollection collection');
    _filter = filter;
    _result =
        ArgumentError.checkNotNull(result, 'ParamsOfWaitForCollection result');
    _timeout = timeout;
  }
  ParamsOfWaitForCollection.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('collection') && (map['collection'] != null)) {
      _collection = map['collection'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('filter') && (map['filter'] != null)) {
      _filter = map['filter'];
    }
    if (map.containsKey('result') && (map['result'] != null)) {
      _result = map['result'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('timeout') && (map['timeout'] != null)) {
      _timeout = map['timeout'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_collection != null) {
      map['collection'] = _collection;
    }
    if (_filter != null) {
      map['filter'] = _filter;
    }
    if (_result != null) {
      map['result'] = _result;
    }
    if (_timeout != null) {
      map['timeout'] = _timeout;
    }
    return map;
  }
}

class ResultOfWaitForCollection extends TonSdkStructure {
  ///First found object that matches the provided criteria
  dynamic _result;
  dynamic get result => _result;
  ResultOfWaitForCollection({
    @required dynamic result,
  }) {
    _result =
        ArgumentError.checkNotNull(result, 'ResultOfWaitForCollection result');
  }
  ResultOfWaitForCollection.fromMap(Map<String, dynamic> map) {
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
    return map;
  }
}

class ResultOfSubscribeCollection extends TonSdkStructure {
  ///Must be closed with `unsubscribe`
  int _handle;
  int get handle => _handle;
  ResultOfSubscribeCollection({
    @required int handle,
  }) {
    _handle = ArgumentError.checkNotNull(
        handle, 'ResultOfSubscribeCollection handle');
  }
  ResultOfSubscribeCollection.fromMap(Map<String, dynamic> map) {
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

class ParamsOfSubscribeCollection extends TonSdkStructure {
  ///Collection name (accounts, blocks, transactions, messages, block_signatures)
  String _collection;
  String get collection => _collection;

  ///Collection filter
  dynamic _filter;
  dynamic get filter => _filter;

  ///Projection (result) string
  String _result;
  String get result => _result;
  ParamsOfSubscribeCollection({
    @required String collection,
    dynamic filter,
    @required String result,
  }) {
    _collection = ArgumentError.checkNotNull(
        collection, 'ParamsOfSubscribeCollection collection');
    _filter = filter;
    _result = ArgumentError.checkNotNull(
        result, 'ParamsOfSubscribeCollection result');
  }
  ParamsOfSubscribeCollection.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('collection') && (map['collection'] != null)) {
      _collection = map['collection'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('filter') && (map['filter'] != null)) {
      _filter = map['filter'];
    }
    if (map.containsKey('result') && (map['result'] != null)) {
      _result = map['result'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_collection != null) {
      map['collection'] = _collection;
    }
    if (_filter != null) {
      map['filter'] = _filter;
    }
    if (_result != null) {
      map['result'] = _result;
    }
    return map;
  }
}

class ParamsOfSubscribe extends TonSdkStructure {
  ///GraphQL subscription text.
  String _subscription;
  String get subscription => _subscription;

  ///Must be a map with named values that can be used in query.
  dynamic _variables;
  dynamic get variables => _variables;
  ParamsOfSubscribe({
    @required String subscription,
    dynamic variables,
  }) {
    _subscription = ArgumentError.checkNotNull(
        subscription, 'ParamsOfSubscribe subscription');
    _variables = variables;
  }
  ParamsOfSubscribe.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('subscription') && (map['subscription'] != null)) {
      _subscription = map['subscription'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('variables') && (map['variables'] != null)) {
      _variables = map['variables'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_subscription != null) {
      map['subscription'] = _subscription;
    }
    if (_variables != null) {
      map['variables'] = _variables;
    }
    return map;
  }
}

class ParamsOfFindLastShardBlock extends TonSdkStructure {
  ///Account address
  String _address;
  String get address => _address;
  ParamsOfFindLastShardBlock({
    @required String address,
  }) {
    _address = ArgumentError.checkNotNull(
        address, 'ParamsOfFindLastShardBlock address');
  }
  ParamsOfFindLastShardBlock.fromMap(Map<String, dynamic> map) {
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

class ResultOfFindLastShardBlock extends TonSdkStructure {
  ///Account shard last block ID
  String _block_id;
  String get block_id => _block_id;
  ResultOfFindLastShardBlock({
    @required String block_id,
  }) {
    _block_id = ArgumentError.checkNotNull(
        block_id, 'ResultOfFindLastShardBlock block_id');
  }
  ResultOfFindLastShardBlock.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('block_id') && (map['block_id'] != null)) {
      _block_id = map['block_id'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_block_id != null) {
      map['block_id'] = _block_id;
    }
    return map;
  }
}

class EndpointsSet extends TonSdkStructure {
  ///List of endpoints provided by server
  List<String> _endpoints;
  List<String> get endpoints => _endpoints;
  EndpointsSet({
    @required List<String> endpoints,
  }) {
    _endpoints =
        ArgumentError.checkNotNull(endpoints, 'EndpointsSet endpoints');
  }
  EndpointsSet.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('endpoints') && (map['endpoints'] != null)) {
      _endpoints = [];
      for (var el in map['endpoints']) {
        if (el != null) {
          _endpoints.add(el);
        } else {
          _endpoints.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_endpoints != null) {
      map['endpoints'] = _endpoints;
    }
    return map;
  }
}

class ResultOfGetEndpoints extends TonSdkStructure {
  ///Current query endpoint
  String _query;
  String get query => _query;

  ///List of all endpoints used by client
  List<String> _endpoints;
  List<String> get endpoints => _endpoints;
  ResultOfGetEndpoints({
    @required String query,
    @required List<String> endpoints,
  }) {
    _query = ArgumentError.checkNotNull(query, 'ResultOfGetEndpoints query');
    _endpoints =
        ArgumentError.checkNotNull(endpoints, 'ResultOfGetEndpoints endpoints');
  }
  ResultOfGetEndpoints.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('query') && (map['query'] != null)) {
      _query = map['query'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('endpoints') && (map['endpoints'] != null)) {
      _endpoints = [];
      for (var el in map['endpoints']) {
        if (el != null) {
          _endpoints.add(el);
        } else {
          _endpoints.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_query != null) {
      map['query'] = _query;
    }
    if (_endpoints != null) {
      map['endpoints'] = _endpoints;
    }
    return map;
  }
}

class ParamsOfQueryCounterparties extends TonSdkStructure {
  ///Account address
  String _account;
  String get account => _account;

  ///Projection (result) string
  String _result;
  String get result => _result;

  ///Number of counterparties to return
  int _first;
  int get first => _first;

  ///`cursor` field of the last received result
  String _after;
  String get after => _after;
  ParamsOfQueryCounterparties({
    @required String account,
    @required String result,
    int first,
    String after,
  }) {
    _account = ArgumentError.checkNotNull(
        account, 'ParamsOfQueryCounterparties account');
    _result = ArgumentError.checkNotNull(
        result, 'ParamsOfQueryCounterparties result');
    _first = first;
    _after = after;
  }
  ParamsOfQueryCounterparties.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('account') && (map['account'] != null)) {
      _account = map['account'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('result') && (map['result'] != null)) {
      _result = map['result'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('first') && (map['first'] != null)) {
      _first = map['first'];
    }
    if (map.containsKey('after') && (map['after'] != null)) {
      _after = map['after'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_account != null) {
      map['account'] = _account;
    }
    if (_result != null) {
      map['result'] = _result;
    }
    if (_first != null) {
      map['first'] = _first;
    }
    if (_after != null) {
      map['after'] = _after;
    }
    return map;
  }
}

class ParamsOfQueryTransactionTree extends TonSdkStructure {
  ///Input message id.
  String _in_msg;
  String get in_msg => _in_msg;

  ///List of contract ABIs that will be used to decode message bodies. Library will try to decode each returned message body using any ABI from the registry.
  List<Abi> _abi_registry;
  List<Abi> get abi_registry => _abi_registry;

  ///If some of the following messages and transactions are missing yet
  ///The maximum waiting time is regulated by this option.
  ///
  ///Default value is 60000 (1 min).
  int _timeout;
  int get timeout => _timeout;
  ParamsOfQueryTransactionTree({
    @required String in_msg,
    List<Abi> abi_registry,
    int timeout,
  }) {
    _in_msg = ArgumentError.checkNotNull(
        in_msg, 'ParamsOfQueryTransactionTree in_msg');
    _abi_registry = abi_registry;
    _timeout = timeout;
  }
  ParamsOfQueryTransactionTree.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('in_msg') && (map['in_msg'] != null)) {
      _in_msg = map['in_msg'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('abi_registry') && (map['abi_registry'] != null)) {
      _abi_registry = [];
      for (var el in map['abi_registry']) {
        if (el != null) {
          _abi_registry.add(Abi.fromMap(el));
        } else {
          _abi_registry.add(null);
        }
      }
    }
    if (map.containsKey('timeout') && (map['timeout'] != null)) {
      _timeout = map['timeout'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_in_msg != null) {
      map['in_msg'] = _in_msg;
    }
    if (_abi_registry != null) {
      map['abi_registry'] = _abi_registry;
    }
    if (_timeout != null) {
      map['timeout'] = _timeout;
    }
    return map;
  }
}

class ResultOfQueryTransactionTree extends TonSdkStructure {
  ///Messages.
  List<MessageNode> _messages;
  List<MessageNode> get messages => _messages;

  ///Transactions.
  List<TransactionNode> _transactions;
  List<TransactionNode> get transactions => _transactions;
  ResultOfQueryTransactionTree({
    @required List<MessageNode> messages,
    @required List<TransactionNode> transactions,
  }) {
    _messages = ArgumentError.checkNotNull(
        messages, 'ResultOfQueryTransactionTree messages');
    _transactions = ArgumentError.checkNotNull(
        transactions, 'ResultOfQueryTransactionTree transactions');
  }
  ResultOfQueryTransactionTree.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('messages') && (map['messages'] != null)) {
      _messages = [];
      for (var el in map['messages']) {
        if (el != null) {
          _messages.add(MessageNode.fromMap(el));
        } else {
          _messages.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('transactions') && (map['transactions'] != null)) {
      _transactions = [];
      for (var el in map['transactions']) {
        if (el != null) {
          _transactions.add(TransactionNode.fromMap(el));
        } else {
          _transactions.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_messages != null) {
      map['messages'] = _messages;
    }
    if (_transactions != null) {
      map['transactions'] = _transactions;
    }
    return map;
  }
}

class ParamsOfCreateBlockIterator extends TonSdkStructure {
  ///If the application specifies this parameter then the iteration
  ///includes blocks with `gen_utime` >= `start_time`.
  ///Otherwise the iteration starts from zero state.
  ///
  ///Must be specified in seconds.
  int _start_time;
  int get start_time => _start_time;

  ///If the application specifies this parameter then the iteration
  ///includes blocks with `gen_utime` < `end_time`.
  ///Otherwise the iteration never stops.
  ///
  ///Must be specified in seconds.
  int _end_time;
  int get end_time => _end_time;

  ///If the application specifies this parameter and it is not the empty array
  ///then the iteration will include items related to accounts that belongs to
  ///the specified shard prefixes.
  ///Shard prefix must be represented as a string "workchain:prefix".
  ///Where `workchain` is a signed integer and the `prefix` if a hexadecimal
  ///representation if the 64-bit unsigned integer with tagged shard prefix.
  ///For example: "0:3800000000000000".
  List<String> _shard_filter;
  List<String> get shard_filter => _shard_filter;

  ///List of the fields that must be returned for iterated items.
  ///This field is the same as the `result` parameter of
  ///the `query_collection` function.
  ///Note that iterated items can contains additional fields that are
  ///not requested in the `result`.
  String _result;
  String get result => _result;
  ParamsOfCreateBlockIterator({
    int start_time,
    int end_time,
    List<String> shard_filter,
    String result,
  }) {
    _start_time = start_time;
    _end_time = end_time;
    _shard_filter = shard_filter;
    _result = result;
  }
  ParamsOfCreateBlockIterator.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('start_time') && (map['start_time'] != null)) {
      _start_time = map['start_time'];
    }
    if (map.containsKey('end_time') && (map['end_time'] != null)) {
      _end_time = map['end_time'];
    }
    if (map.containsKey('shard_filter') && (map['shard_filter'] != null)) {
      _shard_filter = [];
      for (var el in map['shard_filter']) {
        if (el != null) {
          _shard_filter.add(el);
        } else {
          _shard_filter.add(null);
        }
      }
    }
    if (map.containsKey('result') && (map['result'] != null)) {
      _result = map['result'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_start_time != null) {
      map['start_time'] = _start_time;
    }
    if (_end_time != null) {
      map['end_time'] = _end_time;
    }
    if (_shard_filter != null) {
      map['shard_filter'] = _shard_filter;
    }
    if (_result != null) {
      map['result'] = _result;
    }
    return map;
  }
}

class RegisteredIterator extends TonSdkStructure {
  ///Must be removed using `remove_iterator`
  ///when it is no more needed for the application.
  int _handle;
  int get handle => _handle;
  RegisteredIterator({
    @required int handle,
  }) {
    _handle = ArgumentError.checkNotNull(handle, 'RegisteredIterator handle');
  }
  RegisteredIterator.fromMap(Map<String, dynamic> map) {
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

class ParamsOfResumeBlockIterator extends TonSdkStructure {
  ///Same as value returned from `iterator_next`.
  dynamic _resume_state;
  dynamic get resume_state => _resume_state;
  ParamsOfResumeBlockIterator({
    @required dynamic resume_state,
  }) {
    _resume_state = ArgumentError.checkNotNull(
        resume_state, 'ParamsOfResumeBlockIterator resume_state');
  }
  ParamsOfResumeBlockIterator.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('resume_state') && (map['resume_state'] != null)) {
      _resume_state = map['resume_state'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_resume_state != null) {
      map['resume_state'] = _resume_state;
    }
    return map;
  }
}

class ParamsOfCreateTransactionIterator extends TonSdkStructure {
  ///If the application specifies this parameter then the iteration
  ///includes blocks with `gen_utime` >= `start_time`.
  ///Otherwise the iteration starts from zero state.
  ///
  ///Must be specified in seconds.
  int _start_time;
  int get start_time => _start_time;

  ///If the application specifies this parameter then the iteration
  ///includes blocks with `gen_utime` < `end_time`.
  ///Otherwise the iteration never stops.
  ///
  ///Must be specified in seconds.
  int _end_time;
  int get end_time => _end_time;

  ///If the application specifies this parameter and it is not an empty array
  ///then the iteration will include items related to accounts that belongs to
  ///the specified shard prefixes.
  ///Shard prefix must be represented as a string "workchain:prefix".
  ///Where `workchain` is a signed integer and the `prefix` if a hexadecimal
  ///representation if the 64-bit unsigned integer with tagged shard prefix.
  ///For example: "0:3800000000000000".
  ///Account address conforms to the shard filter if
  ///it belongs to the filter workchain and the first bits of address match to
  ///the shard prefix. Only transactions with suitable account addresses are iterated.
  List<String> _shard_filter;
  List<String> get shard_filter => _shard_filter;

  ///Application can specify the list of accounts for which
  ///it wants to iterate transactions.
  ///
  ///If this parameter is missing or an empty list then the library iterates
  ///transactions for all accounts that pass the shard filter.
  ///
  ///Note that the library doesn't detect conflicts between the account filter and the shard filter
  ///if both are specified.
  ///So it is an application responsibility to specify the correct filter combination.
  List<String> _accounts_filter;
  List<String> get accounts_filter => _accounts_filter;

  ///List of the fields that must be returned for iterated items.
  ///This field is the same as the `result` parameter of
  ///the `query_collection` function.
  ///Note that iterated items can contain additional fields that are
  ///not requested in the `result`.
  String _result;
  String get result => _result;

  ///If this parameter is `true` then each transaction contains field
  ///`transfers` with list of transfer. See more about this structure in function description.
  bool _include_transfers;
  bool get include_transfers => _include_transfers;
  ParamsOfCreateTransactionIterator({
    int start_time,
    int end_time,
    List<String> shard_filter,
    List<String> accounts_filter,
    String result,
    bool include_transfers,
  }) {
    _start_time = start_time;
    _end_time = end_time;
    _shard_filter = shard_filter;
    _accounts_filter = accounts_filter;
    _result = result;
    _include_transfers = include_transfers;
  }
  ParamsOfCreateTransactionIterator.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('start_time') && (map['start_time'] != null)) {
      _start_time = map['start_time'];
    }
    if (map.containsKey('end_time') && (map['end_time'] != null)) {
      _end_time = map['end_time'];
    }
    if (map.containsKey('shard_filter') && (map['shard_filter'] != null)) {
      _shard_filter = [];
      for (var el in map['shard_filter']) {
        if (el != null) {
          _shard_filter.add(el);
        } else {
          _shard_filter.add(null);
        }
      }
    }
    if (map.containsKey('accounts_filter') &&
        (map['accounts_filter'] != null)) {
      _accounts_filter = [];
      for (var el in map['accounts_filter']) {
        if (el != null) {
          _accounts_filter.add(el);
        } else {
          _accounts_filter.add(null);
        }
      }
    }
    if (map.containsKey('result') && (map['result'] != null)) {
      _result = map['result'];
    }
    if (map.containsKey('include_transfers') &&
        (map['include_transfers'] != null)) {
      _include_transfers = map['include_transfers'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_start_time != null) {
      map['start_time'] = _start_time;
    }
    if (_end_time != null) {
      map['end_time'] = _end_time;
    }
    if (_shard_filter != null) {
      map['shard_filter'] = _shard_filter;
    }
    if (_accounts_filter != null) {
      map['accounts_filter'] = _accounts_filter;
    }
    if (_result != null) {
      map['result'] = _result;
    }
    if (_include_transfers != null) {
      map['include_transfers'] = _include_transfers;
    }
    return map;
  }
}

class ParamsOfResumeTransactionIterator extends TonSdkStructure {
  ///Same as value returned from `iterator_next`.
  dynamic _resume_state;
  dynamic get resume_state => _resume_state;

  ///Application can specify the list of accounts for which
  ///it wants to iterate transactions.
  ///
  ///If this parameter is missing or an empty list then the library iterates
  ///transactions for all accounts that passes the shard filter.
  ///
  ///Note that the library doesn't detect conflicts between the account filter and the shard filter
  ///if both are specified.
  ///So it is the application's responsibility to specify the correct filter combination.
  List<String> _accounts_filter;
  List<String> get accounts_filter => _accounts_filter;
  ParamsOfResumeTransactionIterator({
    @required dynamic resume_state,
    List<String> accounts_filter,
  }) {
    _resume_state = ArgumentError.checkNotNull(
        resume_state, 'ParamsOfResumeTransactionIterator resume_state');
    _accounts_filter = accounts_filter;
  }
  ParamsOfResumeTransactionIterator.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('resume_state') && (map['resume_state'] != null)) {
      _resume_state = map['resume_state'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('accounts_filter') &&
        (map['accounts_filter'] != null)) {
      _accounts_filter = [];
      for (var el in map['accounts_filter']) {
        if (el != null) {
          _accounts_filter.add(el);
        } else {
          _accounts_filter.add(null);
        }
      }
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_resume_state != null) {
      map['resume_state'] = _resume_state;
    }
    if (_accounts_filter != null) {
      map['accounts_filter'] = _accounts_filter;
    }
    return map;
  }
}

class ParamsOfIteratorNext extends TonSdkStructure {
  ///Iterator handle
  int _iterator;
  int get iterator => _iterator;

  ///If value is missing or is less than 1 the library uses 1.
  int _limit;
  int get limit => _limit;

  ///Indicates that function must return the iterator state that can be used for resuming iteration.
  bool _return_resume_state;
  bool get return_resume_state => _return_resume_state;
  ParamsOfIteratorNext({
    @required int iterator,
    int limit,
    bool return_resume_state,
  }) {
    _iterator =
        ArgumentError.checkNotNull(iterator, 'ParamsOfIteratorNext iterator');
    _limit = limit;
    _return_resume_state = return_resume_state;
  }
  ParamsOfIteratorNext.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('iterator') && (map['iterator'] != null)) {
      _iterator = map['iterator'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('limit') && (map['limit'] != null)) {
      _limit = map['limit'];
    }
    if (map.containsKey('return_resume_state') &&
        (map['return_resume_state'] != null)) {
      _return_resume_state = map['return_resume_state'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_iterator != null) {
      map['iterator'] = _iterator;
    }
    if (_limit != null) {
      map['limit'] = _limit;
    }
    if (_return_resume_state != null) {
      map['return_resume_state'] = _return_resume_state;
    }
    return map;
  }
}

class ResultOfIteratorNext extends TonSdkStructure {
  ///Note that `iterator_next` can return an empty items and `has_more` equals to `true`.
  ///In this case the application have to continue iteration.
  ///Such situation can take place when there is no data yet but
  ///the requested `end_time` is not reached.
  List<dynamic> _items;
  List<dynamic> get items => _items;

  ///Indicates that there are more available items in iterated range.
  bool _has_more;
  bool get has_more => _has_more;

  ///This field is returned only if the `return_resume_state` parameter
  ///is specified.
  ///
  ///Note that `resume_state` corresponds to the iteration position
  ///after the returned items.
  dynamic _resume_state;
  dynamic get resume_state => _resume_state;
  ResultOfIteratorNext({
    @required List<dynamic> items,
    @required bool has_more,
    dynamic resume_state,
  }) {
    _items = ArgumentError.checkNotNull(items, 'ResultOfIteratorNext items');
    _has_more =
        ArgumentError.checkNotNull(has_more, 'ResultOfIteratorNext has_more');
    _resume_state = resume_state;
  }
  ResultOfIteratorNext.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('items') && (map['items'] != null)) {
      _items = [];
      for (var el in map['items']) {
        if (el != null) {
          _items.add(el);
        } else {
          _items.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('has_more') && (map['has_more'] != null)) {
      _has_more = map['has_more'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('resume_state') && (map['resume_state'] != null)) {
      _resume_state = map['resume_state'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_items != null) {
      map['items'] = _items;
    }
    if (_has_more != null) {
      map['has_more'] = _has_more;
    }
    if (_resume_state != null) {
      map['resume_state'] = _resume_state;
    }
    return map;
  }
}
