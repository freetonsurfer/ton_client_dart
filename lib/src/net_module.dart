part of 'tonsdkmodule.dart';

class NetModule extends _TonSdkModule {
  NetModule(TonSdkCore core) : super(core);

  /// Queries collection data
  ///
  /// Queries data that satisfies the `filter` conditions,
  /// limits the number of returned records and orders them.
  /// The projection fields are limited to `result` fields
  Future<ResultOfQueryCollection> query_collection(
      ParamsOfQueryCollection params) async {
    final res =
        await _tonCore.request('net.query_collection', params.toString());
    return ResultOfQueryCollection.fromMap(res);
  }

  /// Returns an object that fulfills the conditions or waits for its appearance
  ///
  /// Triggers only once.
  /// If object that satisfies the `filter` conditions
  /// already exists - returns it immediately.
  /// If not - waits for insert/update of data within the specified `timeout`,
  /// and returns it.
  /// The projection fields are limited to `result` fields
  Future<ResultOfWaitForCollection> wait_for_collection(
      ParamsOfWaitForCollection params) async {
    final res =
        await _tonCore.request('net.wait_for_collection', params.toString());
    return ResultOfWaitForCollection.fromMap(res);
  }

  /// Cancels a subscription
  ///
  /// Cancels a subscription specified by its handle.
  Future<void> unsubscribe(ResultOfSubscribeCollection params) async {
    await _tonCore.request('net.unsubscribe', params.toString());
    return;
  }

  /// Creates a subscription
  ///
  /// Triggers for each insert/update of data
  /// that satisfies the `filter` conditions.
  /// The projection fields are limited to `result` fields.
  Future<ResultOfSubscribeCollection> subscribe_collection(
      ParamsOfSubscribeCollection params,
      [Function responseHandler]) async {
    final res = await _tonCore.request(
        'net.subscribe_collection', params.toString(), responseHandler);
    return ResultOfSubscribeCollection.fromMap(res);
  }
}
