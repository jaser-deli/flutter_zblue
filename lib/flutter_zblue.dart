import 'dart:async';

import 'package:flutter/services.dart';

class FlutterZblue {
  static const MethodChannel _channel = const MethodChannel('flutter_zblue');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> printToBT({required String printStr}) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'printStr': printStr,
    };
    final String result = await _channel.invokeMethod('printToBt', params);
    return result;
  }
}
