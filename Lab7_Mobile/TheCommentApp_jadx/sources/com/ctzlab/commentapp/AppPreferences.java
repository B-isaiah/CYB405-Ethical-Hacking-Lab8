package com.ctzlab.commentapp;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

/* JADX INFO: loaded from: classes2.dex */
public class AppPreferences {
    public static void setIsLoggedIn(Context context, boolean isLoggedIn) {
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        sharedPreferences.edit().putBoolean("isLoggedIn", isLoggedIn).apply();
    }

    public static boolean getIsLoggedIn(Context context) {
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        return sharedPreferences.getBoolean("isLoggedIn", false);
    }

    public static void setUsername(Context context, String secret) {
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        sharedPreferences.edit().putString("username", secret).apply();
    }

    public static String getUsername(Context context) {
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        return sharedPreferences.getString("username", "");
    }

    public static void setBaseUrl(Context context, String baseUrl) {
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        sharedPreferences.edit().putString("baseUrl", baseUrl).apply();
    }

    public static String getBaseUrl(Context context) {
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        return sharedPreferences.getString("baseUrl", "");
    }
}
