package fr.castorflex.android.smoothprogressbar;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.Interpolator;

/* JADX INFO: loaded from: classes.dex */
public class SmoothProgressDrawable extends Drawable implements Animatable {
    private static final long FRAME_DURATION = 16;
    private static final float OFFSET_PER_FRAME = 0.01f;
    private final Rect fBackgroundRect;
    private Drawable mBackgroundDrawable;
    private Rect mBounds;
    private Callbacks mCallbacks;
    private int[] mColors;
    private int mColorsIndex;
    private float mCurrentOffset;
    private int mCurrentSections;
    private boolean mFinishing;
    private float mFinishingOffset;
    private Interpolator mInterpolator;
    private int[] mLinearGradientColors;
    private float[] mLinearGradientPositions;
    private float mMaxOffset;
    private boolean mMirrorMode;
    private boolean mNewTurn;
    private Paint mPaint;
    private boolean mProgressiveStartActivated;
    private float mProgressiveStartSpeed;
    private float mProgressiveStopSpeed;
    private boolean mReversed;
    private boolean mRunning;
    private int mSectionsCount;
    private int mSeparatorLength;
    private float mSpeed;
    private int mStartSection;
    private float mStrokeWidth;
    private final Runnable mUpdater;
    private boolean mUseGradients;

    public interface Callbacks {
        void onStart();

        void onStop();
    }

    private SmoothProgressDrawable(Interpolator interpolator, int sectionsCount, int separatorLength, int[] colors, float strokeWidth, float speed, float progressiveStartSpeed, float progressiveStopSpeed, boolean reversed, boolean mirrorMode, Callbacks callbacks, boolean progressiveStartActivated, Drawable backgroundDrawable, boolean useGradients) {
        this.fBackgroundRect = new Rect();
        this.mUpdater = new Runnable() { // from class: fr.castorflex.android.smoothprogressbar.SmoothProgressDrawable.1
            @Override // java.lang.Runnable
            public void run() {
                if (SmoothProgressDrawable.this.isFinishing()) {
                    SmoothProgressDrawable.this.mFinishingOffset += SmoothProgressDrawable.this.mProgressiveStopSpeed * SmoothProgressDrawable.OFFSET_PER_FRAME;
                    SmoothProgressDrawable.this.mCurrentOffset += SmoothProgressDrawable.this.mProgressiveStopSpeed * SmoothProgressDrawable.OFFSET_PER_FRAME;
                    if (SmoothProgressDrawable.this.mFinishingOffset >= 1.0f) {
                        SmoothProgressDrawable.this.stop();
                    }
                } else if (SmoothProgressDrawable.this.isStarting()) {
                    SmoothProgressDrawable.this.mCurrentOffset += SmoothProgressDrawable.this.mProgressiveStartSpeed * SmoothProgressDrawable.OFFSET_PER_FRAME;
                } else {
                    SmoothProgressDrawable.this.mCurrentOffset += SmoothProgressDrawable.this.mSpeed * SmoothProgressDrawable.OFFSET_PER_FRAME;
                }
                if (SmoothProgressDrawable.this.mCurrentOffset >= SmoothProgressDrawable.this.mMaxOffset) {
                    SmoothProgressDrawable.this.mNewTurn = true;
                    SmoothProgressDrawable.this.mCurrentOffset -= SmoothProgressDrawable.this.mMaxOffset;
                }
                if (SmoothProgressDrawable.this.isRunning()) {
                    SmoothProgressDrawable smoothProgressDrawable = SmoothProgressDrawable.this;
                    smoothProgressDrawable.scheduleSelf(smoothProgressDrawable.mUpdater, SystemClock.uptimeMillis() + SmoothProgressDrawable.FRAME_DURATION);
                }
                SmoothProgressDrawable.this.invalidateSelf();
            }
        };
        this.mRunning = false;
        this.mInterpolator = interpolator;
        this.mSectionsCount = sectionsCount;
        this.mStartSection = 0;
        this.mCurrentSections = sectionsCount;
        this.mSeparatorLength = separatorLength;
        this.mSpeed = speed;
        this.mProgressiveStartSpeed = progressiveStartSpeed;
        this.mProgressiveStopSpeed = progressiveStopSpeed;
        this.mReversed = reversed;
        this.mColors = colors;
        this.mColorsIndex = 0;
        this.mMirrorMode = mirrorMode;
        this.mFinishing = false;
        this.mBackgroundDrawable = backgroundDrawable;
        this.mStrokeWidth = strokeWidth;
        this.mMaxOffset = 1.0f / sectionsCount;
        Paint paint = new Paint();
        this.mPaint = paint;
        paint.setStrokeWidth(strokeWidth);
        this.mPaint.setStyle(Paint.Style.STROKE);
        this.mPaint.setDither(false);
        this.mPaint.setAntiAlias(false);
        this.mProgressiveStartActivated = progressiveStartActivated;
        this.mCallbacks = callbacks;
        this.mUseGradients = useGradients;
        refreshLinearGradientOptions();
    }

