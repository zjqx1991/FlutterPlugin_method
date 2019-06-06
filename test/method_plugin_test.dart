import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:method_plugin/method_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('method_plugin');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await MethodPlugin.platformVersion, '42');
  });
}
