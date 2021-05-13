part of 'tonsdktypes.dart';

class DebotErrorCode {
  String _value;
  String get value => _value;
  DebotErrorCode.DebotStartFailed() {
    _value = 'DebotStartFailed';
  }
  DebotErrorCode.DebotFetchFailed() {
    _value = 'DebotFetchFailed';
  }
  DebotErrorCode.DebotExecutionFailed() {
    _value = 'DebotExecutionFailed';
  }
  DebotErrorCode.DebotInvalidHandle() {
    _value = 'DebotInvalidHandle';
  }
  DebotErrorCode.DebotInvalidJsonParams() {
    _value = 'DebotInvalidJsonParams';
  }
  DebotErrorCode.DebotInvalidFunctionId() {
    _value = 'DebotInvalidFunctionId';
  }
  DebotErrorCode.DebotInvalidAbi() {
    _value = 'DebotInvalidAbi';
  }
  DebotErrorCode.DebotGetMethodFailed() {
    _value = 'DebotGetMethodFailed';
  }
  DebotErrorCode.DebotInvalidMsg() {
    _value = 'DebotInvalidMsg';
  }
  DebotErrorCode.DebotExternalCallFailed() {
    _value = 'DebotExternalCallFailed';
  }
  DebotErrorCode.DebotBrowserCallbackFailed() {
    _value = 'DebotBrowserCallbackFailed';
  }
  DebotErrorCode.DebotOperationRejected() {
    _value = 'DebotOperationRejected';
  }
  @override
  String toString() {
    return '"$_value"';
  }

  DebotErrorCode.fromMap(str) {
    _value = str;
  }
}

///[UNSTABLE](UNSTABLE.md) Handle of registered in SDK debot
//typedef DebotHandle int;
///[UNSTABLE](UNSTABLE.md) Describes a debot action in a Debot Context.
class DebotAction extends TonSdkStructure {
  ///Should be used by Debot Browser as name of menu item.
  String _description;
  String get description => _description;

  ///Can be a debot function name or a print string (for Print Action).
  String _name;
  String get name => _name;

  ///Action type.
  int _action_type;
  int get action_type => _action_type;

  ///ID of debot context to switch after action execution.
  int _to;
  int get to => _to;

  ///In the form of "param=value,flag". attribute example: instant, args, fargs, sign.
  String _attributes;
  String get attributes => _attributes;

