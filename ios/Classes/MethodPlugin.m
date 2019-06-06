#import "MethodPlugin.h"

@implementation MethodPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"method_plugin"
            binaryMessenger:[registrar messenger]];
  MethodPlugin* instance = [[MethodPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }
  else if ([@"flutterToPaltform" isEqualToString:call.method]) {
      NSLog(@"%@", [NSString stringWithFormat:@"iOS底层接收到：%@", call.arguments]);
//      result([NSString stringWithFormat:@"iOS底层接收到：%@", call.arguments]);
  }
  else if ([@"getFlutterToNavigation" isEqualToString:call.method]) {
      result([NSString stringWithFormat:@"iOS底层接收到：%@", call.arguments]);
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
