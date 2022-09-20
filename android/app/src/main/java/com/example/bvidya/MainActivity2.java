package com.example.bvidya;

import static java.sql.DriverManager.println;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

import com.bvidya.MainActivity;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;

import android.util.Log;
import android.view.View;
import android.widget.Toast;

import androidx.navigation.NavController;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.navigation.ui.NavigationUI;

import com.bvidya.R;

public class MainActivity2 extends AppCompatActivity {
    String rtmchannal, rtctoken, stopscreen;
    private AppBarConfiguration appBarConfiguration;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().hide();
        setContentView(R.layout.activity_main2);
        Log.e("basu", "prashant");
        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            rtmchannal = extras.getString("rtcchannal");
            rtctoken = extras.getString("rtctoken");
            stopscreen = extras.getString("stop");
            Log.d("basu123", stopscreen);
            //The key argument here must match that used in the other activity
        }
        Bundle bundle = new Bundle();
        bundle.putString("rtm", rtmchannal);
        bundle.putString("rtctoken", rtctoken);
        bundle.putString("share", stopscreen);
        MultiProcess fragmentS1 = new MultiProcess();
        fragmentS1.setArguments(bundle);
        getSupportFragmentManager().beginTransaction().replace(R.id.container, fragmentS1).commit();
    }

    @Override
    protected void onRestart() {
        super.onRestart();
        finish();
        Toast.makeText(this, "screen-share Closed ", Toast.LENGTH_SHORT).show();
    }


}