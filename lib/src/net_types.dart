part of 'tonsdktypes.dart';

class OrderBy extends TonSdkStructure{
String _path;
String get path => _path;
SortDirection _direction;
SortDirection get direction => _direction;
OrderBy({@required String path,@required SortDirection direction,}){

_path = ArgumentError.checkNotNull(path, 'OrderBy path');
_direction = ArgumentError.checkNotNull(direction, 'OrderBy direction');
}
OrderBy.fromMap(Map<String,dynamic> map){if (map.containsKey('path')&&(map['path']!=null)) {_path = map['path'];}else{throw('Wrong map data');}
if (map.containsKey('direction')&&(map['direction']!=null)) {_direction = SortDirection.fromMap(map['direction']);}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_path!=null) {map['path'] = _path;}
if (_direction!=null) {map['direction'] = _direction;}
return map;
}
}

class SortDirection{
String _value;
String get value => _value;
SortDirection.ASC(){
_value = 'ASC';}
SortDirection.DESC(){
_value = 'DESC';}
@override String toString() {return '"$_value"';}
SortDirection.fromMap(str) {_value = str;}
}
class ParamsOfQueryCollection extends TonSdkStructure{
/// Collection name (accounts, blocks, transactions, messages, block_signatures)
String _collection;
String get collection => _collection;
/// Collection filter
dynamic _filter;
dynamic get filter => _filter;
/// Projection (result) string
String _result;
String get result => _result;
/// Sorting order
List<OrderBy> _order;
List<OrderBy> get order => _order;
/// Number of documents to return
int _limit;
int get limit => _limit;
ParamsOfQueryCollection({@required String collection, dynamic filter,@required String result, List<OrderBy> order, int limit,}){

_collection = ArgumentError.checkNotNull(collection, 'ParamsOfQueryCollection collection');
_filter = filter;
_result = ArgumentError.checkNotNull(result, 'ParamsOfQueryCollection result');
_order = order;
_limit = limit;
}
ParamsOfQueryCollection.fromMap(Map<String,dynamic> map){if (map.containsKey('collection')&&(map['collection']!=null)) {_collection = map['collection'];}else{throw('Wrong map data');}
if (map.containsKey('filter')&&(map['filter']!=null)) {_filter = map['filter'];}
if (map.containsKey('result')&&(map['result']!=null)) {_result = map['result'];}else{throw('Wrong map data');}
if (map.containsKey('order')&&(map['order']!=null)) {_order = [];
for (var el in map['order']) {
if (el != null) {_order.add(OrderBy.fromMap(el));}else {_order.add(null);}}}
if (map.containsKey('limit')&&(map['limit']!=null)) {_limit = map['limit'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_collection!=null) {map['collection'] = _collection;}
if (_filter!=null) {map['filter'] = _filter;}
if (_result!=null) {map['result'] = _result;}
if (_order!=null) {map['order'] = _order;}
if (_limit!=null) {map['limit'] = _limit;}
return map;
}
}

class ResultOfQueryCollection extends TonSdkStructure{
/// Objects that match the provided criteria
List<dynamic> _result;
List<dynamic> get result => _result;
ResultOfQueryCollection({@required List<dynamic> result,}){

_result = ArgumentError.checkNotNull(result, 'ResultOfQueryCollection result');
}
ResultOfQueryCollection.fromMap(Map<String,dynamic> map){if (map.containsKey('result')&&(map['result']!=null)) {_result = [];
for (var el in map['result']) {
if (el != null) {_result.add(el);}else {_result.add(null);}}}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_result!=null) {map['result'] = _result;}
return map;
}
}

class ParamsOfWaitForCollection extends TonSdkStructure{
/// Collection name (accounts, blocks, transactions, messages, block_signatures)
String _collection;
String get collection => _collection;
/// Collection filter
dynamic _filter;
dynamic get filter => _filter;
/// Projection (result) string
String _result;
String get result => _result;
/// Query timeout
int _timeout;
int get timeout => _timeout;
ParamsOfWaitForCollection({@required String collection, dynamic filter,@required String result, int timeout,}){

_collection = ArgumentError.checkNotNull(collection, 'ParamsOfWaitForCollection collection');
_filter = filter;
_result = ArgumentError.checkNotNull(result, 'ParamsOfWaitForCollection result');
_timeout = timeout;
}
ParamsOfWaitForCollection.fromMap(Map<String,dynamic> map){if (map.containsKey('collection')&&(map['collection']!=null)) {_collection = map['collection'];}else{throw('Wrong map data');}
if (map.containsKey('filter')&&(map['filter']!=null)) {_filter = map['filter'];}
if (map.containsKey('result')&&(map['result']!=null)) {_result = map['result'];}else{throw('Wrong map data');}
if (map.containsKey('timeout')&&(map['timeout']!=null)) {_timeout = map['timeout'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_collection!=null) {map['collection'] = _collection;}
if (_filter!=null) {map['filter'] = _filter;}
if (_result!=null) {map['result'] = _result;}
if (_timeout!=null) {map['timeout'] = _timeout;}
return map;
}
}

class ResultOfWaitForCollection extends TonSdkStructure{
/// First found object that matches the provided criteria
dynamic _result;
dynamic get result => _result;
ResultOfWaitForCollection({@required dynamic result,}){

_result = ArgumentError.checkNotNull(result, 'ResultOfWaitForCollection result');
}
ResultOfWaitForCollection.fromMap(Map<String,dynamic> map){if (map.containsKey('result')&&(map['result']!=null)) {_result = map['result'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_result!=null) {map['result'] = _result;}
return map;
}
}

class ResultOfSubscribeCollection extends TonSdkStructure{
/// Subscription handle. Must be closed with `unsubscribe`
int _handle;
int get handle => _handle;
ResultOfSubscribeCollection({@required int handle,}){

_handle = ArgumentError.checkNotNull(handle, 'ResultOfSubscribeCollection handle');
}
ResultOfSubscribeCollection.fromMap(Map<String,dynamic> map){if (map.containsKey('handle')&&(map['handle']!=null)) {_handle = map['handle'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_handle!=null) {map['handle'] = _handle;}
return map;
}
}

class ParamsOfSubscribeCollection extends TonSdkStructure{
/// Collection name (accounts, blocks, transactions, messages, block_signatures)
String _collection;
String get collection => _collection;
/// Collection filter
dynamic _filter;
dynamic get filter => _filter;
/// Projection (result) string
String _result;
String get result => _result;
ParamsOfSubscribeCollection({@required String collection, dynamic filter,@required String result,}){

_collection = ArgumentError.checkNotNull(collection, 'ParamsOfSubscribeCollection collection');
_filter = filter;
_result = ArgumentError.checkNotNull(result, 'ParamsOfSubscribeCollection result');
}
ParamsOfSubscribeCollection.fromMap(Map<String,dynamic> map){if (map.containsKey('collection')&&(map['collection']!=null)) {_collection = map['collection'];}else{throw('Wrong map data');}
if (map.containsKey('filter')&&(map['filter']!=null)) {_filter = map['filter'];}
if (map.containsKey('result')&&(map['result']!=null)) {_result = map['result'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_collection!=null) {map['collection'] = _collection;}
if (_filter!=null) {map['filter'] = _filter;}
if (_result!=null) {map['result'] = _result;}
return map;
}
}

