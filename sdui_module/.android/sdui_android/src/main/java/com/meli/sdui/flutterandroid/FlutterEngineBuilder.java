package com.meli.sdui.flutterandroid;

import android.content.Context;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class FlutterEngineBuilder {

    public interface Listener {
        void onReceiveExitCommand(String command, String data);
    }

    private static final String PLATFORM_CHANNEL = "platformChannel";

    private final Context context;
    private Listener listener;

    public FlutterEngineBuilder(Context context) {
        this.context = context;
    }

    public FlutterEngineBuilder setListener(Listener listener) {
        this.listener = listener;
        return this;
    }

    public FlutterEngine build() {
        FlutterEngine flutterEngine = new FlutterEngine(context);
        MethodChannel methodChannel = new MethodChannel(flutterEngine.getDartExecutor(), PLATFORM_CHANNEL);
        methodChannel.setMethodCallHandler((call, result) -> {
            if(call.method.equals("exit")){
                if (listener != null) {
                    listener.onReceiveExitCommand(call.method, call.arguments.toString());
                }
            }
            else {
                result.notImplemented();
            }
        });
        return flutterEngine;
    }
}
