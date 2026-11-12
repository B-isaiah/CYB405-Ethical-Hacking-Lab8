package fr.castorflex.android.smoothprogressbar;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.widget.ProgressBar;

/* JADX INFO: loaded from: classes.dex */
public class SmoothProgressBar extends ProgressBar {
    private static final int INTERPOLATOR_ACCELERATE = 0;
    private static final int INTERPOLATOR_ACCELERATEDECELERATE = 2;
    private static final int INTERPOLATOR_DECELERATE = 3;
    private static final int INTERPOLATOR_LINEAR = 1;

    public SmoothProgressBar(Context context) {
        this(context, null);
    }

    public SmoothProgressBar(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.spbStyle);
    }

    public SmoothProgressBar(Context context, AttributeSet attrs, int defStyle) {
        Drawable backgroundDrawable;
        int color;
        super(context, attrs, defStyle);
        if (isInEditMode()) {
            setIndeterminateDrawable(new SmoothProgressDrawable.Builder(context, true).build());
            return;
        }
        Resources res = context.getResources();
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.SmoothProgressBar, defStyle, 0);
        int color2 = a.getColor(R.styleable.SmoothProgressBar_spb_color, res.getColor(R.color.spb_default_color));
        int sectionsCount = a.getInteger(R.styleable.SmoothProgressBar_spb_sections_count, res.getInteger(R.integer.spb_default_sections_count));
        int separatorLength = a.getDimensionPixelSize(R.styleable.SmoothProgressBar_spb_stroke_separator_length, res.getDimensionPixelSize(R.dimen.spb_default_stroke_separator_length));
        float strokeWidth = a.getDimension(R.styleable.SmoothProgressBar_spb_stroke_width, res.getDimension(R.dimen.spb_default_stroke_width));
        float speed = a.getFloat(R.styleable.SmoothProgressBar_spb_speed, Float.parseFloat(res.getString(R.string.spb_default_speed)));
        float speedProgressiveStart = a.getFloat(R.styleable.SmoothProgressBar_spb_progressiveStart_speed, speed);
        float speedProgressiveStop = a.getFloat(R.styleable.SmoothProgressBar_spb_progressiveStop_speed, speed);
        int iInterpolator = a.getInteger(R.styleable.SmoothProgressBar_spb_interpolator, -1);
        boolean reversed = a.getBoolean(R.styleable.SmoothProgressBar_spb_reversed, res.getBoolean(R.bool.spb_default_reversed));
        boolean mirrorMode = a.getBoolean(R.styleable.SmoothProgressBar_spb_mirror_mode, res.getBoolean(R.bool.spb_default_mirror_mode));
        int colorsId = a.getResourceId(R.styleable.SmoothProgressBar_spb_colors, 0);
        boolean progressiveStartActivated = a.getBoolean(R.styleable.SmoothProgressBar_spb_progressiveStart_activated, res.getBoolean(R.bool.spb_default_progressiveStart_activated));
        Drawable backgroundDrawable2 = a.getDrawable(R.styleable.SmoothProgressBar_spb_background);
        boolean generateBackgroundWithColors = a.getBoolean(R.styleable.SmoothProgressBar_spb_generate_background_with_colors, false);
        boolean gradients = a.getBoolean(R.styleable.SmoothProgressBar_spb_gradients, false);
        a.recycle();
        Interpolator interpolator = iInterpolator == -1 ? getInterpolator() : null;
        if (interpolator == null) {
            if (iInterpolator == 1) {
                interpolator = new LinearInterpolator();
            } else if (iInterpolator == 2) {
                interpolator = new AccelerateDecelerateInterpolator();
            } else if (iInterpolator == 3) {
                interpolator = new DecelerateInterpolator();
            } else {
                interpolator = new AccelerateInterpolator();
            }
        }
        int[] colors = colorsId != 0 ? res.getIntArray(colorsId) : null;
        SmoothProgressDrawable.Builder builder = new SmoothProgressDrawable.Builder(context).speed(speed).progressiveStartSpeed(speedProgressiveStart).progressiveStopSpeed(speedProgressiveStop).interpolator(interpolator).sectionsCount(sectionsCount).separatorLength(separatorLength).strokeWidth(strokeWidth).reversed(reversed).mirrorMode(mirrorMode).progressiveStart(progressiveStartActivated).gradients(gradients);
        if (backgroundDrawable2 != null) {
            backgroundDrawable = backgroundDrawable2;
            builder.backgroundDrawable(backgroundDrawable);
        } else {
            backgroundDrawable = backgroundDrawable2;
        }
        if (generateBackgroundWithColors) {
            builder.generateBackgroundUsingColors();
        }
        if (colors != null && colors.length > 0) {
            builder.colors(colors);
            color = color2;
        } else {
            color = color2;
            builder.color(color);
        }
        SmoothProgressDrawable d = builder.build();
        setIndeterminateDrawable(d);
    }

    public void applyStyle(int styleResId) {
        Interpolator interpolator;
        int colorsId;
        int[] colors;
        TypedArray a = getContext().obtainStyledAttributes(null, R.styleable.SmoothProgressBar, 0, styleResId);
        if (a.hasValue(R.styleable.SmoothProgressBar_spb_color)) {
            setSmoothProgressDrawableColor(a.getColor(R.styleable.SmoothProgressBar_spb_color, 0));
        }
        if (a.hasValue(R.styleable.SmoothProgressBar_spb_colors) && (colorsId = a.getResourceId(R.styleable.SmoothProgressBar_spb_colors, 0)) != 0 && (colors = getResources().getIntArray(colorsId)) != null && colors.length > 0) {
            setSmoothProgressDrawableColors(colors);
        }
        if (a.hasValue(R.styleable.SmoothProgressBar_spb_sections_count)) {
            setSmoothProgressDrawableSectionsCount(a.getInteger(R.styleable.SmoothProgressBar_spb_sections_count, 0));
        }
        if (a.hasValue(R.styleable.SmoothProgressBar_spb_stroke_separator_length)) {
            setSmoothProgressDrawableSeparatorLength(a.getDimensionPixelSize(R.styleable.SmoothProgressBar_spb_stroke_separator_length, 0));
        }
        if (a.hasValue(R.styleable.SmoothProgressBar_spb_stroke_width)) {
            setSmoothProgressDrawableStrokeWidth(a.getDimension(R.styleable.SmoothProgressBar_spb_stroke_width, 0.0f));
        }
        if (a.hasValue(R.styleable.SmoothProgressBar_spb_speed)) {
            setSmoothProgressDrawableSpeed(a.getFloat(R.styleable.SmoothProgressBar_spb_speed, 0.0f));
        }
        if (a.hasValue(R.styleable.SmoothProgressBar_spb_progressiveStart_speed)) {
            setSmoothProgressDrawableProgressiveStartSpeed(a.getFloat(R.styleable.SmoothProgressBar_spb_progressiveStart_speed, 0.0f));
        }
        if (a.hasValue(R.styleable.SmoothProgressBar_spb_progressiveStop_speed)) {
            setSmoothProgressDrawableProgressiveStopSpeed(a.getFloat(R.styleable.SmoothProgressBar_spb_progressiveStop_speed, 0.0f));
        }
        if (a.hasValue(R.styleable.SmoothProgressBar_spb_reversed)) {
            setSmoothProgressDrawableReversed(a.getBoolean(R.styleable.SmoothProgressBar_spb_reversed, false));
        }
        if (a.hasValue(R.styleable.SmoothProgressBar_spb_mirror_mode)) {
            setSmoothProgressDrawableMirrorMode(a.getBoolean(R.styleable.SmoothProgressBar_spb_mirror_mode, false));
        }
        if (a.hasValue(R.styleable.SmoothProgressBar_spb_progressiveStart_activated)) {
            setProgressiveStartActivated(a.getBoolean(R.styleable.SmoothProgressBar_spb_progressiveStart_activated, false));
        }
        if (a.hasValue(R.styleable.SmoothProgressBar_spb_progressiveStart_activated)) {
            setProgressiveStartActivated(a.getBoolean(R.styleable.SmoothProgressBar_spb_progressiveStart_activated, false));
        }
        if (a.hasValue(R.styleable.SmoothProgressBar_spb_gradients)) {
            setSmoothProgressDrawableUseGradients(a.getBoolean(R.styleable.SmoothProgressBar_spb_gradients, false));
        }
        if (a.hasValue(R.styleable.SmoothProgressBar_spb_generate_background_with_colors) && a.getBoolean(R.styleable.SmoothProgressBar_spb_generate_background_with_colors, false)) {
            setSmoothProgressDrawableBackgroundDrawable(SmoothProgressBarUtils.generateDrawableWithColors(checkIndeterminateDrawable().getColors(), checkIndeterminateDrawable().getStrokeWidth()));
        }
        if (a.hasValue(R.styleable.SmoothProgressBar_spb_interpolator)) {
            int iInterpolator = a.getInteger(R.styleable.SmoothProgressBar_spb_interpolator, -1);
            if (iInterpolator == 0) {
                interpolator = new AccelerateInterpolator();
            } else if (iInterpolator == 1) {
                interpolator = new LinearInterpolator();
            } else if (iInterpolator == 2) {
                interpolator = new AccelerateDecelerateInterpolator();
            } else if (iInterpolator == 3) {
                interpolator = new DecelerateInterpolator();
            } else {
                interpolator = null;
            }
            if (interpolator != null) {
                setInterpolator(interpolator);
            }
        }
        a.recycle();
    }

    @Override // android.widget.ProgressBar, android.view.View
    protected synchronized void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (isIndeterminate() && (getIndeterminateDrawable() instanceof SmoothProgressDrawable) && !((SmoothProgressDrawable) getIndeterminateDrawable()).isRunning()) {
            getIndeterminateDrawable().draw(canvas);
        }
    }

    private SmoothProgressDrawable checkIndeterminateDrawable() {
        Drawable ret = getIndeterminateDrawable();
        if (ret == null || !(ret instanceof SmoothProgressDrawable)) {
            throw new RuntimeException("The drawable is not a SmoothProgressDrawable");
        }
        return (SmoothProgressDrawable) ret;
    }

    @Override // android.widget.ProgressBar
    public void setInterpolator(Interpolator interpolator) {
        super.setInterpolator(interpolator);
        Drawable ret = getIndeterminateDrawable();
        if (ret != null && (ret instanceof SmoothProgressDrawable)) {
            ((SmoothProgressDrawable) ret).setInterpolator(interpolator);
        }
    }

    public void setSmoothProgressDrawableInterpolator(Interpolator interpolator) {
        checkIndeterminateDrawable().setInterpolator(interpolator);
    }

    public void setSmoothProgressDrawableColors(int[] colors) {
        checkIndeterminateDrawable().setColors(colors);
    }

    public void setSmoothProgressDrawableColor(int color) {
        checkIndeterminateDrawable().setColor(color);
    }

    public void setSmoothProgressDrawableSpeed(float speed) {
        checkIndeterminateDrawable().setSpeed(speed);
    }

    public void setSmoothProgressDrawableProgressiveStartSpeed(float speed) {
        checkIndeterminateDrawable().setProgressiveStartSpeed(speed);
    }

    public void setSmoothProgressDrawableProgressiveStopSpeed(float speed) {
        checkIndeterminateDrawable().setProgressiveStopSpeed(speed);
    }

    public void setSmoothProgressDrawableSectionsCount(int sectionsCount) {
        checkIndeterminateDrawable().setSectionsCount(sectionsCount);
    }

    public void setSmoothProgressDrawableSeparatorLength(int separatorLength) {
        checkIndeterminateDrawable().setSeparatorLength(separatorLength);
    }

    public void setSmoothProgressDrawableStrokeWidth(float strokeWidth) {
        checkIndeterminateDrawable().setStrokeWidth(strokeWidth);
    }

    public void setSmoothProgressDrawableReversed(boolean reversed) {
        checkIndeterminateDrawable().setReversed(reversed);
    }

    public void setSmoothProgressDrawableMirrorMode(boolean mirrorMode) {
        checkIndeterminateDrawable().setMirrorMode(mirrorMode);
    }

    public void setProgressiveStartActivated(boolean progressiveStartActivated) {
        checkIndeterminateDrawable().setProgressiveStartActivated(progressiveStartActivated);
    }

    public void setSmoothProgressDrawableCallbacks(SmoothProgressDrawable.Callbacks listener) {
        checkIndeterminateDrawable().setCallbacks(listener);
    }

    public void setSmoothProgressDrawableBackgroundDrawable(Drawable drawable) {
        checkIndeterminateDrawable().setBackgroundDrawable(drawable);
    }

    public void setSmoothProgressDrawableUseGradients(boolean useGradients) {
        checkIndeterminateDrawable().setUseGradients(useGradients);
    }

    public void progressiveStart() {
        checkIndeterminateDrawable().progressiveStart();
    }

    public void progressiveStop() {
        checkIndeterminateDrawable().progressiveStop();
    }
}