    public void setInterpolator(Interpolator interpolator) {
        if (interpolator == null) {
            throw new IllegalArgumentException("Interpolator cannot be null");
        }
        this.mInterpolator = interpolator;
        invalidateSelf();
    }

    public void setColors(int[] colors) {
        if (colors == null || colors.length == 0) {
            throw new IllegalArgumentException("Colors cannot be null or empty");
        }
        this.mColorsIndex = 0;
        this.mColors = colors;
        refreshLinearGradientOptions();
        invalidateSelf();
    }

    public void setColor(int color) {
        setColors(new int[]{color});
    }

    public void setSpeed(float speed) {
        if (speed < 0.0f) {
            throw new IllegalArgumentException("Speed must be >= 0");
        }
        this.mSpeed = speed;
        invalidateSelf();
    }

    public void setProgressiveStartSpeed(float speed) {
        if (speed < 0.0f) {
            throw new IllegalArgumentException("SpeedProgressiveStart must be >= 0");
        }
        this.mProgressiveStartSpeed = speed;
        invalidateSelf();
    }

    public void setProgressiveStopSpeed(float speed) {
        if (speed < 0.0f) {
            throw new IllegalArgumentException("SpeedProgressiveStop must be >= 0");
        }
        this.mProgressiveStopSpeed = speed;
        invalidateSelf();
    }

    public void setSectionsCount(int sectionsCount) {
        if (sectionsCount <= 0) {
            throw new IllegalArgumentException("SectionsCount must be > 0");
        }
        this.mSectionsCount = sectionsCount;
        float f = 1.0f / sectionsCount;
        this.mMaxOffset = f;
        this.mCurrentOffset %= f;
        refreshLinearGradientOptions();
        invalidateSelf();
    }

    public void setSeparatorLength(int separatorLength) {
        if (separatorLength < 0) {
            throw new IllegalArgumentException("SeparatorLength must be >= 0");
        }
        this.mSeparatorLength = separatorLength;
        invalidateSelf();
    }

    public void setStrokeWidth(float strokeWidth) {
        if (strokeWidth < 0.0f) {
            throw new IllegalArgumentException("The strokeWidth must be >= 0");
        }
        this.mPaint.setStrokeWidth(strokeWidth);
        invalidateSelf();
    }

    public void setReversed(boolean reversed) {
        if (this.mReversed == reversed) {
            return;
        }
        this.mReversed = reversed;
        invalidateSelf();
    }

    public void setMirrorMode(boolean mirrorMode) {
        if (this.mMirrorMode == mirrorMode) {
            return;
        }
        this.mMirrorMode = mirrorMode;
        invalidateSelf();
    }

    public void setBackgroundDrawable(Drawable backgroundDrawable) {
        if (this.mBackgroundDrawable == backgroundDrawable) {
            return;
        }
        this.mBackgroundDrawable = backgroundDrawable;
        invalidateSelf();
    }

    public Drawable getBackgroundDrawable() {
        return this.mBackgroundDrawable;
    }

