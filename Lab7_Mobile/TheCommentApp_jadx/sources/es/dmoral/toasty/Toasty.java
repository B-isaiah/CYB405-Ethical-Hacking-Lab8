package es.dmoral.toasty;

import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

/* JADX INFO: loaded from: classes.dex */
public class Toasty {
    public static final int LENGTH_LONG = 1;
    public static final int LENGTH_SHORT = 0;
    private static final Typeface LOADED_TOAST_TYPEFACE;
    private static boolean allowQueue;
    private static Typeface currentTypeface;
    private static Toast lastToast;
    private static int textSize;
    private static boolean tintIcon;

    static {
        Typeface typefaceCreate = Typeface.create("sans-serif-condensed", 0);
        LOADED_TOAST_TYPEFACE = typefaceCreate;
        currentTypeface = typefaceCreate;
        textSize = 16;
        tintIcon = true;
        allowQueue = true;
        lastToast = null;
    }

    private Toasty() {
    }

    public static Toast normal(Context context, int message) {
        return normal(context, (CharSequence) context.getString(message), 0, (Drawable) null, false);
    }

    public static Toast normal(Context context, CharSequence message) {
        return normal(context, message, 0, (Drawable) null, false);
    }

    public static Toast normal(Context context, int message, Drawable icon) {
        return normal(context, (CharSequence) context.getString(message), 0, icon, true);
    }

    public static Toast normal(Context context, CharSequence message, Drawable icon) {
        return normal(context, message, 0, icon, true);
    }

    public static Toast normal(Context context, int message, int duration) {
        return normal(context, (CharSequence) context.getString(message), duration, (Drawable) null, false);
    }

    public static Toast normal(Context context, CharSequence message, int duration) {
        return normal(context, message, duration, (Drawable) null, false);
    }

    public static Toast normal(Context context, int message, int duration, Drawable icon) {
        return normal(context, (CharSequence) context.getString(message), duration, icon, true);
    }

    public static Toast normal(Context context, CharSequence message, int duration, Drawable icon) {
        return normal(context, message, duration, icon, true);
    }

    public static Toast normal(Context context, int message, int duration, Drawable icon, boolean withIcon) {
        return custom(context, (CharSequence) context.getString(message), icon, ToastyUtils.getColor(context, R.color.normalColor), ToastyUtils.getColor(context, R.color.defaultTextColor), duration, withIcon, true);
    }

    public static Toast normal(Context context, CharSequence message, int duration, Drawable icon, boolean withIcon) {
        return custom(context, message, icon, ToastyUtils.getColor(context, R.color.normalColor), ToastyUtils.getColor(context, R.color.defaultTextColor), duration, withIcon, true);
    }

    public static Toast warning(Context context, int message) {
        return warning(context, (CharSequence) context.getString(message), 0, true);
    }

    public static Toast warning(Context context, CharSequence message) {
        return warning(context, message, 0, true);
    }

    public static Toast warning(Context context, int message, int duration) {
        return warning(context, (CharSequence) context.getString(message), duration, true);
    }

    public static Toast warning(Context context, CharSequence message, int duration) {
        return warning(context, message, duration, true);
    }

    public static Toast warning(Context context, int message, int duration, boolean withIcon) {
        return custom(context, (CharSequence) context.getString(message), ToastyUtils.getDrawable(context, R.drawable.ic_error_outline_white_24dp), ToastyUtils.getColor(context, R.color.warningColor), ToastyUtils.getColor(context, R.color.defaultTextColor), duration, withIcon, true);
    }

    public static Toast warning(Context context, CharSequence message, int duration, boolean withIcon) {
        return custom(context, message, ToastyUtils.getDrawable(context, R.drawable.ic_error_outline_white_24dp), ToastyUtils.getColor(context, R.color.warningColor), ToastyUtils.getColor(context, R.color.defaultTextColor), duration, withIcon, true);
    }

    public static Toast info(Context context, int message) {
        return info(context, (CharSequence) context.getString(message), 0, true);
    }

    public static Toast info(Context context, CharSequence message) {
        return info(context, message, 0, true);
    }

