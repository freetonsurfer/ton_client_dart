part of 'tonsdktypes.dart';

class ExecutionOptions extends TonSdkStructure{
/// boc with config
String _blockchain_config;
String get blockchain_config => _blockchain_config;
/// time that is used as transaction time
int _block_time;
int get block_time => _block_time;
/// block logical time
BigInt _block_lt;
BigInt get block_lt => _block_lt;
/// transaction logical time
BigInt _transaction_lt;
BigInt get transaction_lt => _transaction_lt;
ExecutionOptions({ String blockchain_config, int block_time, BigInt block_lt, BigInt transaction_lt,}){

_blockchain_config = blockchain_config;
_block_time = block_time;
_block_lt = block_lt;
_transaction_lt = transaction_lt;
}
ExecutionOptions.fromMap(Map<String,dynamic> map){if (map.containsKey('blockchain_config')&&(map['blockchain_config']!=null)) {_blockchain_config = map['blockchain_config'];}
if (map.containsKey('block_time')&&(map['block_time']!=null)) {_block_time = map['block_time'];}
if (map.containsKey('block_lt')&&(map['block_lt']!=null)) {_block_lt = BigInt.from(map['block_lt']);}
if (map.containsKey('transaction_lt')&&(map['transaction_lt']!=null)) {_transaction_lt = BigInt.from(map['transaction_lt']);}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_blockchain_config!=null) {map['blockchain_config'] = _blockchain_config;}
if (_block_time!=null) {map['block_time'] = _block_time;}
if (_block_lt!=null) {map['block_lt'] = _block_lt;}
if (_transaction_lt!=null) {map['transaction_lt'] = _transaction_lt;}
return map;
}
}

abstract class AccountForExecutor extends TonSdkStructure{
static AccountForExecutor fromMap(Map<String,dynamic> map){
if (map['type']=='None'){
return AccountForExecutor_None.fromMap(map);
}
if (map['type']=='Uninit'){
return AccountForExecutor_Uninit.fromMap(map);
}
if (map['type']=='Account'){
return AccountForExecutor_Account.fromMap(map);
}
throw('AccountForExecutor unknown from map type');
}
}

/// Non-existing account to run a creation internal message.
/// Should be used with `skip_transaction_check = true` if the message has no deploy data
/// since transactions on the uninitialized account are always aborted
class AccountForExecutor_None extends AccountForExecutor{
String _type;
String get type => _type;
AccountForExecutor_None(){

_type = 'None';
}
AccountForExecutor_None.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'None'){throw('Wrong map data');}else{_type = 'None';}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
map['type'] = _type;return map;
}
}

/// Emulate uninitialized account to run deploy message
class AccountForExecutor_Uninit extends AccountForExecutor{
String _type;
String get type => _type;
AccountForExecutor_Uninit(){

_type = 'Uninit';
}
AccountForExecutor_Uninit.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'Uninit'){throw('Wrong map data');}else{_type = 'Uninit';}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
map['type'] = _type;return map;
}
}

/// Account state to run message
class AccountForExecutor_Account extends AccountForExecutor{
String _type;
String get type => _type;
/// Account BOC. Encoded as base64.
String _boc;
String get boc => _boc;
/// Flag for running account with the unlimited balance. Can be used to calculate
/// transaction fees without balance check
bool _unlimited_balance;
bool get unlimited_balance => _unlimited_balance;
AccountForExecutor_Account({@required String boc, bool unlimited_balance,}){

_type = 'Account';
_boc = ArgumentError.checkNotNull(boc, 'AccountForExecutor_Account boc');
_unlimited_balance = unlimited_balance;
}
AccountForExecutor_Account.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'Account'){throw('Wrong map data');}else{_type = 'Account';}
if (map.containsKey('boc')&&(map['boc']!=null)) {_boc = map['boc'];}else{throw('Wrong map data');}
if (map.containsKey('unlimited_balance')&&(map['unlimited_balance']!=null)) {_unlimited_balance = map['unlimited_balance'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_boc!=null) {map['boc'] = _boc;}
if (_unlimited_balance!=null) {map['unlimited_balance'] = _unlimited_balance;}
map['type'] = _type;return map;
}
}

