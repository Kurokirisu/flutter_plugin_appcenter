#import "AppcenterPushPlugin.h"
#import <AppCenterPush/AppCenterPush.h>

@implementation AppcenterPushPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"aloisdeniel.github.com/flutter_plugin_appcenter/appcenter_push"
            binaryMessenger:[registrar messenger]];
  AppcenterPushPlugin* instance = [[AppcenterPushPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) 
  {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } 
  else if([@"isEnabled" isEqualToString:call.method])
   {
       result([NSNumber numberWithBool:[MSPush isEnabled]]);
   }
   else if([@"setEnabled" isEqualToString:call.method])
   {
        // Arguments
        NSNumber *isEnabled = call.arguments[@"isEnabled"];

        // Invoking plugin method
        [MSPush setEnabled:isEnabled.boolValue];
        result(nil);
   }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
