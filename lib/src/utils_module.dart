part of 'tonsdkmodule.dart';

class UtilsModule extends _TonSdkModule {
  UtilsModule(TonSdkCore core) : super(core);

  ///Converts address from any TON format to any TON format
  Future<ResultOfConvertAddress> convert_address(
      ParamsOfConvertAddress params) async {
    final res =
        await _tonCore.request('utils.convert_address', params.toString());
    return ResultOfConvertAddress.fromMap(res);
  }

  ///Address types are the following
  ///
  ///`0:919db8e740d50bf349df2eea03fa30c385d846b991ff5542e67098ee833fc7f7` - standard TON address most
  ///commonly used in all cases. Also called as hex address
  ///`919db8e740d50bf349df2eea03fa30c385d846b991ff5542e67098ee833fc7f7` - account ID. A part of full
  ///address. Identifies account inside particular workchain
  ///`EQCRnbjnQNUL80nfLuoD+jDDhdhGuZH/VULmcJjugz/H9wam` - base64 address. Also called "user-friendly".
  ///Was used at the beginning of TON. Now it is supported for compatibility
  Future<ResultOfGetAddressType> get_address_type(
      ParamsOfGetAddressType params) async {
    final res =
        await _tonCore.request('utils.get_address_type', params.toString());
    return ResultOfGetAddressType.fromMap(res);
  }

  ///Calculates storage fee for an account over a specified time period
  Future<ResultOfCalcStorageFee> calc_storage_fee(
      ParamsOfCalcStorageFee params) async {
    final res =
        await _tonCore.request('utils.calc_storage_fee', params.toString());
    return ResultOfCalcStorageFee.fromMap(res);
  }

  ///Compresses data using Zstandard algorithm
  Future<ResultOfCompressZstd> compress_zstd(
      ParamsOfCompressZstd params) async {
    final res =
        await _tonCore.request('utils.compress_zstd', params.toString());
    return ResultOfCompressZstd.fromMap(res);
  }

  ///Decompresses data using Zstandard algorithm
  Future<ResultOfDecompressZstd> decompress_zstd(
      ParamsOfDecompressZstd params) async {
    final res =
        await _tonCore.request('utils.decompress_zstd', params.toString());
    return ResultOfDecompressZstd.fromMap(res);
  }
}