class TransactionFees extends TonSdkStructure{
BigInt _in_msg_fwd_fee;
BigInt get in_msg_fwd_fee => _in_msg_fwd_fee;
BigInt _storage_fee;
BigInt get storage_fee => _storage_fee;
BigInt _gas_fee;
BigInt get gas_fee => _gas_fee;
BigInt _out_msgs_fwd_fee;
BigInt get out_msgs_fwd_fee => _out_msgs_fwd_fee;
BigInt _total_account_fees;
BigInt get total_account_fees => _total_account_fees;
BigInt _total_output;
BigInt get total_output => _total_output;
TransactionFees({@required BigInt in_msg_fwd_fee,@required BigInt storage_fee,@required BigInt gas_fee,@required BigInt out_msgs_fwd_fee,@required BigInt total_account_fees,@required BigInt total_output,}){

_in_msg_fwd_fee = ArgumentError.checkNotNull(in_msg_fwd_fee, 'TransactionFees in_msg_fwd_fee');
_storage_fee = ArgumentError.checkNotNull(storage_fee, 'TransactionFees storage_fee');
_gas_fee = ArgumentError.checkNotNull(gas_fee, 'TransactionFees gas_fee');
_out_msgs_fwd_fee = ArgumentError.checkNotNull(out_msgs_fwd_fee, 'TransactionFees out_msgs_fwd_fee');
_total_account_fees = ArgumentError.checkNotNull(total_account_fees, 'TransactionFees total_account_fees');
_total_output = ArgumentError.checkNotNull(total_output, 'TransactionFees total_output');
}
TransactionFees.fromMap(Map<String,dynamic> map){if (map.containsKey('in_msg_fwd_fee')&&(map['in_msg_fwd_fee']!=null)) {_in_msg_fwd_fee = BigInt.from(map['in_msg_fwd_fee']);}else{throw('Wrong map data');}
if (map.containsKey('storage_fee')&&(map['storage_fee']!=null)) {_storage_fee = BigInt.from(map['storage_fee']);}else{throw('Wrong map data');}
if (map.containsKey('gas_fee')&&(map['gas_fee']!=null)) {_gas_fee = BigInt.from(map['gas_fee']);}else{throw('Wrong map data');}
if (map.containsKey('out_msgs_fwd_fee')&&(map['out_msgs_fwd_fee']!=null)) {_out_msgs_fwd_fee = BigInt.from(map['out_msgs_fwd_fee']);}else{throw('Wrong map data');}
if (map.containsKey('total_account_fees')&&(map['total_account_fees']!=null)) {_total_account_fees = BigInt.from(map['total_account_fees']);}else{throw('Wrong map data');}
if (map.containsKey('total_output')&&(map['total_output']!=null)) {_total_output = BigInt.from(map['total_output']);}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_in_msg_fwd_fee!=null) {map['in_msg_fwd_fee'] = _in_msg_fwd_fee;}
if (_storage_fee!=null) {map['storage_fee'] = _storage_fee;}
if (_gas_fee!=null) {map['gas_fee'] = _gas_fee;}
if (_out_msgs_fwd_fee!=null) {map['out_msgs_fwd_fee'] = _out_msgs_fwd_fee;}
if (_total_account_fees!=null) {map['total_account_fees'] = _total_account_fees;}
if (_total_output!=null) {map['total_output'] = _total_output;}
return map;
}
}

