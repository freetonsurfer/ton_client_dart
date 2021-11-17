part of 'tonsdkmodule.dart';

class AbiModule extends _TonSdkModule {
  AbiModule(TonSdkCore core) : super(core);

///Encodes message body according to ABI function call.
Future<ResultOfEncodeMessageBody> encode_message_body(ParamsOfEncodeMessageBody params) async {
final res = await _tonCore.request('abi.encode_message_body',params.toString());
 return ResultOfEncodeMessageBody.fromMap(res);}
Future<ResultOfAttachSignatureToMessageBody> attach_signature_to_message_body(ParamsOfAttachSignatureToMessageBody params) async {
final res = await _tonCore.request('abi.attach_signature_to_message_body',params.toString());
 return ResultOfAttachSignatureToMessageBody.fromMap(res);}
///Allows to encode deploy and function call messages,
///both signed and unsigned.
///
///Use cases include messages of any possible type:
///- deploy with initial function call (i.e. `constructor` or any other function that is used for some kind
///of initialization);
///- deploy without initial function call;
///- signed/unsigned + data for signing.
///
///`Signer` defines how the message should or shouldn't be signed:
///
///`Signer::None` creates an unsigned message. This may be needed in case of some public methods,
///that do not require authorization by pubkey.
///
///`Signer::External` takes public key and returns `data_to_sign` for later signing.
///Use `attach_signature` method with the result signature to get the signed message.
///
///`Signer::Keys` creates a signed message with provided key pair.
///
///[SOON] `Signer::SigningBox` Allows using a special interface to implement signing
///without private key disclosure to SDK. For instance, in case of using a cold wallet or HSM,
///when application calls some API to sign data.
///
///There is an optional public key can be provided in deploy set in order to substitute one
///in TVM file.
///
///Public key resolving priority:
///1. Public key from deploy set.
///2. Public key, specified in TVM file.
///3. Public key, provided by signer.
Future<ResultOfEncodeMessage> encode_message(ParamsOfEncodeMessage params) async {
final res = await _tonCore.request('abi.encode_message',params.toString());
 return ResultOfEncodeMessage.fromMap(res);}
///Allows to encode deploy and function call messages.
///
///Use cases include messages of any possible type:
///- deploy with initial function call (i.e. `constructor` or any other function that is used for some kind
///of initialization);
///- deploy without initial function call;
///- simple function call
///
///There is an optional public key can be provided in deploy set in order to substitute one
///in TVM file.
///
///Public key resolving priority:
///1. Public key from deploy set.
///2. Public key, specified in TVM file.
Future<ResultOfEncodeInternalMessage> encode_internal_message(ParamsOfEncodeInternalMessage params) async {
final res = await _tonCore.request('abi.encode_internal_message',params.toString());
 return ResultOfEncodeInternalMessage.fromMap(res);}
///Combines `hex`-encoded `signature` with `base64`-encoded `unsigned_message`. Returns signed message encoded in `base64`.
Future<ResultOfAttachSignature> attach_signature(ParamsOfAttachSignature params) async {
final res = await _tonCore.request('abi.attach_signature',params.toString());
 return ResultOfAttachSignature.fromMap(res);}
///Decodes message body using provided message BOC and ABI.
Future<DecodedMessageBody> decode_message(ParamsOfDecodeMessage params) async {
final res = await _tonCore.request('abi.decode_message',params.toString());
 return DecodedMessageBody.fromMap(res);}
///Decodes message body using provided body BOC and ABI.
Future<DecodedMessageBody> decode_message_body(ParamsOfDecodeMessageBody params) async {
final res = await _tonCore.request('abi.decode_message_body',params.toString());
 return DecodedMessageBody.fromMap(res);}
///Creates account state provided with one of these sets of data :
///1. BOC of code, BOC of data, BOC of library
///2. TVC (string in `base64`), keys, init params
Future<ResultOfEncodeAccount> encode_account(ParamsOfEncodeAccount params) async {
final res = await _tonCore.request('abi.encode_account',params.toString());
 return ResultOfEncodeAccount.fromMap(res);}
///Note: this feature requires ABI 2.1 or higher.
Future<ResultOfDecodeAccountData> decode_account_data(ParamsOfDecodeAccountData params) async {
final res = await _tonCore.request('abi.decode_account_data',params.toString());
 return ResultOfDecodeAccountData.fromMap(res);}
///Updates initial account data with initial values for the contract's static variables and owner's public key. This operation is applicable only for initial account data (before deploy). If the contract is already deployed, its data doesn't contain this data section any more.
Future<ResultOfUpdateInitialData> update_initial_data(ParamsOfUpdateInitialData params) async {
final res = await _tonCore.request('abi.update_initial_data',params.toString());
 return ResultOfUpdateInitialData.fromMap(res);}
///Decodes initial values of a contract's static variables and owner's public key from account initial data This operation is applicable only for initial account data (before deploy). If the contract is already deployed, its data doesn't contain this data section any more.
Future<ResultOfDecodeInitialData> decode_initial_data(ParamsOfDecodeInitialData params) async {
final res = await _tonCore.request('abi.decode_initial_data',params.toString());
 return ResultOfDecodeInitialData.fromMap(res);}
///Solidity functions use ABI types for [builder encoding](https://github.com/tonlabs/TON-Solidity-Compiler/blob/master/API.md#tvmbuilderstore).
///The simplest way to decode such a BOC is to use ABI decoding.
///ABI has it own rules for fields layout in cells so manually encoded
///BOC can not be described in terms of ABI rules.
///
///To solve this problem we introduce a new ABI type `Ref(<ParamType>)`
///which allows to store `ParamType` ABI parameter in cell reference and, thus,
///decode manually encoded BOCs. This type is available only in `decode_boc` function
///and will not be available in ABI messages encoding until it is included into some ABI revision.
///
///Such BOC descriptions covers most users needs. If someone wants to decode some BOC which
///can not be described by these rules (i.e. BOC with TLB containing constructors of flags
///defining some parsing conditions) then they can decode the fields up to fork condition,
///check the parsed data manually, expand the parsing schema and then decode the whole BOC
///with the full schema.
Future<ResultOfDecodeBoc> decode_boc(ParamsOfDecodeBoc params) async {
final res = await _tonCore.request('abi.decode_boc',params.toString());
 return ResultOfDecodeBoc.fromMap(res);}
}