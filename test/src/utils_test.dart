part of '../test.dart';

void utils_test(TonClient client) {
  group('utils', () {
    final account_id =
        'fcb91a3a3816d0f7b8c2c76108b8a9bc5a6b7a55bd79f8ab101c52db29232260';
    final hex_ =
        '-1:fcb91a3a3816d0f7b8c2c76108b8a9bc5a6b7a55bd79f8ab101c52db29232260';
    final hex_workchain0 =
        '0:fcb91a3a3816d0f7b8c2c76108b8a9bc5a6b7a55bd79f8ab101c52db29232260';
    final base64 = 'Uf/8uRo6OBbQ97jCx2EIuKm8Wmt6Vb15+KsQHFLbKSMiYG+9';
    final base64url = 'kf_8uRo6OBbQ97jCx2EIuKm8Wmt6Vb15-KsQHFLbKSMiYIny';

    test('convert_address', () async {
      var adrHex = await client.utils.convert_address(ParamsOfConvertAddress(
          address: account_id, output_format: AddressStringFormat_Hex()));

      expect(adrHex.address, equals(hex_workchain0));
    });

    test('convert_address1', () async {
      var adr = await client.utils.convert_address(ParamsOfConvertAddress(
          address: base64,
          output_format:
              AddressStringFormat_Base64(url: true, test: true, bounce: true)));
      expect(adr.address, equals(base64url));
    });
  });
}