class ParamsOfRunExecutor extends TonSdkStructure{
/// Input message BOC. Must be encoded as base64.
String _message;
String get message => _message;
/// Account to run on executor
AccountForExecutor _account;
AccountForExecutor get account => _account;
/// Execution options.
ExecutionOptions _execution_options;
ExecutionOptions get execution_options => _execution_options;
/// Contract ABI for decoding output messages
Abi _abi;
Abi get abi => _abi;
/// Skip transaction check flag
bool _skip_transaction_check;
bool get skip_transaction_check => _skip_transaction_check;
ParamsOfRunExecutor({@required String message,@required AccountForExecutor account, ExecutionOptions execution_options, Abi abi, bool skip_transaction_check,}){

_message = ArgumentError.checkNotNull(message, 'ParamsOfRunExecutor message');
_account = ArgumentError.checkNotNull(account, 'ParamsOfRunExecutor account');
_execution_options = execution_options;
_abi = abi;
_skip_transaction_check = skip_transaction_check;
}
ParamsOfRunExecutor.fromMap(Map<String,dynamic> map){if (map.containsKey('message')&&(map['message']!=null)) {_message = map['message'];}else{throw('Wrong map data');}
if (map.containsKey('account')&&(map['account']!=null)) {_account = AccountForExecutor.fromMap(map['account']);}else{throw('Wrong map data');}
if (map.containsKey('execution_options')&&(map['execution_options']!=null)) {_execution_options = ExecutionOptions.fromMap(map['execution_options']);}
if (map.containsKey('abi')&&(map['abi']!=null)) {_abi = Abi.fromMap(map['abi']);}
if (map.containsKey('skip_transaction_check')&&(map['skip_transaction_check']!=null)) {_skip_transaction_check = map['skip_transaction_check'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_message!=null) {map['message'] = _message;}
if (_account!=null) {map['account'] = _account;}
if (_execution_options!=null) {map['execution_options'] = _execution_options;}
if (_abi!=null) {map['abi'] = _abi;}
if (_skip_transaction_check!=null) {map['skip_transaction_check'] = _skip_transaction_check;}
return map;
}
}

class ResultOfRunExecutor extends TonSdkStructure{
/// Parsed transaction.
///
/// In addition to the regular transaction fields there is a
/// `boc` field encoded with `base64` which contains source
/// transaction BOC.
dynamic _transaction;
dynamic get transaction => _transaction;
/// List of output messages' BOCs. Encoded as `base64`
List<String> _out_messages;
List<String> get out_messages => _out_messages;
/// Optional decoded message bodies according to the optional
/// `abi` parameter.
DecodedOutput _decoded;
DecodedOutput get decoded => _decoded;
/// Updated account state BOC. Encoded as `base64`
String _account;
String get account => _account;
/// Transaction fees
TransactionFees _fees;
TransactionFees get fees => _fees;
ResultOfRunExecutor({@required dynamic transaction,@required List<String> out_messages, DecodedOutput decoded,@required String account,@required TransactionFees fees,}){

_transaction = ArgumentError.checkNotNull(transaction, 'ResultOfRunExecutor transaction');
_out_messages = ArgumentError.checkNotNull(out_messages, 'ResultOfRunExecutor out_messages');
_decoded = decoded;
_account = ArgumentError.checkNotNull(account, 'ResultOfRunExecutor account');
_fees = ArgumentError.checkNotNull(fees, 'ResultOfRunExecutor fees');
}
ResultOfRunExecutor.fromMap(Map<String,dynamic> map){if (map.containsKey('transaction')&&(map['transaction']!=null)) {_transaction = map['transaction'];}else{throw('Wrong map data');}
if (map.containsKey('out_messages')&&(map['out_messages']!=null)) {_out_messages = [];
for (var el in map['out_messages']) {
if (el != null) {_out_messages.add(el);}else {_out_messages.add(null);}}}else{throw('Wrong map data');}
if (map.containsKey('decoded')&&(map['decoded']!=null)) {_decoded = DecodedOutput.fromMap(map['decoded']);}
if (map.containsKey('account')&&(map['account']!=null)) {_account = map['account'];}else{throw('Wrong map data');}
if (map.containsKey('fees')&&(map['fees']!=null)) {_fees = TransactionFees.fromMap(map['fees']);}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_transaction!=null) {map['transaction'] = _transaction;}
if (_out_messages!=null) {map['out_messages'] = _out_messages;}
if (_decoded!=null) {map['decoded'] = _decoded;}
if (_account!=null) {map['account'] = _account;}
if (_fees!=null) {map['fees'] = _fees;}
return map;
}
}

class ParamsOfRunTvm extends TonSdkStructure{
/// Input message BOC. Must be encoded as base64.
String _message;
String get message => _message;
/// Account BOC. Must be encoded as base64.
String _account;
String get account => _account;
/// Execution options.
ExecutionOptions _execution_options;
ExecutionOptions get execution_options => _execution_options;
/// Contract ABI for dedcoding output messages
Abi _abi;
Abi get abi => _abi;
ParamsOfRunTvm({@required String message,@required String account, ExecutionOptions execution_options, Abi abi,}){

_message = ArgumentError.checkNotNull(message, 'ParamsOfRunTvm message');
_account = ArgumentError.checkNotNull(account, 'ParamsOfRunTvm account');
_execution_options = execution_options;
_abi = abi;
}
ParamsOfRunTvm.fromMap(Map<String,dynamic> map){if (map.containsKey('message')&&(map['message']!=null)) {_message = map['message'];}else{throw('Wrong map data');}
if (map.containsKey('account')&&(map['account']!=null)) {_account = map['account'];}else{throw('Wrong map data');}
if (map.containsKey('execution_options')&&(map['execution_options']!=null)) {_execution_options = ExecutionOptions.fromMap(map['execution_options']);}
if (map.containsKey('abi')&&(map['abi']!=null)) {_abi = Abi.fromMap(map['abi']);}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_message!=null) {map['message'] = _message;}
if (_account!=null) {map['account'] = _account;}
if (_execution_options!=null) {map['execution_options'] = _execution_options;}
if (_abi!=null) {map['abi'] = _abi;}
return map;
}
}