  ///Used by debot only.
  String _misc;
  String get misc => _misc;
  DebotAction({
    @required String description,
    @required String name,
    @required int action_type,
    @required int to,
    @required String attributes,
    @required String misc,
  }) {
    _description =
        ArgumentError.checkNotNull(description, 'DebotAction description');
    _name = ArgumentError.checkNotNull(name, 'DebotAction name');
    _action_type =
        ArgumentError.checkNotNull(action_type, 'DebotAction action_type');
    _to = ArgumentError.checkNotNull(to, 'DebotAction to');
    _attributes =
        ArgumentError.checkNotNull(attributes, 'DebotAction attributes');
    _misc = ArgumentError.checkNotNull(misc, 'DebotAction misc');
  }
  DebotAction.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('description') && (map['description'] != null)) {
      _description = map['description'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('name') && (map['name'] != null)) {
      _name = map['name'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('action_type') && (map['action_type'] != null)) {
      _action_type = map['action_type'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('to') && (map['to'] != null)) {
      _to = map['to'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('attributes') && (map['attributes'] != null)) {
      _attributes = map['attributes'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('misc') && (map['misc'] != null)) {
      _misc = map['misc'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_description != null) {
      map['description'] = _description;
    }
    if (_name != null) {
      map['name'] = _name;
    }
    if (_action_type != null) {
      map['action_type'] = _action_type;
    }
    if (_to != null) {
      map['to'] = _to;
    }
    if (_attributes != null) {
      map['attributes'] = _attributes;
    }
    if (_misc != null) {
      map['misc'] = _misc;
    }
    return map;
  }
}

///[UNSTABLE](UNSTABLE.md) Describes DeBot metadata.
class DebotInfo extends TonSdkStructure {
  ///DeBot short name.
  String _name;
  String get name => _name;

  ///DeBot semantic version.
  String _version;
  String get version => _version;

  ///The name of DeBot deployer.
  String _publisher;
  String get publisher => _publisher;

  ///Short info about DeBot.
  String _caption;
  String get caption => _caption;

  ///The name of DeBot developer.
  String _author;
  String get author => _author;

  ///TON address of author for questions and donations.
  String _support;
  String get support => _support;

  ///String with the first messsage from DeBot.
  String _hello;
  String get hello => _hello;

  ///String with DeBot interface language (ISO-639).
  String _language;
  String get language => _language;

  ///String with DeBot ABI.
  String _dabi;
  String get dabi => _dabi;

  ///DeBot icon.
  String _icon;
  String get icon => _icon;

  ///Vector with IDs of DInterfaces used by DeBot.
  List<String> _interfaces;
  List<String> get interfaces => _interfaces;
  DebotInfo({
    String name,
    String version,
    String publisher,
    String caption,
    String author,
    String support,
    String hello,
    String language,
    String dabi,
    String icon,
    @required List<String> interfaces,
  }) {
    _name = name;
    _version = version;
    _publisher = publisher;
    _caption = caption;
    _author = author;
    _support = support;
    _hello = hello;
    _language = language;
    _dabi = dabi;
    _icon = icon;
    _interfaces =
        ArgumentError.checkNotNull(interfaces, 'DebotInfo interfaces');
  }
  DebotInfo.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('name') && (map['name'] != null)) {
      _name = map['name'];
    }
    if (map.containsKey('version') && (map['version'] != null)) {
      _version = map['version'];
    }
    if (map.containsKey('publisher') && (map['publisher'] != null)) {
      _publisher = map['publisher'];
    }
    if (map.containsKey('caption') && (map['caption'] != null)) {
      _caption = map['caption'];
    }
    if (map.containsKey('author') && (map['author'] != null)) {
      _author = map['author'];
    }
    if (map.containsKey('support') && (map['support'] != null)) {
      _support = map['support'];
    }
    if (map.containsKey('hello') && (map['hello'] != null)) {
      _hello = map['hello'];
    }
    if (map.containsKey('language') && (map['language'] != null)) {
      _language = map['language'];
    }
    if (map.containsKey('dabi') && (map['dabi'] != null)) {
      _dabi = map['dabi'];
    }
    if (map.containsKey('icon') && (map['icon'] != null)) {
      _icon = map['icon'];
    }
    if (map.containsKey('interfaces') && (map['interfaces'] != null)) {
      _interfaces = [];
      for (var el in map['interfaces']) {
        if (el != null) {
          _interfaces.add(el);
        } else {
          _interfaces.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_name != null) {
      map['name'] = _name;
    }
    if (_version != null) {
      map['version'] = _version;
    }
    if (_publisher != null) {
      map['publisher'] = _publisher;
    }
    if (_caption != null) {
      map['caption'] = _caption;
    }
    if (_author != null) {
      map['author'] = _author;
    }
    if (_support != null) {
      map['support'] = _support;
    }
    if (_hello != null) {
      map['hello'] = _hello;
    }
    if (_language != null) {
      map['language'] = _language;
    }
    if (_dabi != null) {
      map['dabi'] = _dabi;
    }
    if (_icon != null) {
      map['icon'] = _icon;
    }
    if (_interfaces != null) {
      map['interfaces'] = _interfaces;
    }
    return map;
  }
}

///[UNSTABLE](UNSTABLE.md) Describes the operation that the DeBot wants to perform.
abstract class DebotActivity extends TonSdkStructure {
  static DebotActivity fromMap(Map<String, dynamic> map) {
    if (map['type'] == 'Transaction') {
      return DebotActivity_Transaction.fromMap(map);
    }
    throw ('DebotActivity unknown from map type');
  }
}

///DeBot wants to create new transaction in blockchain.
class DebotActivity_Transaction extends DebotActivity {
  String _type;
  String get type => _type;

  ///External inbound message BOC.
  String _msg;
  String get msg => _msg;

  ///Target smart contract address.
  String _dst;
  String get dst => _dst;

  ///List of spendings as a result of transaction.
  List<Spending> _out;
  List<Spending> get out => _out;

  ///Transaction total fee.
  BigInt _fee;
  BigInt get fee => _fee;

  ///Indicates if target smart contract updates its code.
  bool _setcode;
  bool get setcode => _setcode;

  ///Public key from keypair that was used to sign external message.
  String _signkey;
  String get signkey => _signkey;
  DebotActivity_Transaction({
    @required String msg,
    @required String dst,
    @required List<Spending> out,
    @required BigInt fee,
    @required bool setcode,
    @required String signkey,
  }) {
    _type = 'Transaction';
    _msg = ArgumentError.checkNotNull(msg, 'DebotActivity_Transaction msg');
    _dst = ArgumentError.checkNotNull(dst, 'DebotActivity_Transaction dst');
    _out = ArgumentError.checkNotNull(out, 'DebotActivity_Transaction out');
    _fee = ArgumentError.checkNotNull(fee, 'DebotActivity_Transaction fee');
    _setcode = ArgumentError.checkNotNull(
        setcode, 'DebotActivity_Transaction setcode');
    _signkey = ArgumentError.checkNotNull(
        signkey, 'DebotActivity_Transaction signkey');
  }
  DebotActivity_Transaction.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Transaction') {
      throw ('Wrong map data');
    } else {
      _type = 'Transaction';
    }
    if (map.containsKey('msg') && (map['msg'] != null)) {
      _msg = map['msg'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('dst') && (map['dst'] != null)) {
      _dst = map['dst'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('out') && (map['out'] != null)) {
      _out = [];
      for (var el in map['out']) {
        if (el != null) {
          _out.add(Spending.fromMap(el));
        } else {
          _out.add(null);
        }
      }
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('fee') && (map['fee'] != null)) {
      _fee = BigInt.from(map['fee']);
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('setcode') && (map['setcode'] != null)) {
      _setcode = map['setcode'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('signkey') && (map['signkey'] != null)) {
      _signkey = map['signkey'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_msg != null) {
      map['msg'] = _msg;
    }
    if (_dst != null) {
      map['dst'] = _dst;
    }
    if (_out != null) {
      map['out'] = _out;
    }
    if (_fee != null) {
      map['fee'] = _fee;
    }
    if (_setcode != null) {
      map['setcode'] = _setcode;
    }
    if (_signkey != null) {
      map['signkey'] = _signkey;
    }
    map['type'] = _type;
    return map;
  }
}

///[UNSTABLE](UNSTABLE.md) Describes how much funds will be debited from the target  contract balance as a result of the transaction.
class Spending extends TonSdkStructure {
  ///Amount of nanotokens that will be sent to `dst` address.
  BigInt _amount;
  BigInt get amount => _amount;

  ///Destination address of recipient of funds.
  String _dst;
  String get dst => _dst;
  Spending({
    @required BigInt amount,
    @required String dst,
  }) {
    _amount = ArgumentError.checkNotNull(amount, 'Spending amount');
    _dst = ArgumentError.checkNotNull(dst, 'Spending dst');
  }
  Spending.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('amount') && (map['amount'] != null)) {
      _amount = BigInt.from(map['amount']);
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('dst') && (map['dst'] != null)) {
      _dst = map['dst'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_amount != null) {
      map['amount'] = _amount;
    }
    if (_dst != null) {
      map['dst'] = _dst;
    }
    return map;
  }
}

///[UNSTABLE](UNSTABLE.md) Parameters to init DeBot.
class ParamsOfInit extends TonSdkStructure {
  ///Debot smart contract address
  String _address;
  String get address => _address;
  ParamsOfInit({
    @required String address,
  }) {
    _address = ArgumentError.checkNotNull(address, 'ParamsOfInit address');
  }
  ParamsOfInit.fromMap(Map<String, dynamic> map) {
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

///[UNSTABLE](UNSTABLE.md) Structure for storing debot handle returned from `init` function.
class RegisteredDebot extends TonSdkStructure {
  ///Debot handle which references an instance of debot engine.
  int _debot_handle;
  int get debot_handle => _debot_handle;

  ///Debot abi as json string.
  String _debot_abi;
  String get debot_abi => _debot_abi;

  ///Debot metadata.
  DebotInfo _info;
  DebotInfo get info => _info;
  RegisteredDebot({
    @required int debot_handle,
    @required String debot_abi,
    @required DebotInfo info,
  }) {
    _debot_handle = ArgumentError.checkNotNull(
        debot_handle, 'RegisteredDebot debot_handle');
    _debot_abi =
        ArgumentError.checkNotNull(debot_abi, 'RegisteredDebot debot_abi');
    _info = ArgumentError.checkNotNull(info, 'RegisteredDebot info');
  }
  RegisteredDebot.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('debot_handle') && (map['debot_handle'] != null)) {
      _debot_handle = map['debot_handle'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('debot_abi') && (map['debot_abi'] != null)) {
      _debot_abi = map['debot_abi'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('info') && (map['info'] != null)) {
      _info = DebotInfo.fromMap(map['info']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_debot_handle != null) {
      map['debot_handle'] = _debot_handle;
    }
    if (_debot_abi != null) {
      map['debot_abi'] = _debot_abi;
    }
    if (_info != null) {
      map['info'] = _info;
    }
    return map;
  }
}

///Called by debot engine to communicate with debot browser.
abstract class ParamsOfAppDebotBrowser extends TonSdkStructure {
  static ParamsOfAppDebotBrowser fromMap(Map<String, dynamic> map) {
    if (map['type'] == 'Log') {
      return ParamsOfAppDebotBrowser_Log.fromMap(map);
    }
    if (map['type'] == 'Switch') {
      return ParamsOfAppDebotBrowser_Switch.fromMap(map);
    }
    if (map['type'] == 'SwitchCompleted') {
      return ParamsOfAppDebotBrowser_SwitchCompleted.fromMap(map);
    }
    if (map['type'] == 'ShowAction') {
      return ParamsOfAppDebotBrowser_ShowAction.fromMap(map);
    }
    if (map['type'] == 'Input') {
      return ParamsOfAppDebotBrowser_Input.fromMap(map);
    }
    if (map['type'] == 'GetSigningBox') {
      return ParamsOfAppDebotBrowser_GetSigningBox.fromMap(map);
    }
    if (map['type'] == 'InvokeDebot') {
      return ParamsOfAppDebotBrowser_InvokeDebot.fromMap(map);
    }
    if (map['type'] == 'Send') {
      return ParamsOfAppDebotBrowser_Send.fromMap(map);
    }
    if (map['type'] == 'Approve') {
      return ParamsOfAppDebotBrowser_Approve.fromMap(map);
    }
    throw ('ParamsOfAppDebotBrowser unknown from map type');
  }
}

///Print message to user.
class ParamsOfAppDebotBrowser_Log extends ParamsOfAppDebotBrowser {
  String _type;
  String get type => _type;

  ///A string that must be printed to user.
  String _msg;
  String get msg => _msg;
  ParamsOfAppDebotBrowser_Log({
    @required String msg,
  }) {
    _type = 'Log';
    _msg = ArgumentError.checkNotNull(msg, 'ParamsOfAppDebotBrowser_Log msg');
  }
  ParamsOfAppDebotBrowser_Log.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Log') {
      throw ('Wrong map data');
    } else {
      _type = 'Log';
    }
    if (map.containsKey('msg') && (map['msg'] != null)) {
      _msg = map['msg'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_msg != null) {
      map['msg'] = _msg;
    }
    map['type'] = _type;
    return map;
  }
}

///Switch debot to another context (menu).
class ParamsOfAppDebotBrowser_Switch extends ParamsOfAppDebotBrowser {
  String _type;
  String get type => _type;

  ///Debot context ID to which debot is switched.
  int _context_id;
  int get context_id => _context_id;
  ParamsOfAppDebotBrowser_Switch({
    @required int context_id,
  }) {
    _type = 'Switch';
    _context_id = ArgumentError.checkNotNull(
        context_id, 'ParamsOfAppDebotBrowser_Switch context_id');
  }
  ParamsOfAppDebotBrowser_Switch.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Switch') {
      throw ('Wrong map data');
    } else {
      _type = 'Switch';
    }
    if (map.containsKey('context_id') && (map['context_id'] != null)) {
      _context_id = map['context_id'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_context_id != null) {
      map['context_id'] = _context_id;
    }
    map['type'] = _type;
    return map;
  }
}

///Notify browser that all context actions are shown.
class ParamsOfAppDebotBrowser_SwitchCompleted extends ParamsOfAppDebotBrowser {
  String _type;
  String get type => _type;
  ParamsOfAppDebotBrowser_SwitchCompleted() {
    _type = 'SwitchCompleted';
  }
  ParamsOfAppDebotBrowser_SwitchCompleted.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'SwitchCompleted') {
      throw ('Wrong map data');
    } else {
      _type = 'SwitchCompleted';
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['type'] = _type;
    return map;
  }
}

///Show action to the user. Called after `switch` for each action in context.
class ParamsOfAppDebotBrowser_ShowAction extends ParamsOfAppDebotBrowser {
  String _type;
  String get type => _type;

  ///Debot action that must be shown to user as menu item. At least `description` property must be shown from [DebotAction] structure.
  DebotAction _action;
  DebotAction get action => _action;
  ParamsOfAppDebotBrowser_ShowAction({
    @required DebotAction action,
  }) {
    _type = 'ShowAction';
    _action = ArgumentError.checkNotNull(
        action, 'ParamsOfAppDebotBrowser_ShowAction action');
  }
  ParamsOfAppDebotBrowser_ShowAction.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'ShowAction') {
      throw ('Wrong map data');
    } else {
      _type = 'ShowAction';
    }
    if (map.containsKey('action') && (map['action'] != null)) {
      _action = DebotAction.fromMap(map['action']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_action != null) {
      map['action'] = _action;
    }
    map['type'] = _type;
    return map;
  }
}

///Request user input.
class ParamsOfAppDebotBrowser_Input extends ParamsOfAppDebotBrowser {
  String _type;
  String get type => _type;

  ///A prompt string that must be printed to user before input request.
  String _prompt;
  String get prompt => _prompt;
  ParamsOfAppDebotBrowser_Input({
    @required String prompt,
  }) {
    _type = 'Input';
    _prompt = ArgumentError.checkNotNull(
        prompt, 'ParamsOfAppDebotBrowser_Input prompt');
  }
  ParamsOfAppDebotBrowser_Input.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Input') {
      throw ('Wrong map data');
    } else {
      _type = 'Input';
    }
    if (map.containsKey('prompt') && (map['prompt'] != null)) {
      _prompt = map['prompt'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_prompt != null) {
      map['prompt'] = _prompt;
    }
    map['type'] = _type;
    return map;
  }
}

///Signing box returned is owned and disposed by debot engine
class ParamsOfAppDebotBrowser_GetSigningBox extends ParamsOfAppDebotBrowser {
  String _type;
  String get type => _type;
  ParamsOfAppDebotBrowser_GetSigningBox() {
    _type = 'GetSigningBox';
  }
  ParamsOfAppDebotBrowser_GetSigningBox.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'GetSigningBox') {
      throw ('Wrong map data');
    } else {
      _type = 'GetSigningBox';
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['type'] = _type;
    return map;
  }
}

///Execute action of another debot.
class ParamsOfAppDebotBrowser_InvokeDebot extends ParamsOfAppDebotBrowser {
  String _type;
  String get type => _type;

  ///Address of debot in blockchain.
  String _debot_addr;
  String get debot_addr => _debot_addr;

  ///Debot action to execute.
  DebotAction _action;
  DebotAction get action => _action;
  ParamsOfAppDebotBrowser_InvokeDebot({
    @required String debot_addr,
    @required DebotAction action,
  }) {
    _type = 'InvokeDebot';
    _debot_addr = ArgumentError.checkNotNull(
        debot_addr, 'ParamsOfAppDebotBrowser_InvokeDebot debot_addr');
    _action = ArgumentError.checkNotNull(
        action, 'ParamsOfAppDebotBrowser_InvokeDebot action');
  }
  ParamsOfAppDebotBrowser_InvokeDebot.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'InvokeDebot') {
      throw ('Wrong map data');
    } else {
      _type = 'InvokeDebot';
    }
    if (map.containsKey('debot_addr') && (map['debot_addr'] != null)) {
      _debot_addr = map['debot_addr'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('action') && (map['action'] != null)) {
      _action = DebotAction.fromMap(map['action']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_debot_addr != null) {
      map['debot_addr'] = _debot_addr;
    }
    if (_action != null) {
      map['action'] = _action;
    }
    map['type'] = _type;
    return map;
  }
}

///Used by Debot to call DInterface implemented by Debot Browser.
class ParamsOfAppDebotBrowser_Send extends ParamsOfAppDebotBrowser {
  String _type;
  String get type => _type;

  ///Message body contains interface function and parameters.
  String _message;
  String get message => _message;
  ParamsOfAppDebotBrowser_Send({
    @required String message,
  }) {
    _type = 'Send';
    _message = ArgumentError.checkNotNull(
        message, 'ParamsOfAppDebotBrowser_Send message');
  }
  ParamsOfAppDebotBrowser_Send.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Send') {
      throw ('Wrong map data');
    } else {
      _type = 'Send';
    }
    if (map.containsKey('message') && (map['message'] != null)) {
      _message = map['message'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_message != null) {
      map['message'] = _message;
    }
    map['type'] = _type;
    return map;
  }
}

///Requests permission from DeBot Browser to execute DeBot operation.
class ParamsOfAppDebotBrowser_Approve extends ParamsOfAppDebotBrowser {
  String _type;
  String get type => _type;

  ///DeBot activity details.
  DebotActivity _activity;
  DebotActivity get activity => _activity;
  ParamsOfAppDebotBrowser_Approve({
    @required DebotActivity activity,
  }) {
    _type = 'Approve';
    _activity = ArgumentError.checkNotNull(
        activity, 'ParamsOfAppDebotBrowser_Approve activity');
  }
  ParamsOfAppDebotBrowser_Approve.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Approve') {
      throw ('Wrong map data');
    } else {
      _type = 'Approve';
    }
    if (map.containsKey('activity') && (map['activity'] != null)) {
      _activity = DebotActivity.fromMap(map['activity']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_activity != null) {
      map['activity'] = _activity;
    }
    map['type'] = _type;
    return map;
  }
}

