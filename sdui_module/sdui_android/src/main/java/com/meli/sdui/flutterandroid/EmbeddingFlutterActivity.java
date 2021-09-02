package com.meli.sdui.flutterandroid;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

public class EmbeddingFlutterActivity extends FlutterActivity implements FlutterEngineBuilder.Listener {

    private static final String EXTRA_INITIAL_ROUTE = "EXTRA_INITIAL_ROUTE";

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

    @Nullable
    @Override
    public FlutterEngine provideFlutterEngine(@NonNull Context context) {
        return new FlutterEngineBuilder(this)
                .setListener(this)
                .build();
    }

    @Override
    public void onReceiveExitCommand(String command, String data) {
        Intent returnIntent = getIntent();
        returnIntent.putExtra("data", data);
        setResult(Activity.RESULT_OK, returnIntent);
        finish();
    }
}
