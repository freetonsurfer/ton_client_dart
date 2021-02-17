part of 'tonsdktypes.dart';

abstract class BocCacheType extends TonSdkStructure{
static BocCacheType fromMap(Map<String,dynamic> map){
if (map['type']=='Pinned'){
return BocCacheType_Pinned.fromMap(map);
}
if (map['type']=='Unpinned'){
return BocCacheType_Unpinned.fromMap(map);
}
throw('BocCacheType unknown from map type');
}
}

///Such BOC will not be removed from cache until it is unpinned
class BocCacheType_Pinned extends BocCacheType{
String _type;
String get type => _type;
String _pin;
String get pin => _pin;
BocCacheType_Pinned({@required String pin,}){

_type = 'Pinned';
_pin = ArgumentError.checkNotNull(pin, 'BocCacheType_Pinned pin');
}
BocCacheType_Pinned.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'Pinned'){throw('Wrong map data');}else{_type = 'Pinned';}
if (map.containsKey('pin')&&(map['pin']!=null)) {_pin = map['pin'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_pin!=null) {map['pin'] = _pin;}
map['type'] = _type;return map;
}
}

/// 
class BocCacheType_Unpinned extends BocCacheType{
String _type;
String get type => _type;
BocCacheType_Unpinned(){

_type = 'Unpinned';
}
BocCacheType_Unpinned.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'Unpinned'){throw('Wrong map data');}else{_type = 'Unpinned';}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
map['type'] = _type;return map;
}
}