///[UNSTABLE](UNSTABLE.md) Returning values from Debot Browser callbacks.
abstract class ResultOfAppDebotBrowser extends TonSdkStructure {
  static ResultOfAppDebotBrowser fromMap(Map<String, dynamic> map) {
    if (map['type'] == 'Input') {
      return ResultOfAppDebotBrowser_Input.fromMap(map);
    }
    if (map['type'] == 'GetSigningBox') {
      return ResultOfAppDebotBrowser_GetSigningBox.fromMap(map);
    }
    if (map['type'] == 'InvokeDebot') {
      return ResultOfAppDebotBrowser_InvokeDebot.fromMap(map);
    }
    if (map['type'] == 'Approve') {
      return ResultOfAppDebotBrowser_Approve.fromMap(map);
    }
    throw ('ResultOfAppDebotBrowser unknown from map type');
  }
}

///Result of user input.
class ResultOfAppDebotBrowser_Input extends ResultOfAppDebotBrowser {
  String _type;
  String get type => _type;

  ///String entered by user.
  String _value;
  String get value => _value;
  ResultOfAppDebotBrowser_Input({
    @required String value,
  }) {
    _type = 'Input';
    _value = ArgumentError.checkNotNull(
        value, 'ResultOfAppDebotBrowser_Input value');
  }
  ResultOfAppDebotBrowser_Input.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Input') {
      throw ('Wrong map data');
    } else {
      _type = 'Input';
    }
    if (map.containsKey('value') && (map['value'] != null)) {
      _value = map['value'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_value != null) {
      map['value'] = _value;
    }
    map['type'] = _type;
    return map;
  }
}

