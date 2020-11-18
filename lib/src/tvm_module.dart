part of 'tonsdkmodule.dart';

class TvmModule extends _TonSdkModule {
  TvmModule(TonSdkCore core) : super(core);

  Future<ResultOfRunExecutor> run_executor(ParamsOfRunExecutor params) async {
    final res = await _tonCore.request('tvm.run_executor', params.toString());
    return ResultOfRunExecutor.fromMap(res);
  }

  Future<ResultOfRunTvm> run_tvm(ParamsOfRunTvm params) async {
    final res = await _tonCore.request('tvm.run_tvm', params.toString());
    return ResultOfRunTvm.fromMap(res);
  }

  /// Executes getmethod and returns data from TVM stack
  Future<ResultOfRunGet> run_get(ParamsOfRunGet params) async {
    final res = await _tonCore.request('tvm.run_get', params.toString());
    return ResultOfRunGet.fromMap(res);
  }
}
