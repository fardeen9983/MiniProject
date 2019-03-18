package com.miniproject.prototype.mini_project

import android.os.Bundle
import android.util.Log
import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.e("fsdfdsf", savedInstanceState.toString())
        GeneratedPluginRegistrant.registerWith(this)
    }
}
