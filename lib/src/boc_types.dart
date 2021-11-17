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
///Key block BOC or zerostate BOC encoded as base64
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
///BOC encoded as base64 or BOC handle
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

class ParamsOfGetBocDepth extends TonSdkStructure{
///BOC encoded as base64 or BOC handle
String _boc;
String get boc => _boc;
ParamsOfGetBocDepth({@required String boc,}){

_boc = ArgumentError.checkNotNull(boc, 'ParamsOfGetBocDepth boc');
}
ParamsOfGetBocDepth.fromMap(Map<String,dynamic> map){if (map.containsKey('boc')&&(map['boc']!=null)) {_boc = map['boc'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_boc!=null) {map['boc'] = _boc;}
return map;
}
}

class ResultOfGetBocDepth extends TonSdkStructure{
///BOC root cell depth
int _depth;
int get depth => _depth;
ResultOfGetBocDepth({@required int depth,}){

_depth = ArgumentError.checkNotNull(depth, 'ResultOfGetBocDepth depth');
}
ResultOfGetBocDepth.fromMap(Map<String,dynamic> map){if (map.containsKey('depth')&&(map['depth']!=null)) {_depth = map['depth'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_depth!=null) {map['depth'] = _depth;}
return map;
}
}

class ParamsOfGetCodeFromTvc extends TonSdkStructure{
///Contract TVC image or image BOC handle
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

///Cell builder operation.
abstract class BuilderOp extends TonSdkStructure{
static BuilderOp fromMap(Map<String,dynamic> map){
if (map['type']=='Integer'){
return BuilderOp_Integer.fromMap(map);
}
if (map['type']=='BitString'){
return BuilderOp_BitString.fromMap(map);
}
if (map['type']=='Cell'){
return BuilderOp_Cell.fromMap(map);
}
if (map['type']=='CellBoc'){
return BuilderOp_CellBoc.fromMap(map);
}
throw('BuilderOp unknown from map type');
}
}

///Append integer to cell data.
class BuilderOp_Integer extends BuilderOp{
String _type;
String get type => _type;
///Bit size of the value.
int _size;
int get size => _size;
///e.g. `123`, `-123`. - Decimal string. e.g. `"123"`, `"-123"`.
///- `0x` prefixed hexadecimal string.
///  e.g `0x123`, `0X123`, `-0x123`.
dynamic _value;
dynamic get value => _value;
BuilderOp_Integer({@required int size,@required dynamic value,}){

_type = 'Integer';
_size = ArgumentError.checkNotNull(size, 'BuilderOp_Integer size');
_value = ArgumentError.checkNotNull(value, 'BuilderOp_Integer value');
}
BuilderOp_Integer.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'Integer'){throw('Wrong map data');}else{_type = 'Integer';}
if (map.containsKey('size')&&(map['size']!=null)) {_size = map['size'];}else{throw('Wrong map data');}
if (map.containsKey('value')&&(map['value']!=null)) {_value = map['value'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_size!=null) {map['size'] = _size;}
if (_value!=null) {map['value'] = _value;}
map['type'] = _type;return map;
}
}

///Append bit string to cell data.
class BuilderOp_BitString extends BuilderOp{
String _type;
String get type => _type;
///Contains hexadecimal string representation:
///- Can end with `_` tag.
///- Can be prefixed with `x` or `X`.
///- Can be prefixed with `x{` or `X{` and ended with `}`.
///
///Contains binary string represented as a sequence
///of `0` and `1` prefixed with `n` or `N`.
///
///Examples:
///`1AB`, `x1ab`, `X1AB`, `x{1abc}`, `X{1ABC}`
///`2D9_`, `x2D9_`, `X2D9_`, `x{2D9_}`, `X{2D9_}`
///`n00101101100`, `N00101101100`
String _value;
String get value => _value;
BuilderOp_BitString({@required String value,}){

_type = 'BitString';
_value = ArgumentError.checkNotNull(value, 'BuilderOp_BitString value');
}
BuilderOp_BitString.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'BitString'){throw('Wrong map data');}else{_type = 'BitString';}
if (map.containsKey('value')&&(map['value']!=null)) {_value = map['value'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_value!=null) {map['value'] = _value;}
map['type'] = _type;return map;
}
}

///Append ref to nested cells
class BuilderOp_Cell extends BuilderOp{
String _type;
String get type => _type;
///Nested cell builder
List<BuilderOp> _builder;
List<BuilderOp> get builder => _builder;
BuilderOp_Cell({@required List<BuilderOp> builder,}){

_type = 'Cell';
_builder = ArgumentError.checkNotNull(builder, 'BuilderOp_Cell builder');
}
BuilderOp_Cell.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'Cell'){throw('Wrong map data');}else{_type = 'Cell';}
if (map.containsKey('builder')&&(map['builder']!=null)) {_builder = [];
for (var el in map['builder']) {
if (el != null) {_builder.add(BuilderOp.fromMap(el));}else {_builder.add(null);}}}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_builder!=null) {map['builder'] = _builder;}
map['type'] = _type;return map;
}
}

