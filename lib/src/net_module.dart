part of 'tonsdkmodule.dart';

class NetModule extends _TonSdkModule {
  NetModule(TonSdkCore core) : super(core);

  ///Performs DAppServer GraphQL query.
  Future<ResultOfQuery> query(ParamsOfQuery params) async {
    final res = await _tonCore.request('net.query', params.toString());
    return ResultOfQuery.fromMap(res);
  }

  ///Performs multiple queries per single fetch.
  Future<ResultOfBatchQuery> batch_query(ParamsOfBatchQuery params) async {
    final res = await _tonCore.request('net.batch_query', params.toString());
    return ResultOfBatchQuery.fromMap(res);
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

  ///Aggregates values from the specified `fields` for records
  ///that satisfies the `filter` conditions,
  Future<ResultOfAggregateCollection> aggregate_collection(
      ParamsOfAggregateCollection params) async {
    final res =
        await _tonCore.request('net.aggregate_collection', params.toString());
    return ResultOfAggregateCollection.fromMap(res);
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
  }

  ///Triggers for each insert/update of data that satisfies
  ///the `filter` conditions.
  ///The projection fields are limited to `result` fields.
  ///
  ///The subscription is a persistent communication channel between
  ///client and Free TON Network.
  ///All changes in the blockchain will be reflected in realtime.
  ///Changes means inserts and updates of the blockchain entities.
  ///
  ///### Important Notes on Subscriptions
  ///
  ///Unfortunately sometimes the connection with the network brakes down.
  ///In this situation the library attempts to reconnect to the network.
  ///This reconnection sequence can take significant time.
  ///All of this time the client is disconnected from the network.
  ///
  ///Bad news is that all blockchain changes that happened while
  ///the client was disconnected are lost.
  ///
  ///Good news is that the client report errors to the callback when
  ///it loses and resumes connection.
  ///
  ///So, if the lost changes are important to the application then
  ///the application must handle these error reports.
  ///
  ///Library reports errors with `responseType` == 101
  ///and the error object passed via `params`.
  ///
  ///When the library has successfully reconnected
  ///the application receives callback with
  ///`responseType` == 101 and `params.code` == 614 (NetworkModuleResumed).
  ///
  ///Application can use several ways to handle this situation:
  ///- If application monitors changes for the single blockchain
  ///object (for example specific account):  application
  ///can perform a query for this object and handle actual data as a
  ///regular data from the subscription.
  ///- If application monitors sequence of some blockchain objects
  ///(for example transactions of the specific account): application must
  ///refresh all cached (or visible to user) lists where this sequences presents.
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
  }

  ///Resumes network module to enable network activity
  Future<void> resume() async {
    await _tonCore.request('net.resume');
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
  }

  ///Requests the list of alternative endpoints from server
  Future<ResultOfGetEndpoints> get_endpoints() async {
    final res = await _tonCore.request('net.get_endpoints');
    return ResultOfGetEndpoints.fromMap(res);
  }

  ///*Attention* this query retrieves data from 'Counterparties' service which is not supported in
  ///the opensource version of DApp Server (and will not be supported) as well as in TON OS SE (will be supported in SE in future),
  ///but is always accessible via [TON OS Devnet/Mainnet Clouds](https://docs.ton.dev/86757ecb2/p/85c869-networks)
  Future<ResultOfQueryCollection> query_counterparties(
      ParamsOfQueryCounterparties params) async {
    final res =
        await _tonCore.request('net.query_counterparties', params.toString());
    return ResultOfQueryCollection.fromMap(res);
  }

  ///Performs recursive retrieval of the transactions tree produced by the specific message:
  ///in_msg -> dst_transaction -> out_messages -> dst_transaction -> ...
  ///
  ///All retrieved messages and transactions will be included
  ///into `result.messages` and `result.transactions` respectively.
  ///
  ///The retrieval process will stop when the retrieved transaction count is more than 50.
  ///
  ///It is guaranteed that each message in `result.messages` has the corresponding transaction
  ///in the `result.transactions`.
  ///
  ///But there are no guaranties that all messages from transactions `out_msgs` are
  ///presented in `result.messages`.
  ///So the application have to continue retrieval for missing messages if it requires.
  Future<ResultOfQueryTransactionTree> query_transaction_tree(
      ParamsOfQueryTransactionTree params) async {
    final res =
        await _tonCore.request('net.query_transaction_tree', params.toString());
    return ResultOfQueryTransactionTree.fromMap(res);
  }
}
