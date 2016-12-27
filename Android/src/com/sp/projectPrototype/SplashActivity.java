package com.sp.projectPrototype;

import android.content.Intent;
import android.os.Bundle;
import android.app.Activity;
import android.support.v7.app.AppCompatActivity;

import android.os.Build;
import android.view.Window;
import android.view.WindowManager;
import android.graphics.Color;
import android.view.View;
import java.lang.System;

//public class SplashActivity extends AppCompatActivity {
public class SplashActivity extends Activity {

    public static Activity splashScreen;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN);
            getWindow().setStatusBarColor(Color.TRANSPARENT);
        } else {
            this.getWindow().setFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS,WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
        }

        super.onCreate(savedInstanceState);
        splashScreen = this;
        Intent intent = new Intent(this, SpProjectPrototypeActivity.class);
        startActivity(intent);
    }
}