///Result of getting signing box.
class ResultOfAppDebotBrowser_GetSigningBox extends ResultOfAppDebotBrowser {
  String _type;
  String get type => _type;

  ///Signing box is owned and disposed by debot engine
  int _signing_box;
  int get signing_box => _signing_box;
  ResultOfAppDebotBrowser_GetSigningBox({
    @required int signing_box,
  }) {
    _type = 'GetSigningBox';
    _signing_box = ArgumentError.checkNotNull(
        signing_box, 'ResultOfAppDebotBrowser_GetSigningBox signing_box');
  }
  ResultOfAppDebotBrowser_GetSigningBox.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'GetSigningBox') {
      throw ('Wrong map data');
    } else {
      _type = 'GetSigningBox';
    }
    if (map.containsKey('signing_box') && (map['signing_box'] != null)) {
      _signing_box = map['signing_box'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_signing_box != null) {
      map['signing_box'] = _signing_box;
    }
    map['type'] = _type;
    return map;
  }
}

///Result of debot invoking.
class ResultOfAppDebotBrowser_InvokeDebot extends ResultOfAppDebotBrowser {
  String _type;
  String get type => _type;
  ResultOfAppDebotBrowser_InvokeDebot() {
    _type = 'InvokeDebot';
  }
  ResultOfAppDebotBrowser_InvokeDebot.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'InvokeDebot') {
      throw ('Wrong map data');
    } else {
      _type = 'InvokeDebot';
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['type'] = _type;
    return map;
  }
}

