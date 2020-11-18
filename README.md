# TON CLIENT DART
It is Dart packege that provide binding to TON SDK Client library. TON SDK (TONOS Client Library) is a library written in Rust that can be dynamically linked. It provides all heavy-computation components and functions, such as TON Virtual Machine, TON Transaction Executor, ABI-related functions, boc-related functions, crypto functions.

## Use this package as a library

### 1. Depend on it
Add this to your package's pubspec.yaml file:
```
dependencies:
  ton_client_dart: ^0.1.0
```

### 2. Install it
You can install packages from the command line:
```
  $ pub get
```
Alternatively, your editor might support pub get. Check the docs for your editor to learn more.

### 3. Import it
Now in your Dart code, you can use:
```
  import 'package:ton_client_dart/ton_client_dart.dart'
```

## How to use

#### Configuring client
```
import 'package:ton_client_dart/ton_client_dart.dart'
//..
var CLIENT_DEFAULT_SETUP = {
  'network': {
    'server_address': 'http://localhost',
    'message_retries_count': 5,
    'message_processing_timeout': 40000,
    'wait_for_timeout': 40000,
    'out_of_sync_threshold': 15000,
    'access_key': ''
  },
  'crypto': {'fish_param': ''},
  'abi': {
    'message_expiration_timeout': 40000,
    'message_expiration_timeout_grow_factor': 1.5
  }
};
//..
var client = TonClient();
await client.connect(CLIENT_SETUP);
//..
await client.disconnect();
```
To initialize the client, you need to call the `TonClient.connect` function and pass the settings to it. After you have finished working with the client, you must close it with the `TonClient.disconnect` function. **Don't forget to call this functions.**

#### Output TON SDK version
```
  await client.connect(CLIENT_DEFAULT_SETUP);
  //..
  var result = await client.version();
  print(result.version);
  //..
  await client.disconnect();
```
#### Query collection
```
//..
  var query = await client.net.query_collection(ParamsOfQueryCollection(
      collection: 'accounts',
      result: 'id code',
      filter: {
        'id': {'eq': enmsg.address}
  }));
//..
```
#### Execute getmethod and returns data from TVM stack
```
//..
   final code = await File('./test/files/run_get_code.txt').readAsString();
   final data = await File('./test/files/run_get_data.txt').readAsString();

   final res = await client.abi.encode_account(ParamsOfEncodeAccount(
    state_init: StateInitSource_StateInit(code: code, data: data)));

   final adr = await client.utils.convert_address(ParamsOfConvertAddress(
    address: res.id, output_format: AddressStringFormat_Hex()));
   
   var res_run_get = await client.tvm.run_get(ParamsOfRunGet(
    account: res.account, function_name: 'participant_list'));
   String result = res_run_get.output.toString();
//..
```
##### Note: see [tests](test/) for more examples.
##### Note: you can see the contract deployment procces [here](test/src/processing_net_test.dart).
#
#
## Supported Platforms

 Now it is supported only on Linux x64.
- Windows x64 will be available soon.
- macOS throught some period of time.

### Compile for unavailable platform
 Compiling for Windows or Mac shouldn't be difficult. You need to take the following steps:
1. Get the [TON SDK](https://github.com/tonlabs/TON-SDK/) library for the required platform .
2. Compile [wrapper.cpp](lib/src/tonsdklib) file into a dynamic link library for the given platform.
3. Add load processing for the given platform to the `connect` function in [core.dart](lib/src/core.dart) file.
4. Done!
If you have any question, feel free to ask!

## TODO
- Build single file sdk library
- Windows support
- iMac support
- Refactor code generator and release it opensource
- improve tests
- change request id generation
- improve help documents and comments
- check memory leaks
- Flutter support
- improve error msgs
- think about
  - helper function usage
  - query module
  - contract auto deploy and runing module
  - connect functoin with object from map param
  - version as TON SDK lib
