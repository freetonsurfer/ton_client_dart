part of '../test.dart';

void tvm_test(TonClient client) {
  group('tvm', () {
    test('run_get', () async {
      final code = await File('./test/files/run_get_code.txt').readAsString();
      final data = await File('./test/files/run_get_data.txt').readAsString();

      final res = await client.abi.encode_account(ParamsOfEncodeAccount(
          state_init: StateInitSource_StateInit(code: code, data: data)));

      final adr = await client.utils.convert_address(ParamsOfConvertAddress(
          address: res.id, output_format: AddressStringFormat_Hex()));
      expect(
          adr.address,
          equals(
              '0:1089829edf8ad38e474ce9e93123b3281e52c3faff0214293cbb5981ee7b3092'));
      var res1 = await client.tvm.run_get(ParamsOfRunGet(
          account: res.account, function_name: 'participant_list'));
      final str = res1.output.toString();
      final exp = await File('./test/files/run_get_result.txt').readAsString();
      expect(str, equals(exp));
    });

    test('run_executor', () async {
      final message =
          'te6ccgEBAQEAXAAAs0gAV2lB0HI8/VEO/pBKDJJJeoOcIh+dL9JzpmRzM8PfdicAPGNEGwRWGaJsR6UYmnsFVC2llSo1ZZN5mgUnCiHf7ZaUBKgXyAAGFFhgAAAB69+UmQS/LjmiQA==';
      final result = await client.tvm.run_executor(ParamsOfRunExecutor(
          message: message,
          account: AccountForExecutor_None(),
          skip_transaction_check: true));

      final parsed =
          await client.boc.parse_account(ParamsOfParse(boc: result.account));
      expect(
          parsed.parsed['id'],
          equals(
              '0:f18d106c11586689b11e946269ec1550b69654a8d5964de668149c28877fb65a'));
      expect(parsed.parsed['acc_type_name'], equals('Uninit'));
    });
  });
}