///Append ref to nested cell
class BuilderOp_CellBoc extends BuilderOp{
String _type;
String get type => _type;
///Nested cell BOC encoded with `base64` or BOC cache key.
String _boc;
String get boc => _boc;
BuilderOp_CellBoc({@required String boc,}){

_type = 'CellBoc';
_boc = ArgumentError.checkNotNull(boc, 'BuilderOp_CellBoc boc');
}
BuilderOp_CellBoc.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'CellBoc'){throw('Wrong map data');}else{_type = 'CellBoc';}
if (map.containsKey('boc')&&(map['boc']!=null)) {_boc = map['boc'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_boc!=null) {map['boc'] = _boc;}
map['type'] = _type;return map;
}
}

class ParamsOfEncodeBoc extends TonSdkStructure{
///Cell builder operations.
List<BuilderOp> _builder;
List<BuilderOp> get builder => _builder;
///Cache type to put the result. The BOC itself returned if no cache type provided.
BocCacheType _boc_cache;
BocCacheType get boc_cache => _boc_cache;
ParamsOfEncodeBoc({@required List<BuilderOp> builder, BocCacheType boc_cache,}){

_builder = ArgumentError.checkNotNull(builder, 'ParamsOfEncodeBoc builder');
_boc_cache = boc_cache;
}
ParamsOfEncodeBoc.fromMap(Map<String,dynamic> map){if (map.containsKey('builder')&&(map['builder']!=null)) {_builder = [];
for (var el in map['builder']) {
if (el != null) {_builder.add(BuilderOp.fromMap(el));}else {_builder.add(null);}}}else{throw('Wrong map data');}
if (map.containsKey('boc_cache')&&(map['boc_cache']!=null)) {_boc_cache = BocCacheType.fromMap(map['boc_cache']);}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_builder!=null) {map['builder'] = _builder;}
if (_boc_cache!=null) {map['boc_cache'] = _boc_cache;}
return map;
}
}

class ResultOfEncodeBoc extends TonSdkStructure{
///Encoded cell BOC or BOC cache key.
String _boc;
String get boc => _boc;
ResultOfEncodeBoc({@required String boc,}){

_boc = ArgumentError.checkNotNull(boc, 'ResultOfEncodeBoc boc');
}
ResultOfEncodeBoc.fromMap(Map<String,dynamic> map){if (map.containsKey('boc')&&(map['boc']!=null)) {_boc = map['boc'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_boc!=null) {map['boc'] = _boc;}
return map;
}
}

class ParamsOfGetCodeSalt extends TonSdkStructure{
///Contract code BOC encoded as base64 or code BOC handle
String _code;
String get code => _code;
///Cache type to put the result. The BOC itself returned if no cache type provided.
BocCacheType _boc_cache;
BocCacheType get boc_cache => _boc_cache;
ParamsOfGetCodeSalt({@required String code, BocCacheType boc_cache,}){

_code = ArgumentError.checkNotNull(code, 'ParamsOfGetCodeSalt code');
_boc_cache = boc_cache;
}
ParamsOfGetCodeSalt.fromMap(Map<String,dynamic> map){if (map.containsKey('code')&&(map['code']!=null)) {_code = map['code'];}else{throw('Wrong map data');}
if (map.containsKey('boc_cache')&&(map['boc_cache']!=null)) {_boc_cache = BocCacheType.fromMap(map['boc_cache']);}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_code!=null) {map['code'] = _code;}
if (_boc_cache!=null) {map['boc_cache'] = _boc_cache;}
return map;
}
}

