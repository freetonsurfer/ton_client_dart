part of 'tonsdkmodule.dart';

class BocModule extends _TonSdkModule {
  BocModule(TonSdkCore core) : super(core);

  ///JSON structure is compatible with GraphQL API message object
  Future<ResultOfParse> parse_message(ParamsOfParse params) async {
    final res = await _tonCore.request('boc.parse_message', params.toString());
    return ResultOfParse.fromMap(res);
  }

  ///JSON structure is compatible with GraphQL API transaction object
  Future<ResultOfParse> parse_transaction(ParamsOfParse params) async {
    final res =
        await _tonCore.request('boc.parse_transaction', params.toString());
    return ResultOfParse.fromMap(res);
  }

  ///JSON structure is compatible with GraphQL API account object
  Future<ResultOfParse> parse_account(ParamsOfParse params) async {
    final res = await _tonCore.request('boc.parse_account', params.toString());
    return ResultOfParse.fromMap(res);
  }

  ///JSON structure is compatible with GraphQL API block object
  Future<ResultOfParse> parse_block(ParamsOfParse params) async {
    final res = await _tonCore.request('boc.parse_block', params.toString());
    return ResultOfParse.fromMap(res);
  }

  ///JSON structure is compatible with GraphQL API shardstate object
  Future<ResultOfParse> parse_shardstate(ParamsOfParseShardstate params) async {
    final res =
        await _tonCore.request('boc.parse_shardstate', params.toString());
    return ResultOfParse.fromMap(res);
  }

  ///Extract blockchain configuration from key block and also from zerostate.
  Future<ResultOfGetBlockchainConfig> get_blockchain_config(
      ParamsOfGetBlockchainConfig params) async {
    final res =
        await _tonCore.request('boc.get_blockchain_config', params.toString());
    return ResultOfGetBlockchainConfig.fromMap(res);
  }

  ///Calculates BOC root hash
  Future<ResultOfGetBocHash> get_boc_hash(ParamsOfGetBocHash params) async {
    final res = await _tonCore.request('boc.get_boc_hash', params.toString());
    return ResultOfGetBocHash.fromMap(res);
  }

  ///Extracts code from TVC contract image
  Future<ResultOfGetCodeFromTvc> get_code_from_tvc(
      ParamsOfGetCodeFromTvc params) async {
    final res =
        await _tonCore.request('boc.get_code_from_tvc', params.toString());
    return ResultOfGetCodeFromTvc.fromMap(res);
  }

  ///Get BOC from cache
  Future<ResultOfBocCacheGet> cache_get(ParamsOfBocCacheGet params) async {
    final res = await _tonCore.request('boc.cache_get', params.toString());
    return ResultOfBocCacheGet.fromMap(res);
  }

  ///Save BOC into cache
  Future<ResultOfBocCacheSet> cache_set(ParamsOfBocCacheSet params) async {
    final res = await _tonCore.request('boc.cache_set', params.toString());
    return ResultOfBocCacheSet.fromMap(res);
  }

  ///BOCs which don't have another pins will be removed from cache
  Future<void> cache_unpin(ParamsOfBocCacheUnpin params) async {
    await _tonCore.request('boc.cache_unpin', params.toString());
    return;
  }

  ///Encodes BOC from builder operations.
  Future<ResultOfEncodeBoc> encode_boc(ParamsOfEncodeBoc params) async {
    final res = await _tonCore.request('boc.encode_boc', params.toString());
    return ResultOfEncodeBoc.fromMap(res);
  }
}