    public int[] getColors() {
        return this.mColors;
    }

    public float getStrokeWidth() {
        return this.mStrokeWidth;
    }

    public void setProgressiveStartActivated(boolean progressiveStartActivated) {
        this.mProgressiveStartActivated = progressiveStartActivated;
    }

    public void setUseGradients(boolean useGradients) {
        if (this.mUseGradients == useGradients) {
            return;
        }
        this.mUseGradients = useGradients;
        refreshLinearGradientOptions();
        invalidateSelf();
    }

    protected void refreshLinearGradientOptions() {
        if (this.mUseGradients) {
            int i = this.mSectionsCount;
            this.mLinearGradientColors = new int[i + 2];
            this.mLinearGradientPositions = new float[i + 2];
        } else {
            this.mPaint.setShader(null);
            this.mLinearGradientColors = null;
            this.mLinearGradientPositions = null;
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        this.mBounds = bounds;
        canvas.clipRect(bounds);
        if (this.mNewTurn) {
            this.mColorsIndex = decrementColor(this.mColorsIndex);
            this.mNewTurn = false;
            if (isFinishing()) {
                int i = this.mStartSection + 1;
                this.mStartSection = i;
                if (i > this.mSectionsCount) {
                    stop();
                    return;
                }
            }
            int i2 = this.mCurrentSections;
            if (i2 < this.mSectionsCount) {
                this.mCurrentSections = i2 + 1;
            }
        }
        if (this.mUseGradients) {
            drawGradient(canvas);
        }
        drawStrokes(canvas);
    }

    private void drawGradient(Canvas canvas) {
        float xSectionWidth = 1.0f / this.mSectionsCount;
        int currentIndexColor = this.mColorsIndex;
        float[] fArr = this.mLinearGradientPositions;
        fArr[0] = 0.0f;
        fArr[fArr.length - 1] = 1.0f;
        int firstColorIndex = currentIndexColor - 1;
        if (firstColorIndex < 0) {
            firstColorIndex += this.mColors.length;
        }
        this.mLinearGradientColors[0] = this.mColors[firstColorIndex];
        for (int i = 0; i < this.mSectionsCount; i++) {
            float position = this.mInterpolator.getInterpolation((i * xSectionWidth) + this.mCurrentOffset);
            this.mLinearGradientPositions[i + 1] = position;
            int[] iArr = this.mColors;
            this.mLinearGradientColors[i + 1] = iArr[currentIndexColor];
            currentIndexColor = (currentIndexColor + 1) % iArr.length;
        }
        int[] iArr2 = this.mLinearGradientColors;
        iArr2[iArr2.length - 1] = this.mColors[currentIndexColor];
        int iAbs = (this.mReversed && this.mMirrorMode) ? Math.abs(this.mBounds.left - this.mBounds.right) / 2 : this.mBounds.left;
        float left = iAbs;
        float right = this.mMirrorMode ? this.mReversed ? this.mBounds.left : Math.abs(this.mBounds.left - this.mBounds.right) / 2 : this.mBounds.right;
        float top = this.mBounds.centerY() - (this.mStrokeWidth / 2.0f);
        float bottom = this.mBounds.centerY() + (this.mStrokeWidth / 2.0f);
        LinearGradient linearGradient = new LinearGradient(left, top, right, bottom, this.mLinearGradientColors, this.mLinearGradientPositions, this.mMirrorMode ? Shader.TileMode.MIRROR : Shader.TileMode.CLAMP);
        this.mPaint.setShader(linearGradient);
    }

    /* JADX WARN: Code duplicated, block: B:35:0x012a  */
    /* JADX WARN: Code duplicated, block: B:36:0x012e  */
    private void drawStrokes(Canvas canvas) {
        float spaceLength;
        float end;
        float prevValue;
        int boundsWidth;
        int width;
        int currentIndexColor;
        float sectionWidth;
        float lastX;
        int width2;
        float f = 0.0f;
        float f2 = 1.0f;
        if (this.mReversed) {
            canvas.translate(this.mBounds.width(), 0.0f);
            canvas.scale(-1.0f, 1.0f);
        }
        int boundsWidth2 = this.mBounds.width();
        if (this.mMirrorMode) {
            boundsWidth2 /= 2;
        }
        int boundsWidth3 = boundsWidth2;
        int i = this.mSeparatorLength + boundsWidth3 + this.mSectionsCount;
        int centerY = this.mBounds.centerY();
        int i2 = this.mSectionsCount;
        float xSectionWidth = 1.0f / i2;
        float firstX = 0.0f;
        int currentIndexColor2 = this.mColorsIndex;
        int i3 = this.mStartSection;
        int i4 = this.mCurrentSections;
        if (i3 == i4 && i4 == i2) {
            firstX = canvas.getWidth();
        }
        float prevValue2 = 0.0f;
        int i5 = 0;
        float firstX2 = firstX;
        float lastX2 = 0.0f;
        int currentIndexColor3 = currentIndexColor2;
        while (i5 <= this.mCurrentSections) {
            float xOffset = (i5 * xSectionWidth) + this.mCurrentOffset;
            float prev = Math.max(f, xOffset - xSectionWidth);
            int currentIndexColor4 = currentIndexColor3;
            float ratioSectionWidth = Math.abs(this.mInterpolator.getInterpolation(prev) - this.mInterpolator.getInterpolation(Math.min(xOffset, f2)));
            float sectionWidth2 = (int) (i * ratioSectionWidth);
            if (sectionWidth2 + prev < i) {
                spaceLength = Math.min(sectionWidth2, this.mSeparatorLength);
            } else {
                spaceLength = 0.0f;
            }
            float drawLength = sectionWidth2 > spaceLength ? sectionWidth2 - spaceLength : 0.0f;
            float end2 = prevValue2 + drawLength;
            if (end2 > prevValue2 && i5 >= this.mStartSection) {
                float xFinishingOffset = this.mInterpolator.getInterpolation(Math.min(this.mFinishingOffset, 1.0f));
                float startX = Math.max(i * xFinishingOffset, Math.min(boundsWidth3, prevValue2));
                float endX = Math.min(boundsWidth3, end2);
                end = end2;
                currentIndexColor = currentIndexColor4;
                sectionWidth = sectionWidth2;
                lastX = lastX2;
                boundsWidth = boundsWidth3;
                width = i;
                width2 = i5;
                prevValue = prevValue2;
                drawLine(canvas, boundsWidth3, startX, centerY, endX, centerY, currentIndexColor);
                if (width2 == this.mStartSection) {
                    firstX2 = startX - this.mSeparatorLength;
                }
                if (width2 == this.mCurrentSections) {
                    lastX2 = lastX;
                } else {
                    lastX2 = prevValue + sectionWidth;
                }
                prevValue2 = end + spaceLength;
                currentIndexColor3 = incrementColor(currentIndexColor);
                i5 = width2 + 1;
                boundsWidth3 = boundsWidth;
                i = width;
                f = 0.0f;
                f2 = 1.0f;
            } else {
                end = end2;
                prevValue = prevValue2;
                boundsWidth = boundsWidth3;
                width = i;
                currentIndexColor = currentIndexColor4;
                sectionWidth = sectionWidth2;
                lastX = lastX2;
                width2 = i5;
            }
            firstX2 = firstX2;
            if (width2 == this.mCurrentSections) {
                lastX2 = lastX;
            } else {
                lastX2 = prevValue + sectionWidth;
            }
            prevValue2 = end + spaceLength;
            currentIndexColor3 = incrementColor(currentIndexColor);
            i5 = width2 + 1;
            boundsWidth3 = boundsWidth;
            i = width;
            f = 0.0f;
            f2 = 1.0f;
        }
        drawBackgroundIfNeeded(canvas, firstX2, lastX2);
    }

    private void drawLine(Canvas canvas, int canvasWidth, float startX, float startY, float stopX, float stopY, int currentIndexColor) {
        this.mPaint.setColor(this.mColors[currentIndexColor]);
        if (!this.mMirrorMode) {
            canvas.drawLine(startX, startY, stopX, stopY, this.mPaint);
        } else if (this.mReversed) {
            canvas.drawLine(canvasWidth + startX, startY, canvasWidth + stopX, stopY, this.mPaint);
            canvas.drawLine(canvasWidth - startX, startY, canvasWidth - stopX, stopY, this.mPaint);
        } else {
            canvas.drawLine(startX, startY, stopX, stopY, this.mPaint);
            canvas.drawLine((canvasWidth * 2) - startX, startY, (canvasWidth * 2) - stopX, stopY, this.mPaint);
        }
    }

    private void drawBackgroundIfNeeded(Canvas canvas, float firstX, float lastX) {
        if (this.mBackgroundDrawable == null) {
            return;
        }
        this.fBackgroundRect.top = (int) ((canvas.getHeight() - this.mStrokeWidth) / 2.0f);
        this.fBackgroundRect.bottom = (int) ((canvas.getHeight() + this.mStrokeWidth) / 2.0f);
        this.fBackgroundRect.left = 0;
        this.fBackgroundRect.right = this.mMirrorMode ? canvas.getWidth() / 2 : canvas.getWidth();
        this.mBackgroundDrawable.setBounds(this.fBackgroundRect);
        if (!isRunning()) {
            if (this.mMirrorMode) {
                canvas.save();
                canvas.translate(canvas.getWidth() / 2, 0.0f);
                drawBackground(canvas, 0.0f, this.fBackgroundRect.width());
                canvas.scale(-1.0f, 1.0f);
                drawBackground(canvas, 0.0f, this.fBackgroundRect.width());
                canvas.restore();
                return;
            }
            drawBackground(canvas, 0.0f, this.fBackgroundRect.width());
            return;
        }
        if (isFinishing() || isStarting()) {
            if (firstX > lastX) {
                firstX = lastX;
                lastX = firstX;
            }
            if (firstX > 0.0f) {
                if (this.mMirrorMode) {
                    canvas.save();
                    canvas.translate(canvas.getWidth() / 2, 0.0f);
                    if (this.mReversed) {
                        drawBackground(canvas, 0.0f, firstX);
                        canvas.scale(-1.0f, 1.0f);
                        drawBackground(canvas, 0.0f, firstX);
                    } else {
                        drawBackground(canvas, (canvas.getWidth() / 2) - firstX, canvas.getWidth() / 2);
                        canvas.scale(-1.0f, 1.0f);
                        drawBackground(canvas, (canvas.getWidth() / 2) - firstX, canvas.getWidth() / 2);
                    }
                    canvas.restore();
                } else {
                    drawBackground(canvas, 0.0f, firstX);
                }
            }
            if (lastX <= canvas.getWidth()) {
                if (this.mMirrorMode) {
                    canvas.save();
                    canvas.translate(canvas.getWidth() / 2, 0.0f);
                    if (this.mReversed) {
                        drawBackground(canvas, lastX, canvas.getWidth() / 2);
                        canvas.scale(-1.0f, 1.0f);
                        drawBackground(canvas, lastX, canvas.getWidth() / 2);
                    } else {
                        drawBackground(canvas, 0.0f, (canvas.getWidth() / 2) - lastX);
                        canvas.scale(-1.0f, 1.0f);
                        drawBackground(canvas, 0.0f, (canvas.getWidth() / 2) - lastX);
                    }
                    canvas.restore();
                    return;
                }
                drawBackground(canvas, lastX, canvas.getWidth());
            }
        }
    }

    private void drawBackground(Canvas canvas, float fromX, float toX) {
        int count = canvas.save();
        canvas.clipRect(fromX, (int) ((canvas.getHeight() - this.mStrokeWidth) / 2.0f), toX, (int) ((canvas.getHeight() + this.mStrokeWidth) / 2.0f));
        this.mBackgroundDrawable.draw(canvas);
        canvas.restoreToCount(count);
    }

    private int incrementColor(int colorIndex) {
        int colorIndex2 = colorIndex + 1;
        if (colorIndex2 >= this.mColors.length) {
            return 0;
        }
        return colorIndex2;
    }

    private int decrementColor(int colorIndex) {
        int colorIndex2 = colorIndex - 1;
        if (colorIndex2 < 0) {
            int colorIndex3 = this.mColors.length - 1;
            return colorIndex3;
        }
        return colorIndex2;
    }

    public void progressiveStart() {
        progressiveStart(0);
    }

    public void progressiveStart(int index) {
        resetProgressiveStart(index);
        start();
    }

    private void resetProgressiveStart(int index) {
        checkColorIndex(index);
        this.mCurrentOffset = 0.0f;
        this.mFinishing = false;
        this.mFinishingOffset = 0.0f;
        this.mStartSection = 0;
        this.mCurrentSections = 0;
        this.mColorsIndex = index;
    }

    public void progressiveStop() {
        this.mFinishing = true;
        this.mStartSection = 0;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mPaint.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.mPaint.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -2;
    }

    @Override // android.graphics.drawable.Animatable
    public void start() {
        if (this.mProgressiveStartActivated) {
            resetProgressiveStart(0);
        }
        if (isRunning()) {
            return;
        }
        Callbacks callbacks = this.mCallbacks;
        if (callbacks != null) {
            callbacks.onStart();
        }
        scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + FRAME_DURATION);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Animatable
    public void stop() {
        if (isRunning()) {
            Callbacks callbacks = this.mCallbacks;
            if (callbacks != null) {
                callbacks.onStop();
            }
            this.mRunning = false;
            unscheduleSelf(this.mUpdater);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void scheduleSelf(Runnable what, long when) {
        this.mRunning = true;
        super.scheduleSelf(what, when);
    }

    @Override // android.graphics.drawable.Animatable
    public boolean isRunning() {
        return this.mRunning;
    }

    public boolean isStarting() {
        return this.mCurrentSections < this.mSectionsCount;
    }

    public boolean isFinishing() {
        return this.mFinishing;
    }

    public void setCallbacks(Callbacks callbacks) {
        this.mCallbacks = callbacks;
    }

    private void checkColorIndex(int index) {
        if (index < 0 || index >= this.mColors.length) {
            throw new IllegalArgumentException(String.format("Index %d not valid", Integer.valueOf(index)));
        }
    }

    public static class Builder {
        private Drawable mBackgroundDrawableWhenHidden;
        private int[] mColors;
        private boolean mGenerateBackgroundUsingColors;
        private boolean mGradients;
        private Interpolator mInterpolator;
        private boolean mMirrorMode;
        private Callbacks mOnProgressiveStopEndedListener;
        private boolean mProgressiveStartActivated;
        private float mProgressiveStartSpeed;
        private float mProgressiveStopSpeed;
        private boolean mReversed;
        private int mSectionsCount;
        private float mSpeed;
        private int mStrokeSeparatorLength;
        private float mStrokeWidth;

        public Builder(Context context) {
            this(context, false);
        }

        public Builder(Context context, boolean editMode) {
            initValues(context, editMode);
        }

        public SmoothProgressDrawable build() {
            if (this.mGenerateBackgroundUsingColors) {
                this.mBackgroundDrawableWhenHidden = SmoothProgressBarUtils.generateDrawableWithColors(this.mColors, this.mStrokeWidth);
            }
            SmoothProgressDrawable ret = new SmoothProgressDrawable(this.mInterpolator, this.mSectionsCount, this.mStrokeSeparatorLength, this.mColors, this.mStrokeWidth, this.mSpeed, this.mProgressiveStartSpeed, this.mProgressiveStopSpeed, this.mReversed, this.mMirrorMode, this.mOnProgressiveStopEndedListener, this.mProgressiveStartActivated, this.mBackgroundDrawableWhenHidden, this.mGradients);
            return ret;
        }

        private void initValues(Context context, boolean editMode) {
            Resources res = context.getResources();
            this.mInterpolator = new AccelerateInterpolator();
            if (!editMode) {
                this.mSectionsCount = res.getInteger(R.integer.spb_default_sections_count);
                this.mSpeed = Float.parseFloat(res.getString(R.string.spb_default_speed));
                this.mReversed = res.getBoolean(R.bool.spb_default_reversed);
                this.mProgressiveStartActivated = res.getBoolean(R.bool.spb_default_progressiveStart_activated);
                this.mColors = new int[]{res.getColor(R.color.spb_default_color)};
                this.mStrokeSeparatorLength = res.getDimensionPixelSize(R.dimen.spb_default_stroke_separator_length);
                this.mStrokeWidth = res.getDimensionPixelOffset(R.dimen.spb_default_stroke_width);
            } else {
                this.mSectionsCount = 4;
                this.mSpeed = 1.0f;
                this.mReversed = false;
                this.mProgressiveStartActivated = false;
                this.mColors = new int[]{-13388315};
                this.mStrokeSeparatorLength = 4;
                this.mStrokeWidth = 4.0f;
            }
            float f = this.mSpeed;
            this.mProgressiveStartSpeed = f;
            this.mProgressiveStopSpeed = f;
            this.mGradients = false;
        }

        public Builder interpolator(Interpolator interpolator) {
            SmoothProgressBarUtils.checkNotNull(interpolator, "Interpolator");
            this.mInterpolator = interpolator;
            return this;
        }

        public Builder sectionsCount(int sectionsCount) {
            SmoothProgressBarUtils.checkPositive(sectionsCount, "Sections count");
            this.mSectionsCount = sectionsCount;
            return this;
        }

        public Builder separatorLength(int separatorLength) {
            SmoothProgressBarUtils.checkPositiveOrZero(separatorLength, "Separator length");
            this.mStrokeSeparatorLength = separatorLength;
            return this;
        }

        public Builder color(int color) {
            this.mColors = new int[]{color};
            return this;
        }

        public Builder colors(int[] colors) {
            SmoothProgressBarUtils.checkColors(colors);
            this.mColors = colors;
            return this;
        }

        public Builder strokeWidth(float width) {
            SmoothProgressBarUtils.checkPositiveOrZero(width, "Width");
            this.mStrokeWidth = width;
            return this;
        }

        public Builder speed(float speed) {
            SmoothProgressBarUtils.checkSpeed(speed);
            this.mSpeed = speed;
            return this;
        }

        public Builder progressiveStartSpeed(float progressiveStartSpeed) {
            SmoothProgressBarUtils.checkSpeed(progressiveStartSpeed);
            this.mProgressiveStartSpeed = progressiveStartSpeed;
            return this;
        }

        public Builder progressiveStopSpeed(float progressiveStopSpeed) {
            SmoothProgressBarUtils.checkSpeed(progressiveStopSpeed);
            this.mProgressiveStopSpeed = progressiveStopSpeed;
            return this;
        }

        public Builder reversed(boolean reversed) {
            this.mReversed = reversed;
            return this;
        }

        public Builder mirrorMode(boolean mirrorMode) {
            this.mMirrorMode = mirrorMode;
            return this;
        }

        public Builder progressiveStart(boolean progressiveStartActivated) {
            this.mProgressiveStartActivated = progressiveStartActivated;
            return this;
        }

        public Builder callbacks(Callbacks onProgressiveStopEndedListener) {
            this.mOnProgressiveStopEndedListener = onProgressiveStopEndedListener;
            return this;
        }

        public Builder backgroundDrawable(Drawable backgroundDrawableWhenHidden) {
            this.mBackgroundDrawableWhenHidden = backgroundDrawableWhenHidden;
            return this;
        }

        public Builder generateBackgroundUsingColors() {
            this.mGenerateBackgroundUsingColors = true;
            return this;
        }

        public Builder gradients() {
            return gradients(true);
        }

        public Builder gradients(boolean useGradients) {
            this.mGradients = useGradients;
            return this;
        }
    }
}
