package com.ctzlab.commentapp;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import androidx.appcompat.app.AppCompatActivity;

/* JADX INFO: loaded from: classes2.dex */
public class SplashScreen extends AppCompatActivity {
    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash_screen);
        View decorView = getWindow().getDecorView();
        decorView.setSystemUiVisibility(6);
        new Handler().postDelayed(new Runnable() { // from class: com.ctzlab.commentapp.SplashScreen.1
            @Override // java.lang.Runnable
            public void run() {
                if (AppPreferences.getIsLoggedIn(SplashScreen.this.getApplicationContext())) {
                    SplashScreen.this.startActivity(new Intent(SplashScreen.this, (Class<?>) MainActivity.class));
                } else if (AppPreferences.getBaseUrl(SplashScreen.this.getApplicationContext()).equals("")) {
                    SplashScreen.this.startActivity(new Intent(SplashScreen.this, (Class<?>) BaseUrlPickerActivity.class));
                } else {
                    SplashScreen.this.startActivity(new Intent(SplashScreen.this, (Class<?>) LoginActivity.class));
                }
                SplashScreen.this.finish();
            }
        }, 4000L);
    }
}
