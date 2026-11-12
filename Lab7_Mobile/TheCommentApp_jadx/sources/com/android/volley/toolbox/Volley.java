package com.android.volley.toolbox;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.http.AndroidHttpClient;
import android.os.Build;
import com.android.volley.Network;
import com.android.volley.RequestQueue;
import java.io.File;

/* JADX INFO: loaded from: classes.dex */
public class Volley {
    private static final String DEFAULT_CACHE_DIR = "volley";

    public static RequestQueue newRequestQueue(Context context, BaseHttpStack stack) {
        BasicNetwork network;
        if (stack == null) {
            if (Build.VERSION.SDK_INT >= 9) {
                network = new BasicNetwork((BaseHttpStack) new HurlStack());
            } else {
                String userAgent = "volley/0";
                try {
                    String packageName = context.getPackageName();
                    PackageInfo info = context.getPackageManager().getPackageInfo(packageName, 0);
                    userAgent = packageName + "/" + info.versionCode;
                } catch (PackageManager.NameNotFoundException e) {
                }
                network = new BasicNetwork(new HttpClientStack(AndroidHttpClient.newInstance(userAgent)));
            }
        } else {
            network = new BasicNetwork(stack);
        }
        return newRequestQueue(context, network);
    }

    @Deprecated
    public static RequestQueue newRequestQueue(Context context, HttpStack stack) {
        if (stack == null) {
            return newRequestQueue(context, (BaseHttpStack) null);
        }
        return newRequestQueue(context, new BasicNetwork(stack));
    }

    private static RequestQueue newRequestQueue(Context context, Network network) {
        final Context appContext = context.getApplicationContext();
        DiskBasedCache.FileSupplier cacheSupplier = new DiskBasedCache.FileSupplier() { // from class: com.android.volley.toolbox.Volley.1
            private File cacheDir = null;

            @Override // com.android.volley.toolbox.DiskBasedCache.FileSupplier
            public File get() {
                if (this.cacheDir == null) {
                    this.cacheDir = new File(appContext.getCacheDir(), Volley.DEFAULT_CACHE_DIR);
                }
                return this.cacheDir;
            }
        };
        RequestQueue queue = new RequestQueue(new DiskBasedCache(cacheSupplier), network);
        queue.start();
        return queue;
    }

    public static RequestQueue newRequestQueue(Context context) {
        return newRequestQueue(context, (BaseHttpStack) null);
    }
}
