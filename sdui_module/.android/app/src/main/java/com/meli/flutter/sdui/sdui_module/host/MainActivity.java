package com.meli.flutter.sdui.sdui_module.host;

import com.meli.sdui.flutterandroid.EmbeddingFlutterActivity;

public class MainActivity extends EmbeddingFlutterActivity {

    @Override
    public String getInitialRoute() {
        return "/home?user=pepe";
    }

}