class ResultOfGetCodeSalt extends TonSdkStructure{
///BOC encoded as base64 or BOC handle
String _salt;
String get salt => _salt;
ResultOfGetCodeSalt({ String salt,}){

_salt = salt;
}
ResultOfGetCodeSalt.fromMap(Map<String,dynamic> map){if (map.containsKey('salt')&&(map['salt']!=null)) {_salt = map['salt'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_salt!=null) {map['salt'] = _salt;}
return map;
}
}

class ParamsOfSetCodeSalt extends TonSdkStructure{
///Contract code BOC encoded as base64 or code BOC handle
String _code;
String get code => _code;
///BOC encoded as base64 or BOC handle
String _salt;
String get salt => _salt;
///Cache type to put the result. The BOC itself returned if no cache type provided.
BocCacheType _boc_cache;
BocCacheType get boc_cache => _boc_cache;
ParamsOfSetCodeSalt({@required String code,@required String salt, BocCacheType boc_cache,}){

_code = ArgumentError.checkNotNull(code, 'ParamsOfSetCodeSalt code');
_salt = ArgumentError.checkNotNull(salt, 'ParamsOfSetCodeSalt salt');
_boc_cache = boc_cache;
}
ParamsOfSetCodeSalt.fromMap(Map<String,dynamic> map){if (map.containsKey('code')&&(map['code']!=null)) {_code = map['code'];}else{throw('Wrong map data');}
if (map.containsKey('salt')&&(map['salt']!=null)) {_salt = map['salt'];}else{throw('Wrong map data');}
if (map.containsKey('boc_cache')&&(map['boc_cache']!=null)) {_boc_cache = BocCacheType.fromMap(map['boc_cache']);}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_code!=null) {map['code'] = _code;}
if (_salt!=null) {map['salt'] = _salt;}
if (_boc_cache!=null) {map['boc_cache'] = _boc_cache;}
return map;
}
}

class ResultOfSetCodeSalt extends TonSdkStructure{
///BOC encoded as base64 or BOC handle
String _code;
String get code => _code;
ResultOfSetCodeSalt({@required String code,}){

_code = ArgumentError.checkNotNull(code, 'ResultOfSetCodeSalt code');
}
ResultOfSetCodeSalt.fromMap(Map<String,dynamic> map){if (map.containsKey('code')&&(map['code']!=null)) {_code = map['code'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_code!=null) {map['code'] = _code;}
return map;
}
}

class ParamsOfDecodeTvc extends TonSdkStructure{
///Contract TVC image BOC encoded as base64 or BOC handle
String _tvc;
String get tvc => _tvc;
///Cache type to put the result. The BOC itself returned if no cache type provided.
BocCacheType _boc_cache;
BocCacheType get boc_cache => _boc_cache;
ParamsOfDecodeTvc({@required String tvc, BocCacheType boc_cache,}){

_tvc = ArgumentError.checkNotNull(tvc, 'ParamsOfDecodeTvc tvc');
_boc_cache = boc_cache;
}
ParamsOfDecodeTvc.fromMap(Map<String,dynamic> map){if (map.containsKey('tvc')&&(map['tvc']!=null)) {_tvc = map['tvc'];}else{throw('Wrong map data');}
if (map.containsKey('boc_cache')&&(map['boc_cache']!=null)) {_boc_cache = BocCacheType.fromMap(map['boc_cache']);}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_tvc!=null) {map['tvc'] = _tvc;}
if (_boc_cache!=null) {map['boc_cache'] = _boc_cache;}
return map;
}
}

