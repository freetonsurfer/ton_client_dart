part of 'tonsdktypes.dart';

abstract class AddressStringFormat extends TonSdkStructure{
static AddressStringFormat fromMap(Map<String,dynamic> map){
if (map['type']=='AccountId'){
return AddressStringFormat_AccountId.fromMap(map);
}
if (map['type']=='Hex'){
return AddressStringFormat_Hex.fromMap(map);
}
if (map['type']=='Base64'){
return AddressStringFormat_Base64.fromMap(map);
}
throw('AddressStringFormat unknown from map type');
}
}

class AddressStringFormat_AccountId extends AddressStringFormat{
String _type;
String get type => _type;
AddressStringFormat_AccountId(){

_type = 'AccountId';
}
AddressStringFormat_AccountId.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'AccountId'){throw('Wrong map data');}else{_type = 'AccountId';}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
map['type'] = _type;return map;
}
}

class AddressStringFormat_Hex extends AddressStringFormat{
String _type;
String get type => _type;
AddressStringFormat_Hex(){

_type = 'Hex';
}
AddressStringFormat_Hex.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'Hex'){throw('Wrong map data');}else{_type = 'Hex';}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
map['type'] = _type;return map;
}
}

class AddressStringFormat_Base64 extends AddressStringFormat{
String _type;
String get type => _type;
bool _url;
bool get url => _url;
bool _test;
bool get test => _test;
bool _bounce;
bool get bounce => _bounce;
AddressStringFormat_Base64({@required bool url,@required bool test,@required bool bounce,}){

_type = 'Base64';
_url = ArgumentError.checkNotNull(url, 'AddressStringFormat_Base64 url');
_test = ArgumentError.checkNotNull(test, 'AddressStringFormat_Base64 test');
_bounce = ArgumentError.checkNotNull(bounce, 'AddressStringFormat_Base64 bounce');
}
AddressStringFormat_Base64.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'Base64'){throw('Wrong map data');}else{_type = 'Base64';}
if (map.containsKey('url')&&(map['url']!=null)) {_url = map['url'];}else{throw('Wrong map data');}
if (map.containsKey('test')&&(map['test']!=null)) {_test = map['test'];}else{throw('Wrong map data');}
if (map.containsKey('bounce')&&(map['bounce']!=null)) {_bounce = map['bounce'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_url!=null) {map['url'] = _url;}
if (_test!=null) {map['test'] = _test;}
if (_bounce!=null) {map['bounce'] = _bounce;}
map['type'] = _type;return map;
}
}

class ParamsOfConvertAddress extends TonSdkStructure{
/// Account address in any TON format.
String _address;
String get address => _address;
/// Specify the format to convert to.
AddressStringFormat _output_format;
AddressStringFormat get output_format => _output_format;
ParamsOfConvertAddress({@required String address,@required AddressStringFormat output_format,}){

_address = ArgumentError.checkNotNull(address, 'ParamsOfConvertAddress address');
_output_format = ArgumentError.checkNotNull(output_format, 'ParamsOfConvertAddress output_format');
}
ParamsOfConvertAddress.fromMap(Map<String,dynamic> map){if (map.containsKey('address')&&(map['address']!=null)) {_address = map['address'];}else{throw('Wrong map data');}
if (map.containsKey('output_format')&&(map['output_format']!=null)) {if (map['output_format']!=null){_output_format = AddressStringFormat.fromMap(map['output_format']);}}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_address!=null) {map['address'] = _address;}
if (_output_format!=null) {map['output_format'] = _output_format;}
return map;
}
}

class ResultOfConvertAddress extends TonSdkStructure{
/// Address in the specified format
String _address;
String get address => _address;
ResultOfConvertAddress({@required String address,}){

_address = ArgumentError.checkNotNull(address, 'ResultOfConvertAddress address');
}
ResultOfConvertAddress.fromMap(Map<String,dynamic> map){if (map.containsKey('address')&&(map['address']!=null)) {_address = map['address'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_address!=null) {map['address'] = _address;}
return map;
}
}