///Result of `approve` callback.
class ResultOfAppDebotBrowser_Approve extends ResultOfAppDebotBrowser {
  String _type;
  String get type => _type;

  ///Indicates whether the DeBot is allowed to perform the specified operation.
  bool _approved;
  bool get approved => _approved;
  ResultOfAppDebotBrowser_Approve({
    @required bool approved,
  }) {
    _type = 'Approve';
    _approved = ArgumentError.checkNotNull(
        approved, 'ResultOfAppDebotBrowser_Approve approved');
  }
  ResultOfAppDebotBrowser_Approve.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('type') || map['type'] != 'Approve') {
      throw ('Wrong map data');
    } else {
      _type = 'Approve';
    }
    if (map.containsKey('approved') && (map['approved'] != null)) {
      _approved = map['approved'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_approved != null) {
      map['approved'] = _approved;
    }
    map['type'] = _type;
    return map;
  }
}

///[UNSTABLE](UNSTABLE.md) Parameters to start DeBot. DeBot must be already initialized with init() function.
class ParamsOfStart extends TonSdkStructure {
  ///Debot handle which references an instance of debot engine.
  int _debot_handle;
  int get debot_handle => _debot_handle;
  ParamsOfStart({
    @required int debot_handle,
  }) {
    _debot_handle =
        ArgumentError.checkNotNull(debot_handle, 'ParamsOfStart debot_handle');
  }
  ParamsOfStart.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('debot_handle') && (map['debot_handle'] != null)) {
      _debot_handle = map['debot_handle'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_debot_handle != null) {
      map['debot_handle'] = _debot_handle;
    }
    return map;
  }
}

