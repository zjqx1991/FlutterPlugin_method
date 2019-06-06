package com.revanwang.method_plugin;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** MethodPlugin */
public class MethodPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "method_plugin");
    channel.setMethodCallHandler(new MethodPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }
    else if ("flutterToPaltform".equals(call.method)) {
      System.out.println(call.arguments);
    }
    else  if (call.method.equals("getFlutterToNavigation")) {
      System.out.println("method_plgin" + call.arguments);
      result.success("Android收到"+call.arguments);
    }
    else {
      result.success("传送失败");
    }
  }
}
