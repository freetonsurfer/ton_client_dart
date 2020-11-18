import 'package:ton_client_dart/ton_client_dart.dart';
import 'package:test/test.dart';
import 'dart:io';
import 'dart:convert';

part './src/boc_test.dart';
part './src/crypto_test.dart';
part './src/utils_test.dart';
part './src/client_test.dart';
part './src/abi_test.dart';
part './src/processing_net_test.dart';
part './src/tvm_test.dart';

var CLIENT_DEFAULT_SETUP = {
  'network': {
    'server_address': 'http://localhost',
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

  abi_test(client);
  client_test(client);
  boc_test(client);
  crypto_test(client);
  utils_test(client);
  tvm_test(client);
  processing_net_test(client);
}
