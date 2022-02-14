package com.example.testapp


import android.content.Intent
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private val channel ="koruma/channel"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,channel).setMethodCallHandler {
            call, result ->
            if(call.method == "startService")
            {
                var aaa:String? = call.argument<String>("isim")
                Intent(this,MyReceiver ::class.java).also { intent ->
                    println("yyyeeesss")
                    startService(intent)
                }
                println(aaa)

            }else if(call.method == "stopService")
            {
                Intent(this,MyReceiver ::class.java).also {intent ->
                    stopService(intent)
                }
            }else
            {
                result.notImplemented()
            }
        }
    }
}
