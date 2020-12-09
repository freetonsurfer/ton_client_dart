part of 'tonsdktypes.dart';

///[UNSTABLE](UNSTABLE.md) Handle of registered in SDK debot
//typedef DebotHandle int;
///[UNSTABLE](UNSTABLE.md) Describes a debot action in a Debot Context.
class DebotAction extends TonSdkStructure {
  ///Should be used by Debot Browser as name ofmenu item.
  String _description;
  String get description => _description;

  ///Can be a debot function name or a print string(for Print Action).
  String _name;
  String get name => _name;

  ///Action type.
  int _action_type;
  int get action_type => _action_type;

  ///ID of debot context to switch after action execution.
  int _to;
  int get to => _to;

  ///In the form of "param=value,flag".attribute example: instant, args, fargs, sign.
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

///[UNSTABLE](UNSTABLE.md) Parameters to start debot.
class ParamsOfStart extends TonSdkStructure {
  ///Debot smart contract address
  String _address;
  String get address => _address;
  ParamsOfStart({
    @required String address,
  }) {
    _address = ArgumentError.checkNotNull(address, 'ParamsOfStart address');
  }
  ParamsOfStart.fromMap(Map<String, dynamic> map) {
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

///[UNSTABLE](UNSTABLE.md) Structure for storing debot handle returned from `start` and `fetch` functions.
class RegisteredDebot extends TonSdkStructure {
  ///Debot handle which references an instance of debot engine.
  int _debot_handle;
  int get debot_handle => _debot_handle;
  RegisteredDebot({
    @required int debot_handle,
  }) {
    _debot_handle = ArgumentError.checkNotNull(
        debot_handle, 'RegisteredDebot debot_handle');
  }
  RegisteredDebot.fromMap(Map<String, dynamic> map) {
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

///Called by debot engine to communicate with debot browser.
abstract class ParamsOfAppDebotBrowser extends TonSdkStructure {
  static ParamsOfAppDebotBrowser fromMap(Map<String, dynamic> map) {
    if (map['type'] == 'Log') {
      return ParamsOfAppDebotBrowser_Log.fromMap(map);
    }
    if (map['type'] == 'Switch') {
      return ParamsOfAppDebotBrowser_Switch.fromMap(map);
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

///[UNSTABLE](UNSTABLE.md) Parameters to fetch debot.
class ParamsOfFetch extends TonSdkStructure {
  ///Debot smart contract address
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
