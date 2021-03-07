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
    throw ('ParamsOfQueryOperation unknown from map type');
  }
}

class ParamsOfQueryOperation_QueryCollection extends ParamsOfQueryOperation {
  String _type = 'QueryCollection';
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
    if (map.containsKey('collection') && (map['collection'] != null)) {
      _collection = map['collection'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('type') && (map['type'] == 'QueryCollection')) {
      _type = 'QueryCollection';
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
    map['type'] = 'QueryCollection';
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

class ParamsOfQueryOperation_WaitForCollection extends ParamsOfQueryOperation {
  String _type = 'WaitForCollection';
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
    if (map.containsKey('collection') && (map['collection'] != null)) {
      _collection = map['collection'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('type') && (map['type'] == 'WaitForCollection')) {
      _type = 'WaitForCollection';
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
    map['type'] = 'WaitForCollection';
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

class ParamsOfQueryOperation_AggregateCollection
    extends ParamsOfQueryOperation {
  String _type = 'AggregateCollection';
  String get type => _type;

  ///Collection name (accounts, blocks, transactions, messages, block_signatures)
  String _collection;
  String get collection => _collection;

  ///Collection filter.
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
    if (map.containsKey('collection') && (map['collection'] != null)) {
      _collection = map['collection'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('type') && (map['type'] == 'AggregateCollection')) {
      _type = 'AggregateCollection';
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
    map['type'] = 'AggregateCollection';
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

  ///Collection filter.
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
