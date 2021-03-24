#import "TonClientDartPlugin.h"
#if __has_include(<ton_client_dart/ton_client_dart-Swift.h>)
#import <ton_client_dart/ton_client_dart-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ton_client_dart-Swift.h"
#endif

@implementation TonClientDartPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTonClientDartPlugin registerWithRegistrar:registrar];
}
@end