class ResultOfDecodeTvc extends TonSdkStructure{
///Contract code BOC encoded as base64 or BOC handle
String _code;
String get code => _code;
///Contract code hash
String _code_hash;
String get code_hash => _code_hash;
///Contract code depth
int _code_depth;
int get code_depth => _code_depth;
///Contract data BOC encoded as base64 or BOC handle
String _data;
String get data => _data;
///Contract data hash
String _data_hash;
String get data_hash => _data_hash;
///Contract data depth
int _data_depth;
int get data_depth => _data_depth;
///Contract library BOC encoded as base64 or BOC handle
String _library;
String get library => _library;
///Specifies the contract ability to handle tick transactions
bool _tick;
bool get tick => _tick;
///Specifies the contract ability to handle tock transactions
bool _tock;
bool get tock => _tock;
///Is present and non-zero only in instances of large smart contracts
int _split_depth;
int get split_depth => _split_depth;
///Compiler version, for example 'sol 0.49.0'
String _compiler_version;
String get compiler_version => _compiler_version;
ResultOfDecodeTvc({ String code, String code_hash, int code_depth, String data, String data_hash, int data_depth, String library, bool tick, bool tock, int split_depth, String compiler_version,}){

_code = code;
_code_hash = code_hash;
_code_depth = code_depth;
_data = data;
_data_hash = data_hash;
_data_depth = data_depth;
_library = library;
_tick = tick;
_tock = tock;
_split_depth = split_depth;
_compiler_version = compiler_version;
}
ResultOfDecodeTvc.fromMap(Map<String,dynamic> map){if (map.containsKey('code')&&(map['code']!=null)) {_code = map['code'];}
if (map.containsKey('code_hash')&&(map['code_hash']!=null)) {_code_hash = map['code_hash'];}
if (map.containsKey('code_depth')&&(map['code_depth']!=null)) {_code_depth = map['code_depth'];}
if (map.containsKey('data')&&(map['data']!=null)) {_data = map['data'];}
if (map.containsKey('data_hash')&&(map['data_hash']!=null)) {_data_hash = map['data_hash'];}
if (map.containsKey('data_depth')&&(map['data_depth']!=null)) {_data_depth = map['data_depth'];}
if (map.containsKey('library')&&(map['library']!=null)) {_library = map['library'];}
if (map.containsKey('tick')&&(map['tick']!=null)) {_tick = map['tick'];}
if (map.containsKey('tock')&&(map['tock']!=null)) {_tock = map['tock'];}
if (map.containsKey('split_depth')&&(map['split_depth']!=null)) {_split_depth = map['split_depth'];}
if (map.containsKey('compiler_version')&&(map['compiler_version']!=null)) {_compiler_version = map['compiler_version'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_code!=null) {map['code'] = _code;}
if (_code_hash!=null) {map['code_hash'] = _code_hash;}
if (_code_depth!=null) {map['code_depth'] = _code_depth;}
if (_data!=null) {map['data'] = _data;}
if (_data_hash!=null) {map['data_hash'] = _data_hash;}
if (_data_depth!=null) {map['data_depth'] = _data_depth;}
if (_library!=null) {map['library'] = _library;}
if (_tick!=null) {map['tick'] = _tick;}
if (_tock!=null) {map['tock'] = _tock;}
if (_split_depth!=null) {map['split_depth'] = _split_depth;}
if (_compiler_version!=null) {map['compiler_version'] = _compiler_version;}
return map;
}
}

class ParamsOfEncodeTvc extends TonSdkStructure{
///Contract code BOC encoded as base64 or BOC handle
String _code;
String get code => _code;
///Contract data BOC encoded as base64 or BOC handle
String _data;
String get data => _data;
///Contract library BOC encoded as base64 or BOC handle
String _library;
String get library => _library;
///Specifies the contract ability to handle tick transactions
bool _tick;
bool get tick => _tick;
///Specifies the contract ability to handle tock transactions
bool _tock;
bool get tock => _tock;
///Is present and non-zero only in instances of large smart contracts
int _split_depth;
int get split_depth => _split_depth;
///Cache type to put the result. The BOC itself returned if no cache type provided.
BocCacheType _boc_cache;
BocCacheType get boc_cache => _boc_cache;
ParamsOfEncodeTvc({ String code, String data, String library, bool tick, bool tock, int split_depth, BocCacheType boc_cache,}){

_code = code;
_data = data;
_library = library;
_tick = tick;
_tock = tock;
_split_depth = split_depth;
_boc_cache = boc_cache;
}
ParamsOfEncodeTvc.fromMap(Map<String,dynamic> map){if (map.containsKey('code')&&(map['code']!=null)) {_code = map['code'];}
if (map.containsKey('data')&&(map['data']!=null)) {_data = map['data'];}
if (map.containsKey('library')&&(map['library']!=null)) {_library = map['library'];}
if (map.containsKey('tick')&&(map['tick']!=null)) {_tick = map['tick'];}
if (map.containsKey('tock')&&(map['tock']!=null)) {_tock = map['tock'];}
if (map.containsKey('split_depth')&&(map['split_depth']!=null)) {_split_depth = map['split_depth'];}
if (map.containsKey('boc_cache')&&(map['boc_cache']!=null)) {_boc_cache = BocCacheType.fromMap(map['boc_cache']);}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_code!=null) {map['code'] = _code;}
if (_data!=null) {map['data'] = _data;}
if (_library!=null) {map['library'] = _library;}
if (_tick!=null) {map['tick'] = _tick;}
if (_tock!=null) {map['tock'] = _tock;}
if (_split_depth!=null) {map['split_depth'] = _split_depth;}
if (_boc_cache!=null) {map['boc_cache'] = _boc_cache;}
return map;
}
}

