import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/foundation.dart' show TargetPlatform;

class AppcenterPush {
  static String get id => (defaultTargetPlatform == TargetPlatform.iOS)
      ? "MSPush"
      : "com.microsoft.appcenter.push.Push";

  static const MethodChannel _channel =
      const MethodChannel('aloisdeniel.github.com/flutter_plugin_appcenter/appcenter_push');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool> get isEnabled =>
      _channel.invokeMethod('isEnabled').then((r) => r as bool);

  static Future setEnabled(bool isEnabled) =>
      _channel.invokeMethod('setEnabled', <String, bool>{
        'isEnabled': isEnabled,
      });
}
