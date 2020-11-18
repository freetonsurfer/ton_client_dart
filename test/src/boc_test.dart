part of '../test.dart';

boc_test(TonClient client) {
  group('boc', () {
    test('parse_message', () async {
      var boc =
          'te6ccgEBAQEAWAAAq2n+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAE/zMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzSsG8DgAAAAAjuOu9NAL7BxYpA';
      var res = await client.boc.parse_message(ParamsOfParse(boc: boc));

      expect(
          res.parsed['id'],
          equals(
              'dfd47194f3058ee058bfbfad3ea40cbbd9ad17ca77cd0904d4d9f18a48c2fbca'));
      expect(
          res.parsed['src'],
          equals(
              '-1:0000000000000000000000000000000000000000000000000000000000000000'));
      expect(
          res.parsed['dst'],
          equals(
              '-1:3333333333333333333333333333333333333333333333333333333333333333'));
    });

    test('parse_transaction', () async {
      var boc =
          'te6ccgECBwEAAZQAA7V75gA6WK5sEDTiHFGnH9ILOy2irjKLWTkWQMyMogsg40AAACDribjoE3gOAbYNpCaX4uLeXPQHt2Kw/Jp2OKkR2s+BASyeQM6wAAAg64IXyBX2DobAABRrMENIBQQBAhUEQojmJaAYazBCEQMCAFvAAAAAAAAAAAAAAAABLUUtpEnlC4z33SeGHxRhIq/htUa7i3D8ghbwxhQTn44EAJxC3UicQAAAAAAAAAAAdwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgnJAnYEvIQY6SnQKc3lXk6x1Z/lyplGFRbwAuNtVBi9EeceU3Ojl0F3EkRdylowY5x2qlgHNv4lNZUjhq0WqrLMNAQGgBgC3aADLL4ChL2HyLHwOLub5Mep87W3xdnMW8BpxKyVoGe3RPQAvmADpYrmwQNOIcUacf0gs7LaKuMotZORZAzIyiCyDjQ5iWgAGFFhgAAAEHXC9CwS+wdDGKTmMFkA=';
      var res = await client.boc.parse_transaction(ParamsOfParse(boc: boc));

      expect(
          res.parsed['id'],
          equals(
              'd6315dbb2a741a2765da250bea4a186adf942469369c703c57c2050e2d6e9fe3'));
      expect(res.parsed['lt'], equals('0x20eb89b8e81'));
      expect(res.parsed['now'], equals(1600186476));
    });

    test('parse_account', () async {
      var boc =
          'te6ccgECHQEAA/wAAnfAArtKDoOR5+qId/SCUGSSS9Qc4RD86X6TnTMjmZ4e+7EyOobmQvsHNngAAAg6t/34DgJWKJuuOehjU0ADAQFBlcBqp0PR+QAN1kt1SY8QavS350RCNNfeZ+ommI9hgd/gAgBToB6t2E3E7a7aW2YkvXv2hTmSWVRTvSYmCVdH4HjgZ4Z94AAAAAvsHNwwAib/APSkICLAAZL0oOGK7VNYMPShBgQBCvSkIPShBQAAAgEgCgcBAv8IAf5/Ie1E0CDXScIBn9P/0wD0Bfhqf/hh+Gb4Yo4b9AVt+GpwAYBA9A7yvdcL//hicPhjcPhmf/hh4tMAAY4SgQIA1xgg+QFY+EIg+GX5EPKo3iP4RSBukjBw3vhCuvLgZSHTP9MfNCD4I7zyuSL5ACD4SoEBAPQOIJEx3vLQZvgACQA2IPhKI8jLP1mBAQD0Q/hqXwTTHwHwAfhHbvJ8AgEgEQsCAVgPDAEJuOiY/FANAdb4QW6OEu1E0NP/0wD0Bfhqf/hh+Gb4Yt7RcG1vAvhKgQEA9IaVAdcLP3+TcHBw4pEgjjJfM8gizwv/Ic8LPzExAW8iIaQDWYAg9ENvAjQi+EqBAQD0fJUB1ws/f5NwcHDiAjUzMehfAyHA/w4AmI4uI9DTAfpAMDHIz4cgzo0EAAAAAAAAAAAAAAAAD3RMfijPFiFvIgLLH/QAyXH7AN4wwP+OEvhCyMv/+EbPCwD4SgH0AMntVN5/+GcBCbkWq+fwEAC2+EFujjbtRNAg10nCAZ/T/9MA9AX4an/4Yfhm+GKOG/QFbfhqcAGAQPQO8r3XC//4YnD4Y3D4Zn/4YeLe+Ebyc3H4ZtH4APhCyMv/+EbPCwD4SgH0AMntVH/4ZwIBIBUSAQm7Fe+TWBMBtvhBbo4S7UTQ0//TAPQF+Gp/+GH4Zvhi3vpA1w1/ldTR0NN/39cMAJXU0dDSAN/RVHEgyM+FgMoAc89AzgH6AoBrz0DJc/sA+EqBAQD0hpUB1ws/f5NwcHDikSAUAISOKCH4I7ubIvhKgQEA9Fsw+GreIvhKgQEA9HyVAdcLP3+TcHBw4gI1MzHoXwb4QsjL//hGzwsA+EoB9ADJ7VR/+GcCASAYFgEJuORhh1AXAL74QW6OEu1E0NP/0wD0Bfhqf/hh+Gb4Yt7U0fhFIG6SMHDe+EK68uBl+AD4QsjL//hGzwsA+EoB9ADJ7VT4DyD7BCDQ7R7tU/ACMPhCyMv/+EbPCwD4SgH0AMntVH/4ZwIC2hsZAQFIGgAs+ELIy//4Rs8LAPhKAfQAye1U+A/yAAEBSBwAWHAi0NYCMdIAMNwhxwDcIdcNH/K8UxHdwQQighD////9vLHyfAHwAfhHbvJ8';
      var res = await client.boc.parse_account(ParamsOfParse(boc: boc));

      expect(
          res.parsed['id'],
          equals(
              '0:2bb4a0e8391e7ea8877f4825064924bd41ce110fce97e939d3323999e1efbb13'));
      expect(res.parsed['last_trans_lt'], equals('0x20eadff7e03'));
      expect(res.parsed['balance'], equals('0x958a26eb8e7a18d'));
    });

    test('parse_block', () async {
      var boc =
          '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';
      var res = await client.boc.parse_block(ParamsOfParse(boc: boc));
      //print(res);

      expect(
          res.parsed['id'],
          equals(
              '048f59d5d652459939ea5c5e7b291155205696b71e0c556f641df69e70e1e725'));
      expect(res.parsed['seq_no'], equals(4296363));
      expect(res.parsed['gen_utime'], equals(1600234696));
    });

    test('parse_shardstate', () async {
      var boc = await File('./test/files/parse_shardstate.txt').readAsString();
      //boc = '';
      var res = await client.boc.parse_shardstate(ParamsOfParseShardstate(
          boc: boc, id: 'zerostate:-1', workchain_id: -1));

      //print(res);

      expect(res.parsed['id'], equals('zerostate:-1'));
      expect(res.parsed['workchain_id'], equals(-1));
      expect(res.parsed['seq_no'], equals(0));
    });

    test('get_blockchain_config', () async {
      final boc =
          await File('./test/files/get_blockchain_config.txt').readAsString();
      boc.replaceAll('\n', '');
      var res = await client.boc
          .get_blockchain_config(ParamsOfGetBlockchainConfig(block_boc: boc));

      final bocres = await File('./test/files/get_blockchain_config_result.txt')
          .readAsString();

      expect(res.config_boc, equals(bocres));
    });

    test('get_boc_hash', () async {
      var res = await client.boc.get_boc_hash(ParamsOfGetBocHash(
          boc:
              'te6ccgEBAQEAWAAAq2n+AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAE/zMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzSsG8DgAAAAAjuOu9NAL7BxYpA'));

      //print(res);

      expect(
          res.hash,
          equals(
              'dfd47194f3058ee058bfbfad3ea40cbbd9ad17ca77cd0904d4d9f18a48c2fbca'));
    });
  });
}