///[UNSTABLE](UNSTABLE.md) Parameters to fetch DeBot metadata.
class ParamsOfFetch extends TonSdkStructure {
  ///Debot smart contract address.
  String _address;
  String get address => _address;
  ParamsOfFetch({
    @required String address,
  }) {
    _address = ArgumentError.checkNotNull(address, 'ParamsOfFetch address');
  }
  ParamsOfFetch.fromMap(Map<String, dynamic> map) {
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

///[UNSTABLE](UNSTABLE.md)
class ResultOfFetch extends TonSdkStructure {
  ///Debot metadata.
  DebotInfo _info;
  DebotInfo get info => _info;
  ResultOfFetch({
    @required DebotInfo info,
  }) {
    _info = ArgumentError.checkNotNull(info, 'ResultOfFetch info');
  }
  ResultOfFetch.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('info') && (map['info'] != null)) {
      _info = DebotInfo.fromMap(map['info']);
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

///[UNSTABLE](UNSTABLE.md) Parameters for executing debot action.
class ParamsOfExecute extends TonSdkStructure {
  ///Debot handle which references an instance of debot engine.
  int _debot_handle;
  int get debot_handle => _debot_handle;

  ///Debot Action that must be executed.
  DebotAction _action;
  DebotAction get action => _action;
  ParamsOfExecute({
    @required int debot_handle,
    @required DebotAction action,
  }) {
    _debot_handle = ArgumentError.checkNotNull(
        debot_handle, 'ParamsOfExecute debot_handle');
    _action = ArgumentError.checkNotNull(action, 'ParamsOfExecute action');
  }
  ParamsOfExecute.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('debot_handle') && (map['debot_handle'] != null)) {
      _debot_handle = map['debot_handle'];
    } else {
      throw ('Wrong map data');
    }
    if (map.containsKey('action') && (map['action'] != null)) {
      _action = DebotAction.fromMap(map['action']);
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_debot_handle != null) {
      map['debot_handle'] = _debot_handle;
    }
    if (_action != null) {
      map['action'] = _action;
    }
    return map;
  }
}

///[UNSTABLE](UNSTABLE.md) Parameters of `send` function.
class ParamsOfSend extends TonSdkStructure {
  ///Debot handle which references an instance of debot engine.
  int _debot_handle;
  int get debot_handle => _debot_handle;

