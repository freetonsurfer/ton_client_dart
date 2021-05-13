part of '../test.dart';

void debot_test(TonClient client) {
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
