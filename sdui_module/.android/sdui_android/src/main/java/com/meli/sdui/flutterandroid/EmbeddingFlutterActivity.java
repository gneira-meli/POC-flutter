package com.meli.sdui.flutterandroid;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class EmbeddingFlutterActivity extends FlutterActivity {

    private static final String EXTRA_INITIAL_ROUTE = "EXTRA_INITIAL_ROUTE";

    private final String PLATFORM_CHANNEL = "platformChannel";

    private MethodChannel methodChannel;
    private String initialRoute;

    public static Intent createIntent(Context context, String route) {
        Intent intent = new Intent(context, EmbeddingFlutterActivity.class);
        intent.putExtra(EXTRA_INITIAL_ROUTE, route);
        return intent;
    }

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        initialRoute = getIntent().getStringExtra(EXTRA_INITIAL_ROUTE);
    }

    @Override
    public String getInitialRoute() {
        if (initialRoute != null) {
            return initialRoute;
        }
        return super.getInitialRoute();
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        GeneratedPluginRegistrant.registerWith(flutterEngine);
        
        methodChannel = new MethodChannel(flutterEngine.getDartExecutor(), PLATFORM_CHANNEL);
        methodChannel.setMethodCallHandler((call, result) -> {
            if(call.method.equals("exit")){
                Intent returnIntent = getIntent();
                returnIntent.putExtra("data", call.arguments.toString());
                setResult(Activity.RESULT_OK, returnIntent);
                finish();
            }
            else {
                result.notImplemented();
            }
        });
    }

}
