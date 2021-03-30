import 'package:ton_client_dart/ton_client_dart.dart';
import 'package:test/test.dart';

var CLIENT_DEFAULT_SETUP = {
  'network': {
    'server_address': 'https://main.ton.dev',
    'message_retries_count': 5,
    'message_processing_timeout': 40000,
    'wait_for_timeout': 40000,
    'out_of_sync_threshold': 15000,
    'access_key': ''
  },
  'crypto': {'fish_param': ''},
  'abi': {
    'message_expiration_timeout': 40000,
    'message_expiration_timeout_grow_factor': 1.5
  }
};

void main() async {
  var client = TonClient();
  setUp(() async {
    try {
      await client.connect(CLIENT_DEFAULT_SETUP);
    } catch (e) {
      print('$e');
    }
  });

  tearDown(() async {
    await client.disconnect();
  });

  group('fast test', () {
    test('version', () async {
      final res = await client.version();
      expect(res.version, equals('1.11.1'));
    });

    /*test('query', () async {
      final query = await client.net.query_collection(ParamsOfQueryCollection(
          collection: 'accounts',
          result: 'id code_hash',
          filter: {
            'id': {
              'eq':
                  '0:10c7933a5bd18331b706a66f6a9a89c1747a591043330015332d88b27d7cbe73'
            }
          }));
      expect(
          query.result[0]['id'],
          equals(
              '0:10c7933a5bd18331b706a66f6a9a89c1747a591043330015332d88b27d7cbe73'));
      expect(
          query.result[0]['code_hash'],
          equals(
              '207dc560c5956de1a2c1479356f8f3ee70a59767db2bf4788b1d61ad42cdad82'));
    });*/
  });
}
