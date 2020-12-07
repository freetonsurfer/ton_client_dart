import 'tonsdktypes.dart';
import 'core.dart';

part 'client_module.dart';
part 'abi_module.dart';
part 'boc_module.dart';
part 'crypto_module.dart';
part 'utils_module.dart';
part 'processing_module.dart';
part 'tvm_module.dart';
part 'net_module.dart';
part 'debot_module.dart';

class _TonSdkModule {
  var _tonCore;
  _TonSdkModule(TonSdkCore core) {
    _tonCore = core;
  }
}
