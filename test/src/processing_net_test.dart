part of '../test.dart';

void processing_net_test(TonClient client) {
  group('processing&net', () {
    test('deploy local contract', () async {
      //You should tun this test only on NodrSE
      //Dont do any other transactions
      var subscription = await client.net.subscribe_collection(
          ParamsOfSubscribeCollection(
            collection: 'transactions',
            result: 'id',
            /*filter: {
            'id': {'eq': enmsg.address}
          }*/
          ), (Map<String, dynamic> json) {
        File('test/files/test_subscription.txt')
            .writeAsString(jsonEncode(json) + '\n', mode: FileMode.append);
      });

      final keys = await client.crypto.generate_random_sign_keys();
      final abijson =
          await TonClient.loadAbiFromFile('test/files/events.abi.json');
      //await File('test/files/events.abi.json').readAsString();
      final tvcencoded = await File('test/files/events.tvc').readAsBytes();
      var tvc = base64.encode(tvcencoded);

      final enmsg = await client.abi.encode_message(ParamsOfEncodeMessage(
          abi: Abi_Json(value: abijson),
          signer: Signer_Keys(keys: keys),
          deploy_set: DeploySet(tvc: tvc),
          call_set: CallSet(
              function_name: 'constructor',
              header: FunctionHeader(pubkey: keys.public))));
      // get_grams_from_giver_local

      var query = await client.net.query_collection(ParamsOfQueryCollection(
          collection: 'accounts',
          result: 'id code',
          filter: {
            'id': {'eq': enmsg.address}
          }));
      expect(query.result, equals([]));

      // address of giver on NodeSE
      final giverAddress =
          '0:841288ed3b55d9cdafa806807f02a0ae0c169aa5edfe88a789a6482429756a94';
      // giver ABI on NodeSE
      final giverAbi = {
        'ABI version': 1,
        'functions': [
          {
            'name': 'constructor',
            'inputs': [],
            'outputs': [],
          },
          {
            'name': 'sendGrams',
            'inputs': [
              {'name': 'dest', 'type': 'address'},
              {'name': 'amount', 'type': 'uint64'},
            ],
            'outputs': [],
          },
        ],
        'events': [],
        'data': [],
      };

      final input_giver = {
        'dest': enmsg.address,
        'amount': 1000000000000,
      };
      final emParamGiver = ParamsOfEncodeMessage(
          abi: Abi_Serialized(value: AbiContract.fromMap(giverAbi)),
          signer: Signer_Keys(keys: keys),
          address: giverAddress,
          call_set: CallSet(function_name: 'sendGrams', input: input_giver));
      await File('test/files/test_process_message.txt').writeAsString('');
      final res_giver = await client.processing.process_message(
          ParamsOfProcessMessage(
              message_encode_params: emParamGiver,
              send_events: true), (Map<String, dynamic> json) {
        File('test/files/test_process_message.txt')
            .writeAsString(jsonEncode(json) + '\n', mode: FileMode.append);
      });

      //unsubscribe collection
      await client.net.unsubscribe(subscription);

      query = await client.net.query_collection(ParamsOfQueryCollection(
          collection: 'accounts',
          result: 'id code',
          filter: {
            'id': {'eq': enmsg.address}
          }));
      expect(query.result[0]['id'], equals(enmsg.address));
      expect(query.result[0]['code'], equals(null));

      await File('test/files/test_send_message.txt').writeAsString('');
      final sendmsg = await client.processing.send_message(
          ParamsOfSendMessage(message: enmsg.message, send_events: true),
          (Map<String, dynamic> json) {
        File('test/files/test_send_message.txt')
            .writeAsString(jsonEncode(json) + '\n', mode: FileMode.append);
      });

      // print(sendmsg);
      await File('test/files/test_wait_for_transaction.txt').writeAsString('');
      final output = await client.processing.wait_for_transaction(
          ParamsOfWaitForTransaction(
              message: enmsg.message,
              shard_block_id: sendmsg.shard_block_id,
              send_events: true), (Map<String, dynamic> json) {
        File('test/files/test_wait_for_transaction.txt')
            .writeAsString(jsonEncode(json) + '\n', mode: FileMode.append);
      });

      query = await client.net.query_collection(ParamsOfQueryCollection(
          collection: 'accounts',
          result: 'id code',
          filter: {
            'id': {'eq': enmsg.address}
          }));
      expect(query.result[0]['code'], isNot(equals(null)));
    });
  });
}
