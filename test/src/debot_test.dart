part of '../test.dart';

void debot_test(TonClient client) {
  final CLIENT_SETUP = {
    'network': {
      'server_address': 'http://main.ton.dev',
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

  group('debot', () {
    test('fetch', () async {
      final res = await client.debot.fetch(ParamsOfFetch(
          address:
              '0:3a5d8ed122669a293361c3b795c9dcd9ba31f29724ef8efa3cdc32c42de4f643'));

      expect(res.info.name, "Multisig");
      expect(res.info.publisher, "TON Labs");
    });

    test('init and remove', () async {
      final res = await client.debot.init(ParamsOfInit(
          address:
              '0:3a5d8ed122669a293361c3b795c9dcd9ba31f29724ef8efa3cdc32c42de4f643'));

      expect(res.info.name, "Multisig");
      expect(res.info.publisher, "TON Labs");

      await client.debot.remove(ParamsOfRemove(debot_handle: res.debot_handle));
    });
  });
}
