import 'dart:async';

import 'package:flutter/services.dart';

/*
* 用来中转 底层 和 上层 交互
**/
class MethodPlugin {
  ///创建一个 方法通道
  static const MethodChannel _channel =
      const MethodChannel('method_plugin');

  ///1、获取从底层获取的数据(从底层获取数据)
  static Future<String> get platformVersion async {
    /// getPlatformVersion 这是一个通道方法用来连接 底层和上层
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  ///2、定义一个 从上层传参到底层
  static void flutterToPaltform(String argment) async {
    _channel.invokeMethod('flutterToPaltform', argment);

  }


  ///3、定义一个 从上层传参到底层
  static Future<String> getFlutterToPaltform(String argment) async {
    final String result = await _channel.invokeMethod('getFlutterToNavigation', argment);
    return 'Flutter回收到信息：${result}';
  }
}
