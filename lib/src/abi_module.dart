part of 'tonsdkmodule.dart';

class AbiModule extends _TonSdkModule {
  AbiModule(TonSdkCore core) : super(core);

/// Encodes message body according to ABI function call.
Future<ResultOfEncodeMessageBody> encode_message_body(ParamsOfEncodeMessageBody params) async {
final res = await _tonCore.request('abi.encode_message_body',params.toString());
 return ResultOfEncodeMessageBody.fromMap(res);}
Future<ResultOfAttachSignatureToMessageBody> attach_signature_to_message_body(ParamsOfAttachSignatureToMessageBody params) async {
final res = await _tonCore.request('abi.attach_signature_to_message_body',params.toString());
 return ResultOfAttachSignatureToMessageBody.fromMap(res);}
/// Encodes an ABI-compatible message
///
/// Allows to encode deploy and function call messages,
/// both signed and unsigned.
///
/// Use cases include messages of any possible type:
/// - deploy with initial function call (i.e. `constructor` or any other function that is used for some kind
/// of initialization);
/// - deploy without initial function call;
/// - signed/unsigned + data for signing.
///
/// `Signer` defines how the message should or shouldn't be signed:
///
/// `Signer::None` creates an unsigned message. This may be needed in case of some public methods,
/// that do not require authorization by pubkey.
///
/// `Signer::External` takes public key and returns `data_to_sign` for later signing.
/// Use `attach_signature` method with the result signature to get the signed message.
///
/// `Signer::Keys` creates a signed message with provided key pair.
///
/// [SOON] `Signer::SigningBox` Allows using a special interface to imlepement signing
/// without private key disclosure to SDK. For instance, in case of using a cold wallet or HSM,
/// when application calls some API to sign data.
Future<ResultOfEncodeMessage> encode_message(ParamsOfEncodeMessage params) async {
final res = await _tonCore.request('abi.encode_message',params.toString());
 return ResultOfEncodeMessage.fromMap(res);}
/// Combines `hex`-encoded `signature` with `base64`-encoded `unsigned_message`.
/// Returns signed message encoded in `base64`.
Future<ResultOfAttachSignature> attach_signature(ParamsOfAttachSignature params) async {
final res = await _tonCore.request('abi.attach_signature',params.toString());
 return ResultOfAttachSignature.fromMap(res);}
/// Decodes message body using provided message BOC and ABI.
Future<DecodedMessageBody> decode_message(ParamsOfDecodeMessage params) async {
final res = await _tonCore.request('abi.decode_message',params.toString());
 return DecodedMessageBody.fromMap(res);}
/// Decodes message body using provided body BOC and ABI.
Future<DecodedMessageBody> decode_message_body(ParamsOfDecodeMessageBody params) async {
final res = await _tonCore.request('abi.decode_message_body',params.toString());
 return DecodedMessageBody.fromMap(res);}
/// Creates account state BOC
///
/// Creates account state provided with one of these sets of data :
/// 1. BOC of code, BOC of data, BOC of library
/// 2. TVC (string in `base64`), keys, init params
Future<ResultOfEncodeAccount> encode_account(ParamsOfEncodeAccount params) async {
final res = await _tonCore.request('abi.encode_account',params.toString());
 return ResultOfEncodeAccount.fromMap(res);}
}