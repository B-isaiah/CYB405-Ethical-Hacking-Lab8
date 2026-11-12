package es.dmoral.toasty;

import android.content.Context;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.NinePatchDrawable;
import android.os.Build;
import android.view.View;
import androidx.appcompat.content.res.AppCompatResources;
import androidx.core.content.ContextCompat;

/* JADX INFO: loaded from: classes.dex */
final class ToastyUtils {
    private ToastyUtils() {
    }

    static Drawable tintIcon(Drawable drawable, int tintColor) {
        drawable.setColorFilter(tintColor, PorterDuff.Mode.SRC_IN);
        return drawable;
    }

    static Drawable tint9PatchDrawableFrame(Context context, int tintColor) {
        NinePatchDrawable toastDrawable = (NinePatchDrawable) getDrawable(context, R.drawable.toast_frame);
        return tintIcon(toastDrawable, tintColor);
    }

    static void setBackground(View view, Drawable drawable) {
        if (Build.VERSION.SDK_INT >= 16) {
            view.setBackground(drawable);
        } else {
            view.setBackgroundDrawable(drawable);
        }
    }

    static Drawable getDrawable(Context context, int id) {
        return AppCompatResources.getDrawable(context, id);
    }

    static int getColor(Context context, int color) {
        return ContextCompat.getColor(context, color);
    }
}
