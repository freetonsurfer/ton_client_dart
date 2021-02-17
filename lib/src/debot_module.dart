part of 'tonsdkmodule.dart';

class DebotModule extends _TonSdkModule {
  DebotModule(TonSdkCore core) : super(core);

  ///Downloads debot smart contract from blockchain and switches it to
  ///context zero.
  ///Returns a debot handle which can be used later in `execute` function.
  ///This function must be used by Debot Browser to start a dialog with debot.
  ///While the function is executing, several Browser Callbacks can be called,
  ///since the debot tries to display all actions from the context 0 to the user.
  ///
  ///# Remarks
  ///`start` is equivalent to `fetch` + switch to context 0.
  Future<RegisteredDebot> start(ParamsOfStart params,
      [Function responseHandler]) async {
    final res = await _tonCore.request(
        'debot.start', params.toString(), responseHandler);
    return RegisteredDebot.fromMap(res);
  }

  ///Downloads debot smart contract (code and data) from blockchain and creates
  ///an instance of Debot Engine for it.
  ///
  ///# Remarks
  ///It does not switch debot to context 0. Browser Callbacks are not called.
  Future<RegisteredDebot> fetch(ParamsOfFetch params,
      [Function responseHandler]) async {
    final res = await _tonCore.request(
        'debot.fetch', params.toString(), responseHandler);
    return RegisteredDebot.fromMap(res);
  }

  ///Calls debot engine referenced by debot handle to execute input action.
  ///Calls Debot Browser Callbacks if needed.
  ///
  ///# Remarks
  ///Chain of actions can be executed if input action generates a list of subactions.
  Future<void> execute(ParamsOfExecute params) async {
    await _tonCore.request('debot.execute', params.toString());
    return;
  }

  ///Used by Debot Browser to send response on Dinterface call or from other Debots.
  Future<void> send(ParamsOfSend params) async {
    await _tonCore.request('debot.send', params.toString());
    return;
  }

  ///Removes handle from Client Context and drops debot engine referenced by that handle.
  Future<void> remove(RegisteredDebot params) async {
    await _tonCore.request('debot.remove', params.toString());
    return;
  }
}
