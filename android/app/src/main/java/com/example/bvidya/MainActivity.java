package com.bvidya;

import android.content.Intent;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.util.Log;
import android.view.Window;
import android.view.WindowManager;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.example.bvidya.MainActivity2;

import java.util.Objects;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterView;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    String CHANNEL = "test_activity";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        Window window = this.getWindow();
        window.addFlags(WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD);
        window.addFlags(WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED);
        window.addFlags(WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            String rtmchannalname = call.argument("rtcchannal");
                            String rtmtoken = call.argument("rtctoken");
                            String screen = call.argument("stop");
                            Log.d("resdfd",rtmchannalname+"_____"+rtmtoken);
                            Intent i = new Intent(getApplicationContext(), MainActivity2.class);
                            i.putExtra("rtcchannal",rtmchannalname);
                            i.putExtra("rtctoken",rtmtoken);
                            i.putExtra("stop",screen);
                            startActivity(i);
                        }
                );
    }

}
