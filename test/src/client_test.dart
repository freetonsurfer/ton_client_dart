part of '../test.dart';

client_test(TonClient client) {
  group('client', () {
    test('version', () async {
      var res = await client.version();

      expect(res.version, equals('1.34.3'));
    });

    test('get_api_reference_api', () async {
      var res = await client.get_api_reference();
      expect(res.api['version'], equals('1.34.3'));
    });

    test('build_info', () async {
      var res = await client.build_info();
      expect(res.build_number, equals(0));
    });
  });
}