class ResultOfEncodeTvc extends TonSdkStructure{
///Contract TVC image BOC encoded as base64 or BOC handle of boc_cache parameter was specified
String _tvc;
String get tvc => _tvc;
ResultOfEncodeTvc({@required String tvc,}){

_tvc = ArgumentError.checkNotNull(tvc, 'ResultOfEncodeTvc tvc');
}
ResultOfEncodeTvc.fromMap(Map<String,dynamic> map){if (map.containsKey('tvc')&&(map['tvc']!=null)) {_tvc = map['tvc'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_tvc!=null) {map['tvc'] = _tvc;}
return map;
}
}

class ParamsOfGetCompilerVersion extends TonSdkStructure{
///Contract code BOC encoded as base64 or code BOC handle
String _code;
String get code => _code;
ParamsOfGetCompilerVersion({@required String code,}){

_code = ArgumentError.checkNotNull(code, 'ParamsOfGetCompilerVersion code');
}
ParamsOfGetCompilerVersion.fromMap(Map<String,dynamic> map){if (map.containsKey('code')&&(map['code']!=null)) {_code = map['code'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_code!=null) {map['code'] = _code;}
return map;
}
}

class ResultOfGetCompilerVersion extends TonSdkStructure{
///Compiler version, for example 'sol 0.49.0'
String _version;
String get version => _version;
ResultOfGetCompilerVersion({ String version,}){

_version = version;
}
ResultOfGetCompilerVersion.fromMap(Map<String,dynamic> map){if (map.containsKey('version')&&(map['version']!=null)) {_version = map['version'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_version!=null) {map['version'] = _version;}
return map;
}
}

