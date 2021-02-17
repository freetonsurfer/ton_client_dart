part of '../test.dart';

void crypto_test(TonClient client) {
  group('crypto', () {
    test('factorize', () async {
      final res = await client.crypto
          .factorize(ParamsOfFactorize(composite: '17ED48941A08F981'));
      expect(res.factors[0], equals('494C553B'));
      expect(res.factors[1], equals('53911073'));
    });

    test('modular_power', () async {
      final res = await client.crypto.modular_power(ParamsOfModularPower(
          base: '0123456789ABCDEF', exponent: '0123', modulus: '01234567'));
      expect(res.modular_power, equals('63bfdf'));
    });

    test('ton_crc16', () async {
      final res =
          await client.crypto.ton_crc16(ParamsOfTonCrc16(data: 'ASNFZ4mrze8='));
      expect(res.crc, equals(43349));
    });

    test('generate_random_bytes', () async {
      final res = await client.crypto
          .generate_random_bytes(ParamsOfGenerateRandomBytes(length: 32));
      expect(res.bytes.length, equals(44));
    });

    test('convert_public_key_to_ton_safe_format', () async {
      final res = await client.crypto.convert_public_key_to_ton_safe_format(
          ParamsOfConvertPublicKeyToTonSafeFormat(
              public_key:
                  '06117f59ade83e097e0fb33e5d29e8735bda82b3bf78a015542aaa853bb69600'));
      expect(res.ton_public_key,
          equals('PuYGEX9Zreg-CX4Psz5dKehzW9qCs794oBVUKqqFO7aWAOTD'));
    });

    test('generate_random_sign_keys', () async {
      final res = await client.crypto.generate_random_sign_keys();
      // print(res.toJsonString());
      expect(res.public.length, equals(64));
      expect(res.secret.length, equals(64));
      expect(res.public, isNot(equals(res.secret)));
    });

    test('sign', () async {
      final res = await client.crypto.sign(ParamsOfSign(
          unsigned: 'VGVzdCBNZXNzYWdl',
          keys: KeyPair(
              public:
                  '1869b7ef29d58026217e9cf163cbfbd0de889bdf1bf4daebf5433a312f5b8d6e',
              secret:
                  '56b6a77093d6fdf14e593f36275d872d75de5b341942376b2a08759f3cbae78f')));
      //print(res);
      expect(
          res.signed,
          equals(
              '+wz+QO6l1slgZS5s65BNqKcu4vz24FCJz4NSAxef9lu0jFfs8x3PzSZRC+pn5k8+aJi3xYMA3BQzglQmjK3hA1Rlc3QgTWVzc2FnZQ=='));
      expect(
          res.signature,
          equals(
              'fb0cfe40eea5d6c960652e6ceb904da8a72ee2fcf6e05089cf835203179ff65bb48c57ecf31dcfcd26510bea67e64f3e6898b7c58300dc14338254268cade103'));
    });

    test('verify_signature', () async {
      final res = await client.crypto.verify_signature(ParamsOfVerifySignature(
          signed:
              '+wz+QO6l1slgZS5s65BNqKcu4vz24FCJz4NSAxef9lu0jFfs8x3PzSZRC+pn5k8+aJi3xYMA3BQzglQmjK3hA1Rlc3QgTWVzc2FnZQ==',
          public:
              '1869b7ef29d58026217e9cf163cbfbd0de889bdf1bf4daebf5433a312f5b8d6e'));
      expect(res.unsigned, equals('VGVzdCBNZXNzYWdl'));
    });

    test('sha256', () async {
      final res = await client.crypto.sha256(ParamsOfHash(
          data: TonClient.str2base64('Message to hash with sha 256')));
      expect(
          res.hash,
          equals(
              '16fd057308dd358d5a9b3ba2de766b2dfd5e308478fc1f7ba5988db2493852f5'));
    });

    test('sha512', () async {
      final res = await client.crypto.sha512(ParamsOfHash(
          data: TonClient.str2base64('Message to hash with sha 512')));
      expect(
          res.hash,
          equals(
              '2616a44e0da827f0244e93c2b0b914223737a6129bc938b8edf2780ac9482960baa9b7c7cdb11457c1cebd5ae77e295ed94577f32d4c963dc35482991442daa5'));
    });

    test('scrypt', () async {
      final res = await client.crypto.scrypt(ParamsOfScrypt(
          password: TonClient.str2base64('Test Password'),
          salt: TonClient.str2base64('Test Salt'),
          log_n: 10,
          r: 8,
          p: 16,
          dk_len: 64));
      expect(
          res.key,
          equals(
              '52e7fcf91356eca55fc5d52f16f5d777e3521f54e3c570c9bbb7df58fc15add73994e5db42be368de7ebed93c9d4f21f9be7cc453358d734b04a057d0ed3626d'));
    });

    test('nacl_sign_keypair_from_secret_key', () async {
      final res = await client.crypto.nacl_sign_keypair_from_secret_key(
          ParamsOfNaclSignKeyPairFromSecret(
              secret:
                  '8fb4f2d256e57138fb310b0a6dac5bbc4bee09eb4821223a720e5b8e1f3dd674'));
      expect(
          res.public,
          equals(
              'aa5533618573860a7e1bf19f34bd292871710ed5b2eafa0dcdbb33405f2231c6'));
      expect(
          res.secret,
          equals(
              '8fb4f2d256e57138fb310b0a6dac5bbc4bee09eb4821223a720e5b8e1f3dd674aa5533618573860a7e1bf19f34bd292871710ed5b2eafa0dcdbb33405f2231c6'));
    });
    test('nacl_sign', () async {
      final res = await client.crypto.nacl_sign(ParamsOfNaclSign(
          unsigned: TonClient.str2base64('Test Message'),
          secret:
              '56b6a77093d6fdf14e593f36275d872d75de5b341942376b2a08759f3cbae78f1869b7ef29d58026217e9cf163cbfbd0de889bdf1bf4daebf5433a312f5b8d6e'));
      expect(
          res.signed,
          equals(
              '+wz+QO6l1slgZS5s65BNqKcu4vz24FCJz4NSAxef9lu0jFfs8x3PzSZRC+pn5k8+aJi3xYMA3BQzglQmjK3hA1Rlc3QgTWVzc2FnZQ=='));
    });

    test('nacl_sign_open', () async {
      final res = await client.crypto.nacl_sign_open(ParamsOfNaclSignOpen(
          signed: TonClient.hex2base64(
              'fb0cfe40eea5d6c960652e6ceb904da8a72ee2fcf6e05089cf835203179ff65bb48c57ecf31dcfcd26510bea67e64f3e6898b7c58300dc14338254268cade10354657374204d657373616765'),
          public:
              '1869b7ef29d58026217e9cf163cbfbd0de889bdf1bf4daebf5433a312f5b8d6e'));
      expect(TonClient.base642str(res.unsigned), equals('Test Message'));
    });

    test('nacl_sign_detached', () async {
      final res = await client.crypto.nacl_sign_detached(ParamsOfNaclSign(
          unsigned: TonClient.str2base64('Test Message'),
          secret:
              '56b6a77093d6fdf14e593f36275d872d75de5b341942376b2a08759f3cbae78f1869b7ef29d58026217e9cf163cbfbd0de889bdf1bf4daebf5433a312f5b8d6e'));
      expect(
          res.signature,
          equals(
              'fb0cfe40eea5d6c960652e6ceb904da8a72ee2fcf6e05089cf835203179ff65bb48c57ecf31dcfcd26510bea67e64f3e6898b7c58300dc14338254268cade103'));
    });

    test('nacl_box_keypair', () async {
      final res = await client.crypto.nacl_box_keypair();
      expect(res.public.length, equals(64));
      expect(res.secret.length, equals(64));
      expect(res.public, isNot(equals(res.secret)));
    });

    test('nacl_box_keypair_from_secret_key', () async {
      final res = await client.crypto.nacl_box_keypair_from_secret_key(
          ParamsOfNaclBoxKeyPairFromSecret(
              secret:
                  'e207b5966fb2c5be1b71ed94ea813202706ab84253bdf4dc55232f82a1caf0d4'));
      expect(
          res.public,
          equals(
              'a53b003d3ffc1e159355cb37332d67fc235a7feb6381e36c803274074dc3933a'));
    });

    test('nacl_box', () async {
      final res = await client.crypto.nacl_box(ParamsOfNaclBox(
          decrypted: TonClient.str2base64('Test Message'),
          nonce: 'cd7f99924bf422544046e83595dd5803f17536f5c9a11746',
          their_public:
              'c4e2d9fe6a6baf8d1812b799856ef2a306291be7a7024837ad33a8530db79c6b',
          secret:
              'd9b9dc5033fb416134e5d2107fdbacab5aadb297cb82dbdcd137d663bac59f7f'));
      expect(res.encrypted, equals('li4XED4kx/pjQ2qdP0eR2d/K30uN94voNADxwA=='));
    });

    test('nacl_box_open', () async {
      final res = await client.crypto.nacl_box_open(ParamsOfNaclBoxOpen(
          encrypted: TonClient.hex2base64(
              '962e17103e24c7fa63436a9d3f4791d9dfcadf4b8df78be83400f1c0'),
          nonce: 'cd7f99924bf422544046e83595dd5803f17536f5c9a11746',
          their_public:
              'c4e2d9fe6a6baf8d1812b799856ef2a306291be7a7024837ad33a8530db79c6b',
          secret:
              'd9b9dc5033fb416134e5d2107fdbacab5aadb297cb82dbdcd137d663bac59f7f'));
      expect(TonClient.base642str(res.decrypted), equals('Test Message'));
    });

    test('nacl_secret_box', () async {
      final res = await client.crypto.nacl_secret_box(ParamsOfNaclSecretBox(
          decrypted: TonClient.str2base64('Test Message'),
          nonce: '2a33564717595ebe53d91a785b9e068aba625c8453a76e45',
          key:
              '8f68445b4e78c000fe4d6b7fc826879c1e63e3118379219a754ae66327764bd8'));
      expect(res.encrypted, equals('JL7ejKWe2KXmrsns41yfXoQF0t/C1Q8RGyzQ2A=='));
    });

    test('nacl_secret_box_open', () async {
      final res = await client.crypto.nacl_secret_box_open(
          ParamsOfNaclSecretBoxOpen(
              encrypted: TonClient.hex2base64(
                  '24bede8ca59ed8a5e6aec9ece35c9f5e8405d2dfc2d50f111b2cd0d8'),
              nonce: '2a33564717595ebe53d91a785b9e068aba625c8453a76e45',
              key:
                  '8f68445b4e78c000fe4d6b7fc826879c1e63e3118379219a754ae66327764bd8'));
      expect(TonClient.base642str(res.decrypted), equals('Test Message'));
    });

    test('mnemonic_words', () async {
      final res = await client.crypto.mnemonic_words(ParamsOfMnemonicWords());
      expect(res.words.split(' ').length, equals(2048));
    });
    test('mnemonic_from_random', () async {
      for (var dictionary = 1; dictionary < 9; dictionary++) {
        for (var word_count in [12, 15, 18, 21, 24]) {
          final res = await client.crypto.mnemonic_from_random(
              ParamsOfMnemonicFromRandom(
                  dictionary: dictionary, word_count: word_count));
          expect(res.phrase.split(' ').length, equals(word_count));
        }
      }
    });

    test('mnemonic_from_entropy', () async {
      final res = await client.crypto.mnemonic_from_entropy(
          ParamsOfMnemonicFromEntropy(
              entropy: '00112233445566778899AABBCCDDEEFF',
              dictionary: 1,
              word_count: 12));
      expect(
          res.phrase,
          equals(
              'abandon math mimic master filter design carbon crystal rookie group knife young'));
    });

    test('mnemonic_verify', () async {
      for (var dictionary = 0; dictionary < 9; dictionary++) {
        for (var word_count in [12, 15, 18, 21, 24]) {
          final res = await client.crypto.mnemonic_from_random(
              ParamsOfMnemonicFromRandom(
                  dictionary: dictionary, word_count: word_count));
          final res1 = await client.crypto.mnemonic_verify(
              ParamsOfMnemonicVerify(
                  phrase: res.phrase,
                  dictionary: dictionary,
                  word_count: word_count));
          expect(res1.valid, equals(true));
        }
      }
    });
    test('mnemonic_verify-1', () async {
      final res = await client.crypto
          .mnemonic_verify(ParamsOfMnemonicVerify(phrase: 'one two'));
      expect(res.valid, equals(false));
    });

    test('mnemonic_derive_sign_keys', () async {
      final keys = await client.crypto.mnemonic_derive_sign_keys(
          ParamsOfMnemonicDeriveSignKeys(
              phrase:
                  'abandon math mimic master filter design carbon crystal rookie group knife young'));
      final res = await client.crypto.convert_public_key_to_ton_safe_format(
          ParamsOfConvertPublicKeyToTonSafeFormat(public_key: keys.public));
      expect(res.ton_public_key,
          equals('PuZhw8W5ejPJwKA68RL7sn4_RNmeH4BIU_mEK7em5d4_-cIx'));
    });

    test('hdkey_xprv_from_mnemonic', () async {
      final res = await client.crypto.hdkey_xprv_from_mnemonic(
          ParamsOfHDKeyXPrvFromMnemonic(
              phrase:
                  'abuse boss fly battle rubber wasp afraid hamster guide essence vibrant tattoo'));

      expect(
          res.xprv,
          equals(
              'xprv9s21ZrQH143K25JhKqEwvJW7QAiVvkmi4WRenBZanA6kxHKtKAQQKwZG65kCyW5jWJ8NY9e3GkRoistUjjcpHNsGBUv94istDPXvqGNuWpC'));
    });

    test('hdkey_secret_from_xprv', () async {
      final res = await client.crypto.hdkey_secret_from_xprv(
          ParamsOfHDKeySecretFromXPrv(
              xprv:
                  'xprv9s21ZrQH143K25JhKqEwvJW7QAiVvkmi4WRenBZanA6kxHKtKAQQKwZG65kCyW5jWJ8NY9e3GkRoistUjjcpHNsGBUv94istDPXvqGNuWpC'));

      expect(
          res.secret,
          equals(
              '0c91e53128fa4d67589d63a6c44049c1068ec28a63069a55ca3de30c57f8b365'));
    });

    test('hdkey_public_from_xprv', () async {
      final res = await client.crypto.hdkey_public_from_xprv(
          ParamsOfHDKeyPublicFromXPrv(
              xprv:
                  'xprv9s21ZrQH143K25JhKqEwvJW7QAiVvkmi4WRenBZanA6kxHKtKAQQKwZG65kCyW5jWJ8NY9e3GkRoistUjjcpHNsGBUv94istDPXvqGNuWpC'));

      expect(
          res.public,
          equals(
              '7b70008d0c40992283d488b1046739cf827afeabf647a5f07c4ad1e7e45a6f89'));
      //'02a8eb63085f73c33fa31b4d1134259406347284f8dab6fc68f4bf8c96f6c39b75'));
    });

    test('hdkey_derive_from_xprv', () async {
      final res = await client.crypto.hdkey_derive_from_xprv(
          ParamsOfHDKeyDeriveFromXPrv(
              xprv:
                  'xprv9s21ZrQH143K25JhKqEwvJW7QAiVvkmi4WRenBZanA6kxHKtKAQQKwZG65kCyW5jWJ8NY9e3GkRoistUjjcpHNsGBUv94istDPXvqGNuWpC',
              child_index: 0,
              hardened: false));

      expect(
          res.xprv,
          equals(
              'xprv9uZwtSeoKf1swgAkVVCEUmC2at6t7MCJoHnBbn1MWJZyxQ4cySkVXPyNh7zjf9VjsP4vEHDDD2a6R35cHubg4WpzXRzniYiy8aJh1gNnBKv'));
    });

    test('hdkey_derive_from_xprv_path', () async {
      final res = await client.crypto.hdkey_derive_from_xprv_path(
          ParamsOfHDKeyDeriveFromXPrvPath(
              xprv:
                  'xprv9s21ZrQH143K25JhKqEwvJW7QAiVvkmi4WRenBZanA6kxHKtKAQQKwZG65kCyW5jWJ8NY9e3GkRoistUjjcpHNsGBUv94istDPXvqGNuWpC',
              path: "m/44'/60'/0'/0'"));

      expect(
          res.xprv,
          equals(
              'xprvA1KNMo63UcGjmDF1bX39Cw2BXGUwrwMjeD5qvQ3tA3qS3mZQkGtpf4DHq8FDLKAvAjXsYGLHDP2dVzLu9ycta8PXLuSYib2T3vzLf3brVgZ'));
    });

    test('chacha20 encode', () async {
      final res = await client.crypto.chacha20(ParamsOfChaCha20(
          data: TonClient.str2base64('Message'),
          key:
              '0101010101010101010101010101010101010101010101010101010101010101',
          nonce: 'ffffffffffffffffffffffff'));

      expect(res.data, equals('w5QOGsJodQ=='));
    });
    test('chacha20 decode', () async {
      final res = await client.crypto.chacha20(ParamsOfChaCha20(
          data: 'w5QOGsJodQ==',
          key:
              '0101010101010101010101010101010101010101010101010101010101010101',
          nonce: 'ffffffffffffffffffffffff'));

      expect(TonClient.base642str(res.data), equals('Message'));
    });
////////////////////////////////////////////////////////////////////////////////
  });
}
