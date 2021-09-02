package com.meli.sdui.flutterandroid;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterFragment;
import io.flutter.embedding.engine.FlutterEngine;

public class EmbeddingFlutterFragment extends FlutterFragment implements FlutterEngineBuilder.Listener {

    private static final String EXTRA_INITIAL_ROUTE = "EXTRA_INITIAL_ROUTE";

    private String initialRoute;

    public static EmbeddingFlutterFragment createInstance(String route) {
        Bundle bundle = new Bundle();
        bundle.putString(EXTRA_INITIAL_ROUTE, route);
        EmbeddingFlutterFragment fragment = new EmbeddingFlutterFragment();
        fragment.setArguments(bundle);
        return fragment;
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        if (getArguments() != null) {
            initialRoute = getArguments().getString(EXTRA_INITIAL_ROUTE);
        }
        return super.onCreateView(inflater, container, savedInstanceState);
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
        return new FlutterEngineBuilder(context)
                .setListener(this)
                .build();
    }

    @Override
    public void onReceiveExitCommand(String command, String data) {
        Toast.makeText(getContext(), "Received command: " + data, Toast.LENGTH_LONG).show();
    }
}
