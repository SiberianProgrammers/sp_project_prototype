package com.dxs.projectPrototype;

import dxs.DxsActivity;
import android.app.Activity;
import android.content.Context;
import android.os.Bundle;

public class DxsProjectPrototypeActivity extends DxsActivity
{
    Context context;

    //--------------------------------------------------------------------------
    @Override
    public void onCreate(Bundle savedInstanceState) {
        context = this.getApplicationContext();
        super.onCreate(savedInstanceState);
    }

    //--------------------------------------------------------------------------
    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    //--------------------------------------------------------------------------
    @Override
    public void onStop() {
        super.onStop();
    }

    //--------------------------------------------------------------------------
    @Override
    public void onStart() {
        super.onStart();
    }

    //--------------------------------------------------------------------------
    @Override
    protected void onResume() {
        super.onResume();
    }

    //--------------------------------------------------------------------------
    @Override
    protected void onPause() {
        super.onPause();
    }
}