class ResultOfRunTvm extends TonSdkStructure{
/// List of output messages' BOCs. Encoded as `base64`
List<String> _out_messages;
List<String> get out_messages => _out_messages;
/// Optional decoded message bodies according to the optional
/// `abi` parameter.
DecodedOutput _decoded;
DecodedOutput get decoded => _decoded;
/// Updated account state BOC. Encoded as `base64`.
/// Attention! Only data in account state is updated.
String _account;
String get account => _account;
ResultOfRunTvm({@required List<String> out_messages, DecodedOutput decoded,@required String account,}){

_out_messages = ArgumentError.checkNotNull(out_messages, 'ResultOfRunTvm out_messages');
_decoded = decoded;
_account = ArgumentError.checkNotNull(account, 'ResultOfRunTvm account');
}
ResultOfRunTvm.fromMap(Map<String,dynamic> map){if (map.containsKey('out_messages')&&(map['out_messages']!=null)) {_out_messages = [];
for (var el in map['out_messages']) {
if (el != null) {_out_messages.add(el);}else {_out_messages.add(null);}}}else{throw('Wrong map data');}
if (map.containsKey('decoded')&&(map['decoded']!=null)) {_decoded = DecodedOutput.fromMap(map['decoded']);}
if (map.containsKey('account')&&(map['account']!=null)) {_account = map['account'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_out_messages!=null) {map['out_messages'] = _out_messages;}
if (_decoded!=null) {map['decoded'] = _decoded;}
if (_account!=null) {map['account'] = _account;}
return map;
}
}

class ParamsOfRunGet extends TonSdkStructure{
/// Account BOC in `base64`
String _account;
String get account => _account;
/// Function name
String _function_name;
String get function_name => _function_name;
/// Input parameters
dynamic _input;
dynamic get input => _input;
ExecutionOptions _execution_options;
ExecutionOptions get execution_options => _execution_options;
ParamsOfRunGet({@required String account,@required String function_name, dynamic input, ExecutionOptions execution_options,}){

_account = ArgumentError.checkNotNull(account, 'ParamsOfRunGet account');
_function_name = ArgumentError.checkNotNull(function_name, 'ParamsOfRunGet function_name');
_input = input;
_execution_options = execution_options;
}
ParamsOfRunGet.fromMap(Map<String,dynamic> map){if (map.containsKey('account')&&(map['account']!=null)) {_account = map['account'];}else{throw('Wrong map data');}
if (map.containsKey('function_name')&&(map['function_name']!=null)) {_function_name = map['function_name'];}else{throw('Wrong map data');}
if (map.containsKey('input')&&(map['input']!=null)) {_input = map['input'];}
if (map.containsKey('execution_options')&&(map['execution_options']!=null)) {_execution_options = ExecutionOptions.fromMap(map['execution_options']);}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_account!=null) {map['account'] = _account;}
if (_function_name!=null) {map['function_name'] = _function_name;}
if (_input!=null) {map['input'] = _input;}
if (_execution_options!=null) {map['execution_options'] = _execution_options;}
return map;
}
}

class ResultOfRunGet extends TonSdkStructure{
/// Values returned by getmethod on stack
dynamic _output;
dynamic get output => _output;
ResultOfRunGet({@required dynamic output,}){

_output = ArgumentError.checkNotNull(output, 'ResultOfRunGet output');
}
ResultOfRunGet.fromMap(Map<String,dynamic> map){if (map.containsKey('output')&&(map['output']!=null)) {_output = map['output'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_output!=null) {map['output'] = _output;}
return map;
}
}

