part of 'tonsdkmodule.dart';

class ProcessingModule extends _TonSdkModule {
  ProcessingModule(TonSdkCore core) : super(core);

  ///Sends message to the network and returns the last generated shard block of the destination account
  ///before the message was sent. It will be required later for message processing.
  Future<ResultOfSendMessage> send_message(ParamsOfSendMessage params,
      [Function responseHandler]) async {
    final res = await _tonCore.request(
        'processing.send_message', params.toString(), responseHandler);
    return ResultOfSendMessage.fromMap(res);
  }

  ///`send_events` enables intermediate events, such as `WillFetchNextBlock`,
  ///`FetchNextBlockFailed` that may be useful for logging of new shard blocks creation
  ///during message processing.
  ///
  ///Note, that presence of the `abi` parameter is critical for ABI
  ///compliant contracts. Message processing uses drastically
  ///different strategy for processing message for contracts which
  ///ABI includes "expire" header.
  ///
  ///When the ABI header `expire` is present, the processing uses
  ///`message expiration` strategy:
  ///- The maximum block gen time is set to
  ///  `message_expiration_timeout + transaction_wait_timeout`.
  ///- When maximum block gen time is reached, the processing will
  ///  be finished with `MessageExpired` error.
  ///
  ///When the ABI header `expire` isn't present or `abi` parameter
  ///isn't specified, the processing uses `transaction waiting`
  ///strategy:
  ///- The maximum block gen time is set to
  ///  `now() + transaction_wait_timeout`.
  ///
  ///- If maximum block gen time is reached and no result transaction is found,
  ///the processing will exit with an error.
  Future<ResultOfProcessMessage> wait_for_transaction(
      ParamsOfWaitForTransaction params,
      [Function responseHandler]) async {
    final res = await _tonCore.request(
        'processing.wait_for_transaction', params.toString(), responseHandler);
    return ResultOfProcessMessage.fromMap(res);
  }

  ///Creates ABI-compatible message,
  ///sends it to the network and monitors for the result transaction.
  ///Decodes the output messages' bodies.
  ///
  ///If contract's ABI includes "expire" header, then
  ///SDK implements retries in case of unsuccessful message delivery within the expiration
  ///timeout: SDK recreates the message, sends it and processes it again.
  ///
  ///The intermediate events, such as `WillFetchFirstBlock`, `WillSend`, `DidSend`,
  ///`WillFetchNextBlock`, etc - are switched on/off by `send_events` flag
  ///and logged into the supplied callback function.
  ///
  ///The retry configuration parameters are defined in the client's `NetworkConfig` and `AbiConfig`.
  ///
  ///If contract's ABI does not include "expire" header
  ///then, if no transaction is found within the network timeout (see config parameter ), exits with error.
  Future<ResultOfProcessMessage> process_message(ParamsOfProcessMessage params,
      [Function responseHandler]) async {
    final res = await _tonCore.request(
        'processing.process_message', params.toString(), responseHandler);
    return ResultOfProcessMessage.fromMap(res);
  }
}