  ///BOC of internal message to debot encoded in base64 format.
  String _message;
  String get message => _message;
  ParamsOfSend({
    @required int debot_handle,
    @required String message,
  }) {
    _debot_handle =
        ArgumentError.checkNotNull(debot_handle, 'ParamsOfSend debot_handle');
    _message = ArgumentError.checkNotNull(message, 'ParamsOfSend message');
  }
  ParamsOfSend.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('debot_handle') && (map['debot_handle'] != null)) {
      _debot_handle = map['debot_handle'];
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
    if (_debot_handle != null) {
      map['debot_handle'] = _debot_handle;
    }
    if (_message != null) {
      map['message'] = _message;
    }
    return map;
  }
}

///[UNSTABLE](UNSTABLE.md)
class ParamsOfRemove extends TonSdkStructure {
  ///Debot handle which references an instance of debot engine.
  int _debot_handle;
  int get debot_handle => _debot_handle;
  ParamsOfRemove({
    @required int debot_handle,
  }) {
    _debot_handle =
        ArgumentError.checkNotNull(debot_handle, 'ParamsOfRemove debot_handle');
  }
  ParamsOfRemove.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('debot_handle') && (map['debot_handle'] != null)) {
      _debot_handle = map['debot_handle'];
    } else {
      throw ('Wrong map data');
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_debot_handle != null) {
      map['debot_handle'] = _debot_handle;
    }
    return map;
  }
}
