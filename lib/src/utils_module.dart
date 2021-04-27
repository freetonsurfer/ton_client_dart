part of 'tonsdkmodule.dart';

class UtilsModule extends _TonSdkModule {
  UtilsModule(TonSdkCore core) : super(core);

///Converts address from any TON format to any TON format
Future<ResultOfConvertAddress> convert_address(ParamsOfConvertAddress params) async {
final res = await _tonCore.request('utils.convert_address',params.toString());
 return ResultOfConvertAddress.fromMap(res);}
///Calculates storage fee for an account over a specified time period
Future<ResultOfCalcStorageFee> calc_storage_fee(ParamsOfCalcStorageFee params) async {
final res = await _tonCore.request('utils.calc_storage_fee',params.toString());
 return ResultOfCalcStorageFee.fromMap(res);}
///Compresses data using Zstandard algorithm
Future<ResultOfCompressZstd> compress_zstd(ParamsOfCompressZstd params) async {
final res = await _tonCore.request('utils.compress_zstd',params.toString());
 return ResultOfCompressZstd.fromMap(res);}
///Decompresses data using Zstandard algorithm
Future<ResultOfDecompressZstd> decompress_zstd(ParamsOfDecompressZstd params) async {
final res = await _tonCore.request('utils.decompress_zstd',params.toString());
 return ResultOfDecompressZstd.fromMap(res);}
}