    public static Toast info(Context context, int message, int duration) {
        return info(context, (CharSequence) context.getString(message), duration, true);
    }

    public static Toast info(Context context, CharSequence message, int duration) {
        return info(context, message, duration, true);
    }

    public static Toast info(Context context, int message, int duration, boolean withIcon) {
        return custom(context, (CharSequence) context.getString(message), ToastyUtils.getDrawable(context, R.drawable.ic_info_outline_white_24dp), ToastyUtils.getColor(context, R.color.infoColor), ToastyUtils.getColor(context, R.color.defaultTextColor), duration, withIcon, true);
    }

    public static Toast info(Context context, CharSequence message, int duration, boolean withIcon) {
        return custom(context, message, ToastyUtils.getDrawable(context, R.drawable.ic_info_outline_white_24dp), ToastyUtils.getColor(context, R.color.infoColor), ToastyUtils.getColor(context, R.color.defaultTextColor), duration, withIcon, true);
    }

    public static Toast success(Context context, int message) {
        return success(context, (CharSequence) context.getString(message), 0, true);
    }

    public static Toast success(Context context, CharSequence message) {
        return success(context, message, 0, true);
    }

    public static Toast success(Context context, int message, int duration) {
        return success(context, (CharSequence) context.getString(message), duration, true);
    }

    public static Toast success(Context context, CharSequence message, int duration) {
        return success(context, message, duration, true);
    }

    public static Toast success(Context context, int message, int duration, boolean withIcon) {
        return custom(context, (CharSequence) context.getString(message), ToastyUtils.getDrawable(context, R.drawable.ic_check_white_24dp), ToastyUtils.getColor(context, R.color.successColor), ToastyUtils.getColor(context, R.color.defaultTextColor), duration, withIcon, true);
    }

    public static Toast success(Context context, CharSequence message, int duration, boolean withIcon) {
        return custom(context, message, ToastyUtils.getDrawable(context, R.drawable.ic_check_white_24dp), ToastyUtils.getColor(context, R.color.successColor), ToastyUtils.getColor(context, R.color.defaultTextColor), duration, withIcon, true);
    }

    public static Toast error(Context context, int message) {
        return error(context, (CharSequence) context.getString(message), 0, true);
    }

    public static Toast error(Context context, CharSequence message) {
        return error(context, message, 0, true);
    }

    public static Toast error(Context context, int message, int duration) {
        return error(context, (CharSequence) context.getString(message), duration, true);
    }

    public static Toast error(Context context, CharSequence message, int duration) {
        return error(context, message, duration, true);
    }

    public static Toast error(Context context, int message, int duration, boolean withIcon) {
        return custom(context, (CharSequence) context.getString(message), ToastyUtils.getDrawable(context, R.drawable.ic_clear_white_24dp), ToastyUtils.getColor(context, R.color.errorColor), ToastyUtils.getColor(context, R.color.defaultTextColor), duration, withIcon, true);
    }

    public static Toast error(Context context, CharSequence message, int duration, boolean withIcon) {
        return custom(context, message, ToastyUtils.getDrawable(context, R.drawable.ic_clear_white_24dp), ToastyUtils.getColor(context, R.color.errorColor), ToastyUtils.getColor(context, R.color.defaultTextColor), duration, withIcon, true);
    }

    public static Toast custom(Context context, int message, Drawable icon, int duration, boolean withIcon) {
        return custom(context, (CharSequence) context.getString(message), icon, -1, ToastyUtils.getColor(context, R.color.defaultTextColor), duration, withIcon, false);
    }

    public static Toast custom(Context context, CharSequence message, Drawable icon, int duration, boolean withIcon) {
        return custom(context, message, icon, -1, ToastyUtils.getColor(context, R.color.defaultTextColor), duration, withIcon, false);
    }

    public static Toast custom(Context context, int message, int iconRes, int tintColorRes, int duration, boolean withIcon, boolean shouldTint) {
        return custom(context, context.getString(message), ToastyUtils.getDrawable(context, iconRes), ToastyUtils.getColor(context, tintColorRes), ToastyUtils.getColor(context, R.color.defaultTextColor), duration, withIcon, shouldTint);
    }

