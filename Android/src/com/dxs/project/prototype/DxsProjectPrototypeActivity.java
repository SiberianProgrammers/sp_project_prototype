package com.dxs.project.prototype;

import dxs.DxsActivity;
//import org.qtproject.qt5.android.QtNative;
//import org.qtproject.qt5.android.bindings.QtActivity;

import android.app.Activity;
import android.os.Bundle;
import android.os.Build;
import android.content.Intent;
import android.provider.DocumentsContract;
import android.provider.MediaStore;
import android.database.Cursor;
import android.net.Uri;
import android.provider.ContactsContract;
import android.content.Context;
import android.provider.Contacts.Intents;
import android.provider.ContactsContract.CommonDataKinds.Phone;
import android.view.View;
import android.view.Window;
import android.graphics.Rect;
import android.util.Log;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.content.SharedPreferences;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.PackageInfo;
import android.os.AsyncTask;
import android.media.ExifInterface;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import android.net.wifi.WifiManager;
import android.net.wifi.WifiInfo;
import android.provider.ContactsContract.Contacts;
import android.content.ContentUris;
import android.provider.ContactsContract.DisplayPhoto;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import java.io.InputStream;
import java.io.ByteArrayOutputStream;
import java.util.Set;
import java.util.HashSet;
import java.util.HashMap;
import java.util.Map;

import android.app.PendingIntent;
import android.telephony.SmsManager;
import android.util.TypedValue;
import android.text.TextUtils;
import android.app.Application;
import android.view.WindowManager;
import android.graphics.Color;
import android.R.style;

public class DxsProjectPrototypeActivity extends DxsActivity
{
    Context context;

    //--------------------------------------------------------------------------
    @Override
    public void onCreate(Bundle savedInstanceState) {
        System.out.println("#### onCreate DxsProjectPrototypeActivity");
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