class BocErrorCode{
String _value;
String get value => _value;
BocErrorCode.InvalidBoc(){
_value = 'InvalidBoc';}
BocErrorCode.SerializationError(){
_value = 'SerializationError';}
BocErrorCode.InappropriateBlock(){
_value = 'InappropriateBlock';}
BocErrorCode.MissingSourceBoc(){
_value = 'MissingSourceBoc';}
BocErrorCode.InsufficientCacheSize(){
_value = 'InsufficientCacheSize';}
BocErrorCode.BocRefNotFound(){
_value = 'BocRefNotFound';}
BocErrorCode.InvalidBocRef(){
_value = 'InvalidBocRef';}
@override String toString() {return '"$_value"';}
BocErrorCode.fromMap(str) {_value = str;}
}
class ParamsOfParse extends TonSdkStructure{
///BOC encoded as base64
String _boc;
String get boc => _boc;
ParamsOfParse({@required String boc,}){

_boc = ArgumentError.checkNotNull(boc, 'ParamsOfParse boc');
}
ParamsOfParse.fromMap(Map<String,dynamic> map){if (map.containsKey('boc')&&(map['boc']!=null)) {_boc = map['boc'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_boc!=null) {map['boc'] = _boc;}
return map;
}
}

class ResultOfParse extends TonSdkStructure{
///JSON containing parsed BOC
dynamic _parsed;
dynamic get parsed => _parsed;
ResultOfParse({@required dynamic parsed,}){

_parsed = ArgumentError.checkNotNull(parsed, 'ResultOfParse parsed');
}
ResultOfParse.fromMap(Map<String,dynamic> map){if (map.containsKey('parsed')&&(map['parsed']!=null)) {_parsed = map['parsed'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_parsed!=null) {map['parsed'] = _parsed;}
return map;
}
}

class ParamsOfParseShardstate extends TonSdkStructure{
///BOC encoded as base64
String _boc;
String get boc => _boc;
///Shardstate identificator
String _id;
String get id => _id;
///Workchain shardstate belongs to
int _workchain_id;
int get workchain_id => _workchain_id;
ParamsOfParseShardstate({@required String boc,@required String id,@required int workchain_id,}){

_boc = ArgumentError.checkNotNull(boc, 'ParamsOfParseShardstate boc');
_id = ArgumentError.checkNotNull(id, 'ParamsOfParseShardstate id');
_workchain_id = ArgumentError.checkNotNull(workchain_id, 'ParamsOfParseShardstate workchain_id');
}
ParamsOfParseShardstate.fromMap(Map<String,dynamic> map){if (map.containsKey('boc')&&(map['boc']!=null)) {_boc = map['boc'];}else{throw('Wrong map data');}
if (map.containsKey('id')&&(map['id']!=null)) {_id = map['id'];}else{throw('Wrong map data');}
if (map.containsKey('workchain_id')&&(map['workchain_id']!=null)) {_workchain_id = map['workchain_id'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_boc!=null) {map['boc'] = _boc;}
if (_id!=null) {map['id'] = _id;}
if (_workchain_id!=null) {map['workchain_id'] = _workchain_id;}
return map;
}
}

class ParamsOfGetBlockchainConfig extends TonSdkStructure{
///Key block BOC encoded as base64
String _block_boc;
String get block_boc => _block_boc;
ParamsOfGetBlockchainConfig({@required String block_boc,}){

_block_boc = ArgumentError.checkNotNull(block_boc, 'ParamsOfGetBlockchainConfig block_boc');
}
ParamsOfGetBlockchainConfig.fromMap(Map<String,dynamic> map){if (map.containsKey('block_boc')&&(map['block_boc']!=null)) {_block_boc = map['block_boc'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_block_boc!=null) {map['block_boc'] = _block_boc;}
return map;
}
}

class ResultOfGetBlockchainConfig extends TonSdkStructure{
///Blockchain config BOC encoded as base64
String _config_boc;
String get config_boc => _config_boc;
ResultOfGetBlockchainConfig({@required String config_boc,}){

_config_boc = ArgumentError.checkNotNull(config_boc, 'ResultOfGetBlockchainConfig config_boc');
}
ResultOfGetBlockchainConfig.fromMap(Map<String,dynamic> map){if (map.containsKey('config_boc')&&(map['config_boc']!=null)) {_config_boc = map['config_boc'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_config_boc!=null) {map['config_boc'] = _config_boc;}
return map;
}
}

class ParamsOfGetBocHash extends TonSdkStructure{
///BOC encoded as base64
String _boc;
String get boc => _boc;
ParamsOfGetBocHash({@required String boc,}){

_boc = ArgumentError.checkNotNull(boc, 'ParamsOfGetBocHash boc');
}
ParamsOfGetBocHash.fromMap(Map<String,dynamic> map){if (map.containsKey('boc')&&(map['boc']!=null)) {_boc = map['boc'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_boc!=null) {map['boc'] = _boc;}
return map;
}
}

class ResultOfGetBocHash extends TonSdkStructure{
///BOC root hash encoded with hex
String _hash;
String get hash => _hash;
ResultOfGetBocHash({@required String hash,}){

_hash = ArgumentError.checkNotNull(hash, 'ResultOfGetBocHash hash');
}
ResultOfGetBocHash.fromMap(Map<String,dynamic> map){if (map.containsKey('hash')&&(map['hash']!=null)) {_hash = map['hash'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_hash!=null) {map['hash'] = _hash;}
return map;
}
}

class ParamsOfGetCodeFromTvc extends TonSdkStructure{
///Contract TVC image encoded as base64
String _tvc;
String get tvc => _tvc;
ParamsOfGetCodeFromTvc({@required String tvc,}){

_tvc = ArgumentError.checkNotNull(tvc, 'ParamsOfGetCodeFromTvc tvc');
}
ParamsOfGetCodeFromTvc.fromMap(Map<String,dynamic> map){if (map.containsKey('tvc')&&(map['tvc']!=null)) {_tvc = map['tvc'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_tvc!=null) {map['tvc'] = _tvc;}
return map;
}
}

class ResultOfGetCodeFromTvc extends TonSdkStructure{
///Contract code encoded as base64
String _code;
String get code => _code;
ResultOfGetCodeFromTvc({@required String code,}){

_code = ArgumentError.checkNotNull(code, 'ResultOfGetCodeFromTvc code');
}
ResultOfGetCodeFromTvc.fromMap(Map<String,dynamic> map){if (map.containsKey('code')&&(map['code']!=null)) {_code = map['code'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_code!=null) {map['code'] = _code;}
return map;
}
}

class ParamsOfBocCacheGet extends TonSdkStructure{
///Reference to the cached BOC
String _boc_ref;
String get boc_ref => _boc_ref;
ParamsOfBocCacheGet({@required String boc_ref,}){

_boc_ref = ArgumentError.checkNotNull(boc_ref, 'ParamsOfBocCacheGet boc_ref');
}
ParamsOfBocCacheGet.fromMap(Map<String,dynamic> map){if (map.containsKey('boc_ref')&&(map['boc_ref']!=null)) {_boc_ref = map['boc_ref'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_boc_ref!=null) {map['boc_ref'] = _boc_ref;}
return map;
}
}

class ResultOfBocCacheGet extends TonSdkStructure{
///BOC encoded as base64.
String _boc;
String get boc => _boc;
ResultOfBocCacheGet({ String boc,}){

_boc = boc;
}
ResultOfBocCacheGet.fromMap(Map<String,dynamic> map){if (map.containsKey('boc')&&(map['boc']!=null)) {_boc = map['boc'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_boc!=null) {map['boc'] = _boc;}
return map;
}
}

class ParamsOfBocCacheSet extends TonSdkStructure{
///BOC encoded as base64 or BOC reference
String _boc;
String get boc => _boc;
///Cache type
BocCacheType _cache_type;
BocCacheType get cache_type => _cache_type;
ParamsOfBocCacheSet({@required String boc,@required BocCacheType cache_type,}){

_boc = ArgumentError.checkNotNull(boc, 'ParamsOfBocCacheSet boc');
_cache_type = ArgumentError.checkNotNull(cache_type, 'ParamsOfBocCacheSet cache_type');
}
ParamsOfBocCacheSet.fromMap(Map<String,dynamic> map){if (map.containsKey('boc')&&(map['boc']!=null)) {_boc = map['boc'];}else{throw('Wrong map data');}
if (map.containsKey('cache_type')&&(map['cache_type']!=null)) {_cache_type = BocCacheType.fromMap(map['cache_type']);}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_boc!=null) {map['boc'] = _boc;}
if (_cache_type!=null) {map['cache_type'] = _cache_type;}
return map;
}
}

class ResultOfBocCacheSet extends TonSdkStructure{
///Reference to the cached BOC
String _boc_ref;
String get boc_ref => _boc_ref;
ResultOfBocCacheSet({@required String boc_ref,}){

_boc_ref = ArgumentError.checkNotNull(boc_ref, 'ResultOfBocCacheSet boc_ref');
}
ResultOfBocCacheSet.fromMap(Map<String,dynamic> map){if (map.containsKey('boc_ref')&&(map['boc_ref']!=null)) {_boc_ref = map['boc_ref'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_boc_ref!=null) {map['boc_ref'] = _boc_ref;}
return map;
}
}

class ParamsOfBocCacheUnpin extends TonSdkStructure{
///Pinned name
String _pin;
String get pin => _pin;
///If it is provided then only referenced BOC is unpinned
String _boc_ref;
String get boc_ref => _boc_ref;
ParamsOfBocCacheUnpin({@required String pin, String boc_ref,}){

_pin = ArgumentError.checkNotNull(pin, 'ParamsOfBocCacheUnpin pin');
_boc_ref = boc_ref;
}
ParamsOfBocCacheUnpin.fromMap(Map<String,dynamic> map){if (map.containsKey('pin')&&(map['pin']!=null)) {_pin = map['pin'];}else{throw('Wrong map data');}
if (map.containsKey('boc_ref')&&(map['boc_ref']!=null)) {_boc_ref = map['boc_ref'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_pin!=null) {map['pin'] = _pin;}
if (_boc_ref!=null) {map['boc_ref'] = _boc_ref;}
return map;
}
}