    public static Toast custom(Context context, CharSequence message, int iconRes, int tintColorRes, int duration, boolean withIcon, boolean shouldTint) {
        return custom(context, message, ToastyUtils.getDrawable(context, iconRes), ToastyUtils.getColor(context, tintColorRes), ToastyUtils.getColor(context, R.color.defaultTextColor), duration, withIcon, shouldTint);
    }

    public static Toast custom(Context context, int message, Drawable icon, int tintColorRes, int duration, boolean withIcon, boolean shouldTint) {
        return custom(context, context.getString(message), icon, ToastyUtils.getColor(context, tintColorRes), ToastyUtils.getColor(context, R.color.defaultTextColor), duration, withIcon, shouldTint);
    }

    public static Toast custom(Context context, int message, Drawable icon, int tintColorRes, int textColorRes, int duration, boolean withIcon, boolean shouldTint) {
        return custom(context, context.getString(message), icon, ToastyUtils.getColor(context, tintColorRes), ToastyUtils.getColor(context, textColorRes), duration, withIcon, shouldTint);
    }

    public static Toast custom(Context context, CharSequence message, Drawable icon, int tintColor, int textColor, int duration, boolean withIcon, boolean shouldTint) {
        Drawable drawableFrame;
        Toast currentToast = Toast.makeText(context, "", duration);
        View toastLayout = ((LayoutInflater) context.getSystemService("layout_inflater")).inflate(R.layout.toast_layout, (ViewGroup) null);
        ImageView toastIcon = (ImageView) toastLayout.findViewById(R.id.toast_icon);
        TextView toastTextView = (TextView) toastLayout.findViewById(R.id.toast_text);
        if (shouldTint) {
            drawableFrame = ToastyUtils.tint9PatchDrawableFrame(context, tintColor);
        } else {
            drawableFrame = ToastyUtils.getDrawable(context, R.drawable.toast_frame);
        }
        ToastyUtils.setBackground(toastLayout, drawableFrame);
        if (withIcon) {
            if (icon == null) {
                throw new IllegalArgumentException("Avoid passing 'icon' as null if 'withIcon' is set to true");
            }
            ToastyUtils.setBackground(toastIcon, tintIcon ? ToastyUtils.tintIcon(icon, textColor) : icon);
        } else {
            toastIcon.setVisibility(8);
        }
        toastTextView.setText(message);
        toastTextView.setTextColor(textColor);
        toastTextView.setTypeface(currentTypeface);
        toastTextView.setTextSize(2, textSize);
        currentToast.setView(toastLayout);
        if (!allowQueue) {
            Toast toast = lastToast;
            if (toast != null) {
                toast.cancel();
            }
            lastToast = currentToast;
        }
        return currentToast;
    }

    public static class Config {
        private Typeface typeface = Toasty.currentTypeface;
        private int textSize = Toasty.textSize;
        private boolean tintIcon = Toasty.tintIcon;
        private boolean allowQueue = true;

        private Config() {
        }

        public static Config getInstance() {
            return new Config();
        }

        public static void reset() {
            Typeface unused = Toasty.currentTypeface = Toasty.LOADED_TOAST_TYPEFACE;
            int unused2 = Toasty.textSize = 16;
            boolean unused3 = Toasty.tintIcon = true;
            boolean unused4 = Toasty.allowQueue = true;
        }

        public Config setToastTypeface(Typeface typeface) {
            this.typeface = typeface;
            return this;
        }

        public Config setTextSize(int sizeInSp) {
            this.textSize = sizeInSp;
            return this;
        }

        public Config tintIcon(boolean tintIcon) {
            this.tintIcon = tintIcon;
            return this;
        }

        public Config allowQueue(boolean allowQueue) {
            this.allowQueue = allowQueue;
            return this;
        }

        public void apply() {
            Typeface unused = Toasty.currentTypeface = this.typeface;
            int unused2 = Toasty.textSize = this.textSize;
            boolean unused3 = Toasty.tintIcon = this.tintIcon;
            boolean unused4 = Toasty.allowQueue = this.allowQueue;
        }
    }
}
