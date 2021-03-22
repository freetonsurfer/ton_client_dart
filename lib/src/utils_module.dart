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

  ///Calculates storage fee for an account over a specified time period
  Future<ResultOfCalcStorageFee> calc_storage_fee(
      ParamsOfCalcStorageFee params) async {
    final res =
        await _tonCore.request('utils.calc_storage_fee', params.toString());
    return ResultOfCalcStorageFee.fromMap(res);
  }
}
