package com.bondu.bondu

import io.flutter.embedding.android.FlutterActivity
import com.otpless.otplessflutter.OtplessFlutterPlugin;
import android.content.Intent;
import android.os.Bundle
import android.os.PersistableBundle

class MainActivity: FlutterActivity() {
    var flutterUIReady : Boolean  =false;
    var animationFinished:Boolean = false;
    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        val plugin = flutterEngine?.plugins?.get(OtplessFlutterPlugin::class.java)
        if (plugin is OtplessFlutterPlugin) {
            plugin.onNewIntent(intent)
        }
    }
    override fun onBackPressed() {
        val plugin = flutterEngine?.plugins?.get(OtplessFlutterPlugin::class.java)
        if (plugin is OtplessFlutterPlugin) {
            if (plugin.onBackPressed()) return
        }
// handle other cases
        super.onBackPressed()
    }

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
    }
    override fun onFlutterUiDisplayed() {
        super.onFlutterUiDisplayed()
    }
    override fun onFlutterUiNoLongerDisplayed(){
        flutterUIReady = false;
    }
}
