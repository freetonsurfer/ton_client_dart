part of 'tonsdkmodule.dart';

class NetModule extends _TonSdkModule {
  NetModule(TonSdkCore core) : super(core);

  ///Performs DAppServer GraphQL query.
  Future<ResultOfQuery> query(ParamsOfQuery params) async {
    final res = await _tonCore.request('net.query', params.toString());
    return ResultOfQuery.fromMap(res);
  }

  ///Queries data that satisfies the `filter` conditions,
  ///limits the number of returned records and orders them.
  ///The projection fields are limited to `result` fields
  Future<ResultOfQueryCollection> query_collection(
      ParamsOfQueryCollection params) async {
    final res =
        await _tonCore.request('net.query_collection', params.toString());
    return ResultOfQueryCollection.fromMap(res);
  }

  ///Triggers only once.
  ///If object that satisfies the `filter` conditions
  ///already exists - returns it immediately.
  ///If not - waits for insert/update of data within the specified `timeout`,
  ///and returns it.
  ///The projection fields are limited to `result` fields
  Future<ResultOfWaitForCollection> wait_for_collection(
      ParamsOfWaitForCollection params) async {
    final res =
        await _tonCore.request('net.wait_for_collection', params.toString());
    return ResultOfWaitForCollection.fromMap(res);
  }

  ///Cancels a subscription specified by its handle.
  Future<void> unsubscribe(ResultOfSubscribeCollection params) async {
    await _tonCore.request('net.unsubscribe', params.toString());
    return;
  }

  ///Triggers for each insert/update of data
  ///that satisfies the `filter` conditions.
  ///The projection fields are limited to `result` fields.
  Future<ResultOfSubscribeCollection> subscribe_collection(
      ParamsOfSubscribeCollection params,
      [Function responseHandler]) async {
    final res = await _tonCore.request(
        'net.subscribe_collection', params.toString(), responseHandler);
    return ResultOfSubscribeCollection.fromMap(res);
  }

  ///Suspends network module to stop any network activity
  Future<void> suspend() async {
    await _tonCore.request('net.suspend');
    return;
  }

  ///Resumes network module to enable network activity
  Future<void> resume() async {
    await _tonCore.request('net.resume');
    return;
  }

  ///Returns ID of the last block in a specified account shard
  Future<ResultOfFindLastShardBlock> find_last_shard_block(
      ParamsOfFindLastShardBlock params) async {
    final res =
        await _tonCore.request('net.find_last_shard_block', params.toString());
    return ResultOfFindLastShardBlock.fromMap(res);
  }

  ///Requests the list of alternative endpoints from server
  Future<EndpointsSet> fetch_endpoints() async {
    final res = await _tonCore.request('net.fetch_endpoints');
    return EndpointsSet.fromMap(res);
  }

  ///Sets the list of endpoints to use on reinit
  Future<void> set_endpoints(EndpointsSet params) async {
    await _tonCore.request('net.set_endpoints', params.toString());
    return;
  }
}
