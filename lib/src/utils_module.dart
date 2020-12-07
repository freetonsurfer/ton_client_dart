part of 'tonsdkmodule.dart';

class UtilsModule extends _TonSdkModule {
  UtilsModule(TonSdkCore core) : super(core);

/// Converts address from any TON format to any TON format
Future<ResultOfConvertAddress> convert_address(ParamsOfConvertAddress params) async {
final res = await _tonCore.request('utils.convert_address',params.toString());
 return ResultOfConvertAddress.fromMap(res);}
}