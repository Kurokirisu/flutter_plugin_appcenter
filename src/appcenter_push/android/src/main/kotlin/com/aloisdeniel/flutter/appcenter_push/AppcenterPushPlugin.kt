package com.aloisdeniel.flutter.appcenter_push

import com.microsoft.appcenter.push.Push
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import com.microsoft.appcenter.utils.async.AppCenterConsumer



class AppcenterPushPlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "aloisdeniel.github.com/flutter_plugin_appcenter/appcenter_push")
      channel.setMethodCallHandler(AppcenterPushPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } 
    else if (call.method == "isEnabled"){
     Push.isEnabled().thenAccept(AppCenterConsumer<Boolean> { enabled -> result.success(enabled!!) })
    }
    else {
      result.notImplemented()
    }
  }
}
