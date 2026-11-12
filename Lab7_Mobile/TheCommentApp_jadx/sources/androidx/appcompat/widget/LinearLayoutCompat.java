package androidx.appcompat.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.LinearLayout;
import androidx.appcompat.R;
import androidx.constraintlayout.core.widgets.analyzer.BasicMeasure;
import androidx.core.view.GravityCompat;
import androidx.core.view.InputDeviceCompat;
import androidx.core.view.ViewCompat;
import com.google.android.material.badge.BadgeDrawable;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* JADX INFO: loaded from: classes.dex */
public class LinearLayoutCompat extends ViewGroup {
    private static final String ACCESSIBILITY_CLASS_NAME = "androidx.appcompat.widget.LinearLayoutCompat";
    public static final int HORIZONTAL = 0;
    private static final int INDEX_BOTTOM = 2;
    private static final int INDEX_CENTER_VERTICAL = 0;
    private static final int INDEX_FILL = 3;
    private static final int INDEX_TOP = 1;
    public static final int SHOW_DIVIDER_BEGINNING = 1;
    public static final int SHOW_DIVIDER_END = 4;
    public static final int SHOW_DIVIDER_MIDDLE = 2;
    public static final int SHOW_DIVIDER_NONE = 0;
    public static final int VERTICAL = 1;
    private static final int VERTICAL_GRAVITY_COUNT = 4;
    private boolean mBaselineAligned;
    private int mBaselineAlignedChildIndex;
    private int mBaselineChildTop;
    private Drawable mDivider;
    private int mDividerHeight;
    private int mDividerPadding;
    private int mDividerWidth;
    private int mGravity;
    private int[] mMaxAscent;
    private int[] mMaxDescent;
    private int mOrientation;
    private int mShowDividers;
    private int mTotalLength;
    private boolean mUseLargestChild;
    private float mWeightSum;

    @Retention(RetentionPolicy.SOURCE)
    public @interface DividerMode {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface OrientationMode {
    }

    public LinearLayoutCompat(Context context) {
        this(context, null);
    }

    public LinearLayoutCompat(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public LinearLayoutCompat(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mBaselineAligned = true;
        this.mBaselineAlignedChildIndex = -1;
        this.mBaselineChildTop = 0;
        this.mGravity = BadgeDrawable.TOP_START;
        TintTypedArray a = TintTypedArray.obtainStyledAttributes(context, attrs, R.styleable.LinearLayoutCompat, defStyleAttr, 0);
        ViewCompat.saveAttributeDataForStyleable(this, context, R.styleable.LinearLayoutCompat, attrs, a.getWrappedTypeArray(), defStyleAttr, 0);
        int index = a.getInt(R.styleable.LinearLayoutCompat_android_orientation, -1);
        if (index >= 0) {
            setOrientation(index);
        }
        int index2 = a.getInt(R.styleable.LinearLayoutCompat_android_gravity, -1);
        if (index2 >= 0) {
            setGravity(index2);
        }
        boolean baselineAligned = a.getBoolean(R.styleable.LinearLayoutCompat_android_baselineAligned, true);
        if (!baselineAligned) {
            setBaselineAligned(baselineAligned);
        }
        this.mWeightSum = a.getFloat(R.styleable.LinearLayoutCompat_android_weightSum, -1.0f);
        this.mBaselineAlignedChildIndex = a.getInt(R.styleable.LinearLayoutCompat_android_baselineAlignedChildIndex, -1);
        this.mUseLargestChild = a.getBoolean(R.styleable.LinearLayoutCompat_measureWithLargestChild, false);
        setDividerDrawable(a.getDrawable(R.styleable.LinearLayoutCompat_divider));
        this.mShowDividers = a.getInt(R.styleable.LinearLayoutCompat_showDividers, 0);
        this.mDividerPadding = a.getDimensionPixelSize(R.styleable.LinearLayoutCompat_dividerPadding, 0);
        a.recycle();
    }

    public void setShowDividers(int showDividers) {
        if (showDividers != this.mShowDividers) {
            requestLayout();
        }
        this.mShowDividers = showDividers;
    }

    @Override // android.view.ViewGroup
    public boolean shouldDelayChildPressedState() {
        return false;
    }

    public int getShowDividers() {
        return this.mShowDividers;
    }

    public Drawable getDividerDrawable() {
        return this.mDivider;
    }

    public void setDividerDrawable(Drawable divider) {
        if (divider == this.mDivider) {
            return;
        }
        this.mDivider = divider;
        if (divider != null) {
            this.mDividerWidth = divider.getIntrinsicWidth();
            this.mDividerHeight = divider.getIntrinsicHeight();
        } else {
            this.mDividerWidth = 0;
            this.mDividerHeight = 0;
        }
        setWillNotDraw(divider == null);
        requestLayout();
    }

    public void setDividerPadding(int padding) {
        this.mDividerPadding = padding;
    }

    public int getDividerPadding() {
        return this.mDividerPadding;
    }

    public int getDividerWidth() {
        return this.mDividerWidth;
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        if (this.mDivider == null) {
            return;
        }
        if (this.mOrientation == 1) {
            drawDividersVertical(canvas);
        } else {
            drawDividersHorizontal(canvas);
        }
    }

    void drawDividersVertical(Canvas canvas) {
        int bottom;
        int count = getVirtualChildCount();
        for (int i = 0; i < count; i++) {
            View child = getVirtualChildAt(i);
            if (child != null && child.getVisibility() != 8 && hasDividerBeforeChildAt(i)) {
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                int top = (child.getTop() - lp.topMargin) - this.mDividerHeight;
                drawHorizontalDivider(canvas, top);
            }
        }
        if (hasDividerBeforeChildAt(count)) {
            View child2 = getVirtualChildAt(count - 1);
            if (child2 == null) {
                bottom = (getHeight() - getPaddingBottom()) - this.mDividerHeight;
            } else {
                LayoutParams lp2 = (LayoutParams) child2.getLayoutParams();
                int bottom2 = child2.getBottom() + lp2.bottomMargin;
                bottom = bottom2;
            }
            drawHorizontalDivider(canvas, bottom);
        }
    }

    void drawDividersHorizontal(Canvas canvas) {
        int position;
        int position2;
        int count = getVirtualChildCount();
        boolean isLayoutRtl = ViewUtils.isLayoutRtl(this);
        for (int i = 0; i < count; i++) {
            View child = getVirtualChildAt(i);
            if (child != null && child.getVisibility() != 8 && hasDividerBeforeChildAt(i)) {
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                if (isLayoutRtl) {
                    position2 = child.getRight() + lp.rightMargin;
                } else {
                    int position3 = child.getLeft();
                    position2 = (position3 - lp.leftMargin) - this.mDividerWidth;
                }
                drawVerticalDivider(canvas, position2);
            }
        }
        if (hasDividerBeforeChildAt(count)) {
            View child2 = getVirtualChildAt(count - 1);
            if (child2 == null) {
                if (isLayoutRtl) {
                    position = getPaddingLeft();
                } else {
                    int position4 = getWidth();
                    position = (position4 - getPaddingRight()) - this.mDividerWidth;
                }
            } else {
                LayoutParams lp2 = (LayoutParams) child2.getLayoutParams();
                if (isLayoutRtl) {
                    position = (child2.getLeft() - lp2.leftMargin) - this.mDividerWidth;
                } else {
                    int position5 = child2.getRight();
                    position = position5 + lp2.rightMargin;
                }
            }
            drawVerticalDivider(canvas, position);
        }
    }

    void drawHorizontalDivider(Canvas canvas, int top) {
        this.mDivider.setBounds(getPaddingLeft() + this.mDividerPadding, top, (getWidth() - getPaddingRight()) - this.mDividerPadding, this.mDividerHeight + top);
        this.mDivider.draw(canvas);
    }

    void drawVerticalDivider(Canvas canvas, int left) {
        this.mDivider.setBounds(left, getPaddingTop() + this.mDividerPadding, this.mDividerWidth + left, (getHeight() - getPaddingBottom()) - this.mDividerPadding);
        this.mDivider.draw(canvas);
    }

    public boolean isBaselineAligned() {
        return this.mBaselineAligned;
    }

    public void setBaselineAligned(boolean baselineAligned) {
        this.mBaselineAligned = baselineAligned;
    }

    public boolean isMeasureWithLargestChildEnabled() {
        return this.mUseLargestChild;
    }

    public void setMeasureWithLargestChildEnabled(boolean enabled) {
        this.mUseLargestChild = enabled;
    }

    @Override // android.view.View
    public int getBaseline() {
        int majorGravity;
        if (this.mBaselineAlignedChildIndex < 0) {
            return super.getBaseline();
        }
        int childCount = getChildCount();
        int i = this.mBaselineAlignedChildIndex;
        if (childCount <= i) {
            throw new RuntimeException("mBaselineAlignedChildIndex of LinearLayout set to an index that is out of bounds.");
        }
        View child = getChildAt(i);
        int childBaseline = child.getBaseline();
        if (childBaseline == -1) {
            if (this.mBaselineAlignedChildIndex == 0) {
                return -1;
            }
            throw new RuntimeException("mBaselineAlignedChildIndex of LinearLayout points to a View that doesn't know how to get its baseline.");
        }
        int childTop = this.mBaselineChildTop;
        if (this.mOrientation == 1 && (majorGravity = this.mGravity & 112) != 48) {
            if (majorGravity == 16) {
                childTop += ((((getBottom() - getTop()) - getPaddingTop()) - getPaddingBottom()) - this.mTotalLength) / 2;
            } else if (majorGravity == 80) {
                childTop = ((getBottom() - getTop()) - getPaddingBottom()) - this.mTotalLength;
            }
        }
        LayoutParams lp = (LayoutParams) child.getLayoutParams();
        return lp.topMargin + childTop + childBaseline;
    }

    public int getBaselineAlignedChildIndex() {
        return this.mBaselineAlignedChildIndex;
    }

    public void setBaselineAlignedChildIndex(int i) {
        if (i < 0 || i >= getChildCount()) {
            throw new IllegalArgumentException("base aligned child index out of range (0, " + getChildCount() + ")");
        }
        this.mBaselineAlignedChildIndex = i;
    }

    View getVirtualChildAt(int index) {
        return getChildAt(index);
    }

    int getVirtualChildCount() {
        return getChildCount();
    }

    public float getWeightSum() {
        return this.mWeightSum;
    }

    public void setWeightSum(float weightSum) {
        this.mWeightSum = Math.max(0.0f, weightSum);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (this.mOrientation == 1) {
            measureVertical(widthMeasureSpec, heightMeasureSpec);
        } else {
            measureHorizontal(widthMeasureSpec, heightMeasureSpec);
        }
    }

    protected boolean hasDividerBeforeChildAt(int childIndex) {
        if (childIndex == 0) {
            return (this.mShowDividers & 1) != 0;
        }
        if (childIndex == getChildCount()) {
            return (this.mShowDividers & 4) != 0;
        }
        if ((this.mShowDividers & 2) == 0) {
            return false;
        }
        for (int i = childIndex - 1; i >= 0; i--) {
            if (getChildAt(i).getVisibility() != 8) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Code duplicated, block: B:161:0x03db  */
    /* JADX WARN: Code duplicated, block: B:162:0x03dd  */
    void measureVertical(int widthMeasureSpec, int heightMeasureSpec) {
        int count;
        int childState;
        int heightMode;
        int delta;
        int delta2;
        float weightSum;
        boolean matchWidthLocally;
        int i;
        int alternativeMaxWidth;
        int alternativeMaxWidth2;
        int heightSize;
        int oldHeight;
        int i2;
        int heightMode2;
        LayoutParams lp;
        int count2;
        int count3;
        int weightedMaxWidth;
        int alternativeMaxWidth3;
        int childState2;
        View child;
        int largestChildHeight;
        int i3;
        int weightedMaxWidth2;
        this.mTotalLength = 0;
        int count4 = getVirtualChildCount();
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int heightMode3 = View.MeasureSpec.getMode(heightMeasureSpec);
        int baselineChildIndex = this.mBaselineAlignedChildIndex;
        boolean useLargestChild = this.mUseLargestChild;
        boolean skippedMeasure = false;
        int weightedMaxWidth3 = 0;
        float totalWeight = 0.0f;
        int measuredWidth = 0;
        int alternativeMaxWidth4 = 0;
        boolean matchWidth = false;
        int maxWidth = 0;
        int i4 = 0;
        int weightedMaxWidth4 = 0;
        int largestChildHeight2 = 1;
        while (true) {
            int weightedMaxWidth5 = i4;
            if (alternativeMaxWidth4 < count4) {
                View child2 = getVirtualChildAt(alternativeMaxWidth4);
                if (child2 == null) {
                    this.mTotalLength += measureNullChild(alternativeMaxWidth4);
                    count2 = count4;
                    heightMode2 = heightMode3;
                    i4 = weightedMaxWidth5;
                } else {
                    int largestChildHeight3 = weightedMaxWidth4;
                    int largestChildHeight4 = child2.getVisibility();
                    if (largestChildHeight4 == 8) {
                        alternativeMaxWidth4 += getChildrenSkipCount(child2, alternativeMaxWidth4);
                        count2 = count4;
                        i4 = weightedMaxWidth5;
                        weightedMaxWidth4 = largestChildHeight3;
                        heightMode2 = heightMode3;
                    } else {
                        if (hasDividerBeforeChildAt(alternativeMaxWidth4)) {
                            this.mTotalLength += this.mDividerHeight;
                        }
                        LayoutParams lp2 = (LayoutParams) child2.getLayoutParams();
                        float totalWeight2 = totalWeight + lp2.weight;
                        if (heightMode3 != 1073741824 || lp2.height != 0 || lp2.weight <= 0.0f) {
                            int i5 = alternativeMaxWidth4;
                            if (lp2.height == 0 && lp2.weight > 0.0f) {
                                lp2.height = -2;
                                oldHeight = 0;
                            } else {
                                oldHeight = Integer.MIN_VALUE;
                            }
                            int oldHeight2 = oldHeight;
                            i2 = i5;
                            heightMode2 = heightMode3;
                            lp = lp2;
                            count2 = count4;
                            count3 = 1073741824;
                            weightedMaxWidth = weightedMaxWidth5;
                            alternativeMaxWidth3 = measuredWidth;
                            childState2 = maxWidth;
                            int childState3 = totalWeight2 == 0.0f ? this.mTotalLength : 0;
                            measureChildBeforeLayout(child2, i2, widthMeasureSpec, 0, heightMeasureSpec, childState3);
                            if (oldHeight2 != Integer.MIN_VALUE) {
                                lp.height = oldHeight2;
                            }
                            int childHeight = child2.getMeasuredHeight();
                            int totalLength = this.mTotalLength;
                            child = child2;
                            this.mTotalLength = Math.max(totalLength, totalLength + childHeight + lp.topMargin + lp.bottomMargin + getNextLocationOffset(child));
                            if (!useLargestChild) {
                                largestChildHeight = largestChildHeight3;
                            } else {
                                largestChildHeight = Math.max(childHeight, largestChildHeight3);
                            }
                        } else {
                            int totalLength2 = this.mTotalLength;
                            int i6 = lp2.topMargin + totalLength2;
                            int i7 = alternativeMaxWidth4;
                            int i8 = lp2.bottomMargin;
                            this.mTotalLength = Math.max(totalLength2, i6 + i8);
                            skippedMeasure = true;
                            alternativeMaxWidth3 = measuredWidth;
                            childState2 = maxWidth;
                            count2 = count4;
                            weightedMaxWidth = weightedMaxWidth5;
                            largestChildHeight = largestChildHeight3;
                            i2 = i7;
                            count3 = BasicMeasure.EXACTLY;
                            heightMode2 = heightMode3;
                            lp = lp2;
                            child = child2;
                        }
                        if (baselineChildIndex >= 0) {
                            i3 = i2;
                            if (baselineChildIndex == i3 + 1) {
                                this.mBaselineChildTop = this.mTotalLength;
                            }
                        } else {
                            i3 = i2;
                        }
                        if (i3 < baselineChildIndex && lp.weight > 0.0f) {
                            throw new RuntimeException("A child of LinearLayout with index less than mBaselineAlignedChildIndex has weight > 0, which won't work.  Either remove the weight, or don't set mBaselineAlignedChildIndex.");
                        }
                        boolean matchWidthLocally2 = false;
                        if (widthMode != count3 && lp.width == -1) {
                            matchWidth = true;
                            matchWidthLocally2 = true;
                        }
                        int margin = lp.leftMargin + lp.rightMargin;
                        int measuredWidth2 = child.getMeasuredWidth() + margin;
                        int maxWidth2 = Math.max(weightedMaxWidth3, measuredWidth2);
                        int childState4 = View.combineMeasuredStates(childState2, child.getMeasuredState());
                        int i9 = (largestChildHeight2 == 0 || lp.width != -1) ? 0 : 1;
                        if (lp.weight > 0.0f) {
                            weightedMaxWidth2 = Math.max(weightedMaxWidth, matchWidthLocally2 ? margin : measuredWidth2);
                        } else {
                            weightedMaxWidth2 = weightedMaxWidth;
                            alternativeMaxWidth3 = Math.max(alternativeMaxWidth3, matchWidthLocally2 ? margin : measuredWidth2);
                        }
                        int alternativeMaxWidth5 = getChildrenSkipCount(child, i3);
                        int i10 = alternativeMaxWidth5 + i3;
                        weightedMaxWidth4 = largestChildHeight;
                        largestChildHeight2 = i9;
                        i4 = weightedMaxWidth2;
                        totalWeight = totalWeight2;
                        measuredWidth = alternativeMaxWidth3;
                        alternativeMaxWidth4 = i10;
                        weightedMaxWidth3 = maxWidth2;
                        maxWidth = childState4;
                    }
                }
                alternativeMaxWidth4++;
                heightMode3 = heightMode2;
                count4 = count2;
            } else {
                int largestChildHeight5 = weightedMaxWidth4;
                int count5 = count4;
                int heightMode4 = heightMode3;
                int weightedMaxWidth6 = weightedMaxWidth5;
                int i11 = 8;
                int alternativeMaxWidth6 = measuredWidth;
                if (this.mTotalLength > 0) {
                    count = count5;
                    if (hasDividerBeforeChildAt(count)) {
                        this.mTotalLength += this.mDividerHeight;
                    }
                } else {
                    count = count5;
                }
                if (useLargestChild) {
                    heightMode = heightMode4;
                    if (heightMode == Integer.MIN_VALUE || heightMode == 0) {
                        this.mTotalLength = 0;
                        int i12 = 0;
                        while (i12 < count) {
                            View child3 = getVirtualChildAt(i12);
                            if (child3 == null) {
                                this.mTotalLength += measureNullChild(i12);
                            } else if (child3.getVisibility() == i11) {
                                i12 += getChildrenSkipCount(child3, i12);
                            } else {
                                LayoutParams lp3 = (LayoutParams) child3.getLayoutParams();
                                int totalLength3 = this.mTotalLength;
                                int childState5 = lp3.topMargin;
                                this.mTotalLength = Math.max(totalLength3, totalLength3 + largestChildHeight5 + childState5 + lp3.bottomMargin + getNextLocationOffset(child3));
                            }
                            i12++;
                            maxWidth = maxWidth;
                            i11 = 8;
                        }
                        childState = maxWidth;
                    } else {
                        childState = maxWidth;
                    }
                } else {
                    childState = maxWidth;
                    heightMode = heightMode4;
                }
                this.mTotalLength += getPaddingTop() + getPaddingBottom();
                int largestChildHeight6 = largestChildHeight5;
                int heightSizeAndState = View.resolveSizeAndState(Math.max(this.mTotalLength, getSuggestedMinimumHeight()), heightMeasureSpec, 0);
                int heightSize2 = heightSizeAndState & ViewCompat.MEASURED_SIZE_MASK;
                int delta3 = heightSize2 - this.mTotalLength;
                if (skippedMeasure || (delta3 != 0 && totalWeight > 0.0f)) {
                    float weightSum2 = this.mWeightSum;
                    if (weightSum2 <= 0.0f) {
                        weightSum2 = totalWeight;
                    }
                    this.mTotalLength = 0;
                    int i13 = 0;
                    int delta4 = delta3;
                    delta = childState;
                    while (i13 < count) {
                        View child4 = getVirtualChildAt(i13);
                        int largestChildHeight7 = largestChildHeight6;
                        int largestChildHeight8 = child4.getVisibility();
                        boolean useLargestChild2 = useLargestChild;
                        if (largestChildHeight8 == 8) {
                            heightMode = heightMode;
                            delta2 = delta4;
                            baselineChildIndex = baselineChildIndex;
                        } else {
                            LayoutParams lp4 = (LayoutParams) child4.getLayoutParams();
                            float childExtra = lp4.weight;
                            if (childExtra <= 0.0f) {
                                heightMode = heightMode;
                                int heightMode5 = delta4;
                                delta2 = heightMode5;
                            } else {
                                int share = (int) ((delta4 * childExtra) / weightSum2);
                                float weightSum3 = weightSum2 - childExtra;
                                delta2 = delta4 - share;
                                int childWidthMeasureSpec = getChildMeasureSpec(widthMeasureSpec, getPaddingLeft() + getPaddingRight() + lp4.leftMargin + lp4.rightMargin, lp4.width);
                                if (lp4.height != 0 || heightMode != 1073741824) {
                                    int heightMode6 = child4.getMeasuredHeight();
                                    int childHeight2 = heightMode6 + share;
                                    if (childHeight2 < 0) {
                                        childHeight2 = 0;
                                    }
                                    child4.measure(childWidthMeasureSpec, View.MeasureSpec.makeMeasureSpec(childHeight2, BasicMeasure.EXACTLY));
                                } else {
                                    heightMode = heightMode;
                                    int heightMode7 = share > 0 ? share : 0;
                                    child4.measure(childWidthMeasureSpec, View.MeasureSpec.makeMeasureSpec(heightMode7, BasicMeasure.EXACTLY));
                                }
                                delta = View.combineMeasuredStates(delta, child4.getMeasuredState() & InputDeviceCompat.SOURCE_ANY);
                                weightSum2 = weightSum3;
                            }
                            int margin2 = lp4.leftMargin + lp4.rightMargin;
                            int measuredWidth3 = child4.getMeasuredWidth() + margin2;
                            weightedMaxWidth3 = Math.max(weightedMaxWidth3, measuredWidth3);
                            if (widthMode != 1073741824) {
                                weightSum = weightSum2;
                                matchWidthLocally = lp4.width == -1;
                                if (matchWidthLocally) {
                                    i = margin2;
                                } else {
                                    i = measuredWidth3;
                                }
                                int alternativeMaxWidth7 = Math.max(alternativeMaxWidth6, i);
                                int i14 = (largestChildHeight2 == 0 && lp4.width == -1) ? 1 : 0;
                                int totalLength4 = this.mTotalLength;
                                int measuredHeight = totalLength4 + child4.getMeasuredHeight();
                                int alternativeMaxWidth8 = lp4.topMargin;
                                this.mTotalLength = Math.max(totalLength4, measuredHeight + alternativeMaxWidth8 + lp4.bottomMargin + getNextLocationOffset(child4));
                                largestChildHeight2 = i14;
                                weightSum2 = weightSum;
                                alternativeMaxWidth6 = alternativeMaxWidth7;
                            } else {
                                weightSum = weightSum2;
                            }
                            if (matchWidthLocally) {
                                i = margin2;
                            } else {
                                i = measuredWidth3;
                            }
                            int alternativeMaxWidth9 = Math.max(alternativeMaxWidth6, i);
                            if (largestChildHeight2 == 0) {
                            }
                            int totalLength5 = this.mTotalLength;
                            int measuredHeight2 = totalLength5 + child4.getMeasuredHeight();
                            int alternativeMaxWidth10 = lp4.topMargin;
                            this.mTotalLength = Math.max(totalLength5, measuredHeight2 + alternativeMaxWidth10 + lp4.bottomMargin + getNextLocationOffset(child4));
                            largestChildHeight2 = i14;
                            weightSum2 = weightSum;
                            alternativeMaxWidth6 = alternativeMaxWidth9;
                        }
                        i13++;
                        largestChildHeight6 = largestChildHeight7;
                        useLargestChild = useLargestChild2;
                        baselineChildIndex = baselineChildIndex;
                        delta4 = delta2;
                        heightMode = heightMode;
                    }
                    this.mTotalLength += getPaddingTop() + getPaddingBottom();
                } else {
                    int alternativeMaxWidth11 = Math.max(alternativeMaxWidth6, weightedMaxWidth6);
                    if (!useLargestChild || heightMode == 1073741824) {
                        alternativeMaxWidth = alternativeMaxWidth11;
                    } else {
                        int i15 = 0;
                        while (i15 < count) {
                            float totalWeight3 = totalWeight;
                            View child5 = getVirtualChildAt(i15);
                            if (child5 != null) {
                                alternativeMaxWidth2 = alternativeMaxWidth11;
                                int alternativeMaxWidth12 = child5.getVisibility();
                                heightSize = heightSize2;
                                if (alternativeMaxWidth12 != 8 && ((LayoutParams) child5.getLayoutParams()).weight > 0.0f) {
                                    int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(child5.getMeasuredWidth(), BasicMeasure.EXACTLY);
                                    int weightedMaxWidth7 = View.MeasureSpec.makeMeasureSpec(largestChildHeight6, BasicMeasure.EXACTLY);
                                    child5.measure(iMakeMeasureSpec, weightedMaxWidth7);
                                }
                            } else {
                                alternativeMaxWidth2 = alternativeMaxWidth11;
                                heightSize = heightSize2;
                            }
                            i15++;
                            alternativeMaxWidth11 = alternativeMaxWidth2;
                            totalWeight = totalWeight3;
                            heightSize2 = heightSize;
                            weightedMaxWidth6 = weightedMaxWidth6;
                        }
                        alternativeMaxWidth = alternativeMaxWidth11;
                    }
                    alternativeMaxWidth6 = alternativeMaxWidth;
                    delta = childState;
                }
                if (largestChildHeight2 == 0 && widthMode != 1073741824) {
                    weightedMaxWidth3 = alternativeMaxWidth6;
                }
                int maxWidth3 = weightedMaxWidth3 + getPaddingLeft() + getPaddingRight();
                setMeasuredDimension(View.resolveSizeAndState(Math.max(maxWidth3, getSuggestedMinimumWidth()), widthMeasureSpec, delta), heightSizeAndState);
                if (matchWidth) {
                    forceUniformWidth(count, heightMeasureSpec);
                    return;
                }
                return;
            }
        }
    }

    private void forceUniformWidth(int count, int heightMeasureSpec) {
        int uniformMeasureSpec = View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), BasicMeasure.EXACTLY);
        for (int i = 0; i < count; i++) {
            View child = getVirtualChildAt(i);
            if (child.getVisibility() != 8) {
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                if (lp.width == -1) {
                    int oldHeight = lp.height;
                    lp.height = child.getMeasuredHeight();
                    measureChildWithMargins(child, uniformMeasureSpec, 0, heightMeasureSpec, 0);
                    lp.height = oldHeight;
                }
            }
        }
    }

    /* JADX WARN: Code duplicated, block: B:207:0x0557  */
    /* JADX WARN: Code duplicated, block: B:209:0x0560  */
    /* JADX WARN: Code duplicated, block: B:211:0x0564  */
    /* JADX WARN: Code duplicated, block: B:212:0x0567  */
    /* JADX WARN: Code duplicated, block: B:214:0x058a  */
    /* JADX WARN: Code duplicated, block: B:215:0x058f  */
    void measureHorizontal(int widthMeasureSpec, int heightMeasureSpec) {
        int count;
        int descent;
        int maxHeight;
        int widthMode;
        int count2;
        int widthSizeAndState;
        int childState;
        int widthMode2;
        int alternativeMaxHeight;
        int maxHeight2;
        int count3;
        int count4;
        boolean useLargestChild;
        int i;
        int alternativeMaxHeight2;
        boolean allFillParent;
        int childBaseline;
        int i2;
        int alternativeMaxHeight3;
        int alternativeMaxHeight4;
        int widthSize;
        int i3;
        int oldWidth;
        int weightedMaxHeight;
        int alternativeMaxHeight5;
        int childState2;
        int largestChildWidth;
        int widthMode3;
        boolean baselineAligned;
        int count5;
        int count6;
        LayoutParams lp;
        int largestChildWidth2;
        int weightedMaxHeight2;
        int childBaseline2;
        this.mTotalLength = 0;
        int count7 = getVirtualChildCount();
        int widthMode4 = View.MeasureSpec.getMode(widthMeasureSpec);
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        if (this.mMaxAscent == null || this.mMaxDescent == null) {
            this.mMaxAscent = new int[4];
            this.mMaxDescent = new int[4];
        }
        int[] maxAscent = this.mMaxAscent;
        int[] maxDescent = this.mMaxDescent;
        maxAscent[3] = -1;
        maxAscent[2] = -1;
        maxAscent[1] = -1;
        maxAscent[0] = -1;
        maxDescent[3] = -1;
        maxDescent[2] = -1;
        maxDescent[1] = -1;
        maxDescent[0] = -1;
        boolean baselineAligned2 = this.mBaselineAligned;
        boolean useLargestChild2 = this.mUseLargestChild;
        boolean isExactly = widthMode4 == 1073741824;
        int i4 = 0;
        int childState3 = 0;
        float totalWeight = 0.0f;
        int childHeight = 0;
        int childState4 = 0;
        int largestChildWidth3 = 0;
        boolean skippedMeasure = false;
        boolean matchHeight = true;
        int weightedMaxHeight3 = 0;
        int alternativeMaxHeight6 = 0;
        while (i4 < count7) {
            View child = getVirtualChildAt(i4);
            if (child == null) {
                int largestChildWidth4 = childState4;
                int largestChildWidth5 = this.mTotalLength;
                this.mTotalLength = largestChildWidth5 + measureNullChild(i4);
                baselineAligned = baselineAligned2;
                count5 = count7;
                childState4 = largestChildWidth4;
                largestChildWidth = widthMode4;
            } else {
                int largestChildWidth6 = childState4;
                int largestChildWidth7 = child.getVisibility();
                int weightedMaxHeight4 = alternativeMaxHeight6;
                if (largestChildWidth7 == 8) {
                    i4 += getChildrenSkipCount(child, i4);
                    baselineAligned = baselineAligned2;
                    childState4 = largestChildWidth6;
                    alternativeMaxHeight6 = weightedMaxHeight4;
                    count5 = count7;
                    largestChildWidth = widthMode4;
                } else {
                    if (hasDividerBeforeChildAt(i4)) {
                        this.mTotalLength += this.mDividerWidth;
                    }
                    LayoutParams lp2 = (LayoutParams) child.getLayoutParams();
                    float totalWeight2 = totalWeight + lp2.weight;
                    if (widthMode4 != 1073741824 || lp2.width != 0 || lp2.weight <= 0.0f) {
                        int alternativeMaxHeight7 = weightedMaxHeight3;
                        if (lp2.width == 0 && lp2.weight > 0.0f) {
                            lp2.width = -2;
                            oldWidth = 0;
                        } else {
                            oldWidth = Integer.MIN_VALUE;
                        }
                        weightedMaxHeight = weightedMaxHeight4;
                        int oldWidth2 = oldWidth;
                        alternativeMaxHeight5 = alternativeMaxHeight7;
                        childState2 = childHeight;
                        int childState5 = totalWeight2 == 0.0f ? this.mTotalLength : 0;
                        largestChildWidth = widthMode4;
                        widthMode3 = childState3;
                        baselineAligned = baselineAligned2;
                        count5 = count7;
                        count6 = -1;
                        measureChildBeforeLayout(child, i4, widthMeasureSpec, childState5, heightMeasureSpec, 0);
                        if (oldWidth2 == Integer.MIN_VALUE) {
                            lp = lp2;
                        } else {
                            lp = lp2;
                            lp.width = oldWidth2;
                        }
                        int childWidth = child.getMeasuredWidth();
                        if (isExactly) {
                            this.mTotalLength += lp.leftMargin + childWidth + lp.rightMargin + getNextLocationOffset(child);
                        } else {
                            int totalLength = this.mTotalLength;
                            this.mTotalLength = Math.max(totalLength, totalLength + childWidth + lp.leftMargin + lp.rightMargin + getNextLocationOffset(child));
                        }
                        if (!useLargestChild2) {
                            largestChildWidth2 = largestChildWidth6;
                        } else {
                            largestChildWidth2 = Math.max(childWidth, largestChildWidth6);
                        }
                    } else {
                        if (!isExactly) {
                            int totalLength2 = this.mTotalLength;
                            this.mTotalLength = Math.max(totalLength2, lp2.leftMargin + totalLength2 + lp2.rightMargin);
                        } else {
                            int i5 = this.mTotalLength;
                            int i6 = lp2.leftMargin;
                            int alternativeMaxHeight8 = lp2.rightMargin;
                            this.mTotalLength = i5 + i6 + alternativeMaxHeight8;
                        }
                        if (baselineAligned2) {
                            int freeSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
                            child.measure(freeSpec, freeSpec);
                            lp = lp2;
                            childState2 = childHeight;
                            baselineAligned = baselineAligned2;
                            largestChildWidth2 = largestChildWidth6;
                            weightedMaxHeight = weightedMaxHeight4;
                            alternativeMaxHeight5 = weightedMaxHeight3;
                            count5 = count7;
                            largestChildWidth = widthMode4;
                            count6 = -1;
                            widthMode3 = childState3;
                        } else {
                            largestChildWidth3 = 1;
                            lp = lp2;
                            childState2 = childHeight;
                            baselineAligned = baselineAligned2;
                            largestChildWidth2 = largestChildWidth6;
                            weightedMaxHeight = weightedMaxHeight4;
                            alternativeMaxHeight5 = weightedMaxHeight3;
                            count5 = count7;
                            largestChildWidth = widthMode4;
                            count6 = -1;
                            widthMode3 = childState3;
                        }
                    }
                    int oldWidth3 = 0;
                    if (heightMode != 1073741824 && lp.height == count6) {
                        skippedMeasure = true;
                        oldWidth3 = 1;
                    }
                    int margin = lp.topMargin + lp.bottomMargin;
                    int childHeight2 = child.getMeasuredHeight() + margin;
                    int childState6 = View.combineMeasuredStates(childState2, child.getMeasuredState());
                    if (baselineAligned && (childBaseline2 = child.getBaseline()) != count6) {
                        int gravity = (lp.gravity < 0 ? this.mGravity : lp.gravity) & 112;
                        int index = ((gravity >> 4) & (-2)) >> 1;
                        maxAscent[index] = Math.max(maxAscent[index], childBaseline2);
                        int largestChildWidth8 = childHeight2 - childBaseline2;
                        maxDescent[index] = Math.max(maxDescent[index], largestChildWidth8);
                    }
                    int maxHeight3 = Math.max(widthMode3, childHeight2);
                    boolean allFillParent2 = matchHeight && lp.height == -1;
                    if (lp.weight > 0.0f) {
                        weightedMaxHeight2 = Math.max(weightedMaxHeight, oldWidth3 != 0 ? margin : childHeight2);
                    } else {
                        int weightedMaxHeight5 = weightedMaxHeight;
                        alternativeMaxHeight5 = Math.max(alternativeMaxHeight5, oldWidth3 != 0 ? margin : childHeight2);
                        weightedMaxHeight2 = weightedMaxHeight5;
                    }
                    int weightedMaxHeight6 = getChildrenSkipCount(child, i4);
                    i4 += weightedMaxHeight6;
                    matchHeight = allFillParent2;
                    childHeight = childState6;
                    totalWeight = totalWeight2;
                    childState4 = largestChildWidth2;
                    weightedMaxHeight3 = alternativeMaxHeight5;
                    childState3 = maxHeight3;
                    alternativeMaxHeight6 = weightedMaxHeight2;
                }
            }
            i4++;
            baselineAligned2 = baselineAligned;
            widthMode4 = largestChildWidth;
            count7 = count5;
        }
        boolean baselineAligned3 = baselineAligned2;
        int count8 = count7;
        int widthMode5 = widthMode4;
        int weightedMaxHeight7 = alternativeMaxHeight6;
        int alternativeMaxHeight9 = weightedMaxHeight3;
        int i7 = childHeight;
        int widthMode6 = childState3;
        int largestChildWidth9 = childState4;
        int largestChildWidth10 = this.mTotalLength;
        if (largestChildWidth10 > 0) {
            count = count8;
            if (hasDividerBeforeChildAt(count)) {
                this.mTotalLength += this.mDividerWidth;
            }
        } else {
            count = count8;
        }
        if (maxAscent[1] == -1 && maxAscent[0] == -1 && maxAscent[2] == -1 && maxAscent[3] == -1) {
            descent = widthMode6;
        } else {
            int ascent = Math.max(maxAscent[3], Math.max(maxAscent[0], Math.max(maxAscent[1], maxAscent[2])));
            int i8 = maxDescent[3];
            int i9 = maxDescent[0];
            int i10 = maxDescent[1];
            int childState7 = maxDescent[2];
            int descent2 = Math.max(i8, Math.max(i9, Math.max(i10, childState7)));
            descent = Math.max(widthMode6, ascent + descent2);
        }
        if (useLargestChild2) {
            widthMode = widthMode5;
            if (widthMode == Integer.MIN_VALUE || widthMode == 0) {
                this.mTotalLength = 0;
                int i11 = 0;
                while (i11 < count) {
                    View child2 = getVirtualChildAt(i11);
                    if (child2 == null) {
                        this.mTotalLength += measureNullChild(i11);
                    } else {
                        if (child2.getVisibility() == 8) {
                            i3 = i11 + getChildrenSkipCount(child2, i11);
                            descent = descent;
                        } else {
                            LayoutParams lp3 = (LayoutParams) child2.getLayoutParams();
                            if (!isExactly) {
                                int maxHeight4 = this.mTotalLength;
                                this.mTotalLength = Math.max(maxHeight4, maxHeight4 + largestChildWidth9 + lp3.leftMargin + lp3.rightMargin + getNextLocationOffset(child2));
                            } else {
                                int i12 = this.mTotalLength;
                                int maxHeight5 = lp3.leftMargin;
                                int i13 = lp3.rightMargin;
                                this.mTotalLength = i12 + maxHeight5 + largestChildWidth9 + i13 + getNextLocationOffset(child2);
                            }
                        }
                        i11 = i3 + 1;
                        descent = descent;
                    }
                    i3 = i11;
                    i11 = i3 + 1;
                    descent = descent;
                }
                maxHeight = descent;
            } else {
                maxHeight = descent;
            }
        } else {
            maxHeight = descent;
            widthMode = widthMode5;
        }
        int maxHeight6 = this.mTotalLength;
        this.mTotalLength = maxHeight6 + getPaddingLeft() + getPaddingRight();
        int widthSizeAndState2 = View.resolveSizeAndState(Math.max(this.mTotalLength, getSuggestedMinimumWidth()), widthMeasureSpec, 0);
        int widthSize2 = widthSizeAndState2 & ViewCompat.MEASURED_SIZE_MASK;
        int delta = widthSize2 - this.mTotalLength;
        if (largestChildWidth3 != 0 || (delta != 0 && totalWeight > 0.0f)) {
            float weightSum = this.mWeightSum;
            if (weightSum <= 0.0f) {
                weightSum = totalWeight;
            }
            maxAscent[3] = -1;
            maxAscent[2] = -1;
            maxAscent[1] = -1;
            maxAscent[0] = -1;
            maxDescent[3] = -1;
            maxDescent[2] = -1;
            maxDescent[1] = -1;
            maxDescent[0] = -1;
            this.mTotalLength = 0;
            int i14 = 0;
            int delta2 = delta;
            int maxHeight7 = -1;
            int childState8 = i7;
            while (i14 < count) {
                int weightedMaxHeight8 = weightedMaxHeight7;
                View child3 = getVirtualChildAt(i14);
                if (child3 != null) {
                    useLargestChild = useLargestChild2;
                    count3 = count;
                    if (child3.getVisibility() == 8) {
                        widthMode = widthMode;
                        widthSizeAndState2 = widthSizeAndState2;
                        count4 = delta2;
                    } else {
                        LayoutParams lp4 = (LayoutParams) child3.getLayoutParams();
                        float childExtra = lp4.weight;
                        if (childExtra > 0.0f) {
                            int share = (int) ((delta2 * childExtra) / weightSum);
                            float weightSum2 = weightSum - childExtra;
                            int delta3 = delta2 - share;
                            int childHeightMeasureSpec = getChildMeasureSpec(heightMeasureSpec, getPaddingTop() + getPaddingBottom() + lp4.topMargin + lp4.bottomMargin, lp4.height);
                            if (lp4.width != 0 || widthMode != 1073741824) {
                                int childWidth2 = child3.getMeasuredWidth() + share;
                                if (childWidth2 < 0) {
                                    childWidth2 = 0;
                                }
                                child3.measure(View.MeasureSpec.makeMeasureSpec(childWidth2, BasicMeasure.EXACTLY), childHeightMeasureSpec);
                            } else {
                                child3.measure(View.MeasureSpec.makeMeasureSpec(share > 0 ? share : 0, BasicMeasure.EXACTLY), childHeightMeasureSpec);
                            }
                            childState8 = View.combineMeasuredStates(childState8, child3.getMeasuredState() & ViewCompat.MEASURED_STATE_MASK);
                            weightSum = weightSum2;
                            i = delta3;
                        } else {
                            widthMode = widthMode;
                            i = delta2;
                        }
                        if (isExactly) {
                            this.mTotalLength += child3.getMeasuredWidth() + lp4.leftMargin + lp4.rightMargin + getNextLocationOffset(child3);
                        } else {
                            int totalLength3 = this.mTotalLength;
                            this.mTotalLength = Math.max(totalLength3, child3.getMeasuredWidth() + totalLength3 + lp4.leftMargin + lp4.rightMargin + getNextLocationOffset(child3));
                        }
                        boolean matchHeightLocally = heightMode != 1073741824 && lp4.height == -1;
                        int margin2 = lp4.topMargin + lp4.bottomMargin;
                        int childHeight3 = child3.getMeasuredHeight() + margin2;
                        maxHeight7 = Math.max(maxHeight7, childHeight3);
                        float weightSum3 = weightSum;
                        int alternativeMaxHeight10 = Math.max(alternativeMaxHeight9, matchHeightLocally ? margin2 : childHeight3);
                        if (matchHeight) {
                            alternativeMaxHeight2 = alternativeMaxHeight10;
                            allFillParent = lp4.height == -1;
                            if (baselineAligned3) {
                                matchHeight = allFillParent;
                            } else {
                                childBaseline = child3.getBaseline();
                                matchHeight = allFillParent;
                                if (childBaseline == -1) {
                                    if (lp4.gravity < 0) {
                                        i2 = this.mGravity;
                                    } else {
                                        i2 = lp4.gravity;
                                    }
                                    int gravity2 = i2 & 112;
                                    int index2 = ((gravity2 >> 4) & (-2)) >> 1;
                                    int gravity3 = maxAscent[index2];
                                    maxAscent[index2] = Math.max(gravity3, childBaseline);
                                    maxDescent[index2] = Math.max(maxDescent[index2], childHeight3 - childBaseline);
                                }
                            }
                            weightSum = weightSum3;
                            alternativeMaxHeight9 = alternativeMaxHeight2;
                            count4 = i;
                        } else {
                            alternativeMaxHeight2 = alternativeMaxHeight10;
                        }
                        if (baselineAligned3) {
                            matchHeight = allFillParent;
                        } else {
                            childBaseline = child3.getBaseline();
                            matchHeight = allFillParent;
                            if (childBaseline == -1) {
                                if (lp4.gravity < 0) {
                                    i2 = this.mGravity;
                                } else {
                                    i2 = lp4.gravity;
                                }
                                int gravity4 = i2 & 112;
                                int index3 = ((gravity4 >> 4) & (-2)) >> 1;
                                int gravity5 = maxAscent[index3];
                                maxAscent[index3] = Math.max(gravity5, childBaseline);
                                maxDescent[index3] = Math.max(maxDescent[index3], childHeight3 - childBaseline);
                            }
                        }
                        weightSum = weightSum3;
                        alternativeMaxHeight9 = alternativeMaxHeight2;
                        count4 = i;
                    }
                } else {
                    count3 = count;
                    widthMode = widthMode;
                    widthSizeAndState2 = widthSizeAndState2;
                    count4 = delta2;
                    useLargestChild = useLargestChild2;
                }
                i14++;
                delta2 = count4;
                widthSizeAndState2 = widthSizeAndState2;
                useLargestChild2 = useLargestChild;
                count = count3;
                weightedMaxHeight7 = weightedMaxHeight8;
                widthMode = widthMode;
            }
            count2 = count;
            widthSizeAndState = widthSizeAndState2;
            int i15 = this.mTotalLength;
            this.mTotalLength = i15 + getPaddingLeft() + getPaddingRight();
            if (maxAscent[1] == -1 && maxAscent[0] == -1 && maxAscent[2] == -1 && maxAscent[3] == -1) {
                maxHeight2 = maxHeight7;
            } else {
                int ascent2 = Math.max(maxAscent[3], Math.max(maxAscent[0], Math.max(maxAscent[1], maxAscent[2])));
                int descent3 = Math.max(maxDescent[3], Math.max(maxDescent[0], Math.max(maxDescent[1], maxDescent[2])));
                maxHeight2 = Math.max(maxHeight7, ascent2 + descent3);
            }
            alternativeMaxHeight = alternativeMaxHeight9;
            widthMode2 = childState8;
            childState = maxHeight2;
        } else {
            int alternativeMaxHeight11 = Math.max(alternativeMaxHeight9, weightedMaxHeight7);
            if (!useLargestChild2 || widthMode == 1073741824) {
                alternativeMaxHeight3 = alternativeMaxHeight11;
            } else {
                int i16 = 0;
                while (i16 < count) {
                    float totalWeight3 = totalWeight;
                    View child4 = getVirtualChildAt(i16);
                    if (child4 != null) {
                        alternativeMaxHeight4 = alternativeMaxHeight11;
                        int alternativeMaxHeight12 = child4.getVisibility();
                        widthSize = widthSize2;
                        if (alternativeMaxHeight12 != 8 && ((LayoutParams) child4.getLayoutParams()).weight > 0.0f) {
                            int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(largestChildWidth9, BasicMeasure.EXACTLY);
                            int largestChildWidth11 = child4.getMeasuredHeight();
                            child4.measure(iMakeMeasureSpec, View.MeasureSpec.makeMeasureSpec(largestChildWidth11, BasicMeasure.EXACTLY));
                        }
                    } else {
                        alternativeMaxHeight4 = alternativeMaxHeight11;
                        widthSize = widthSize2;
                    }
                    i16++;
                    alternativeMaxHeight11 = alternativeMaxHeight4;
                    totalWeight = totalWeight3;
                    widthSize2 = widthSize;
                    largestChildWidth9 = largestChildWidth9;
                }
                alternativeMaxHeight3 = alternativeMaxHeight11;
            }
            count2 = count;
            widthSizeAndState = widthSizeAndState2;
            alternativeMaxHeight = alternativeMaxHeight3;
            childState = maxHeight;
            widthMode2 = i7;
        }
        if (!matchHeight && heightMode != 1073741824) {
            childState = alternativeMaxHeight;
        }
        int maxHeight8 = childState + getPaddingTop() + getPaddingBottom();
        setMeasuredDimension(widthSizeAndState | ((-16777216) & widthMode2), View.resolveSizeAndState(Math.max(maxHeight8, getSuggestedMinimumHeight()), heightMeasureSpec, widthMode2 << 16));
        if (skippedMeasure) {
            forceUniformHeight(count2, widthMeasureSpec);
        }
    }

    private void forceUniformHeight(int count, int widthMeasureSpec) {
        int uniformMeasureSpec = View.MeasureSpec.makeMeasureSpec(getMeasuredHeight(), BasicMeasure.EXACTLY);
        for (int i = 0; i < count; i++) {
            View child = getVirtualChildAt(i);
            if (child.getVisibility() != 8) {
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                if (lp.height == -1) {
                    int oldWidth = lp.width;
                    lp.width = child.getMeasuredWidth();
                    measureChildWithMargins(child, widthMeasureSpec, 0, uniformMeasureSpec, 0);
                    lp.width = oldWidth;
                }
            }
        }
    }

    int getChildrenSkipCount(View child, int index) {
        return 0;
    }

    int measureNullChild(int childIndex) {
        return 0;
    }

    void measureChildBeforeLayout(View child, int childIndex, int widthMeasureSpec, int totalWidth, int heightMeasureSpec, int totalHeight) {
        measureChildWithMargins(child, widthMeasureSpec, totalWidth, heightMeasureSpec, totalHeight);
    }

    int getLocationOffset(View child) {
        return 0;
    }

    int getNextLocationOffset(View child) {
        return 0;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        if (this.mOrientation == 1) {
            layoutVertical(l, t, r, b);
        } else {
            layoutHorizontal(l, t, r, b);
        }
    }

    void layoutVertical(int left, int top, int right, int bottom) {
        int childTop;
        int gravity;
        int childLeft;
        int paddingLeft = getPaddingLeft();
        int width = right - left;
        int childRight = width - getPaddingRight();
        int childSpace = (width - paddingLeft) - getPaddingRight();
        int count = getVirtualChildCount();
        int i = this.mGravity;
        int majorGravity = i & 112;
        int minorGravity = i & GravityCompat.RELATIVE_HORIZONTAL_GRAVITY_MASK;
        if (majorGravity == 16) {
            int childTop2 = getPaddingTop();
            childTop = childTop2 + (((bottom - top) - this.mTotalLength) / 2);
        } else if (majorGravity == 80) {
            int childTop3 = getPaddingTop();
            childTop = ((childTop3 + bottom) - top) - this.mTotalLength;
        } else {
            childTop = getPaddingTop();
        }
        int i2 = 0;
        while (i2 < count) {
            View child = getVirtualChildAt(i2);
            if (child == null) {
                childTop += measureNullChild(i2);
            } else if (child.getVisibility() != 8) {
                int childWidth = child.getMeasuredWidth();
                int childHeight = child.getMeasuredHeight();
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                int gravity2 = lp.gravity;
                if (gravity2 >= 0) {
                    gravity = gravity2;
                } else {
                    gravity = minorGravity;
                }
                int layoutDirection = ViewCompat.getLayoutDirection(this);
                int absoluteGravity = GravityCompat.getAbsoluteGravity(gravity, layoutDirection);
                int i3 = absoluteGravity & 7;
                if (i3 == 1) {
                    int childLeft2 = childSpace - childWidth;
                    childLeft = (((childLeft2 / 2) + paddingLeft) + lp.leftMargin) - lp.rightMargin;
                } else if (i3 == 5) {
                    int childLeft3 = childRight - childWidth;
                    childLeft = childLeft3 - lp.rightMargin;
                } else {
                    childLeft = lp.leftMargin + paddingLeft;
                }
                if (hasDividerBeforeChildAt(i2)) {
                    childTop += this.mDividerHeight;
                }
                int childTop4 = childTop + lp.topMargin;
                int childTop5 = getLocationOffset(child);
                int layoutDirection2 = childLeft;
                setChildFrame(child, layoutDirection2, childTop4 + childTop5, childWidth, childHeight);
                int childTop6 = childTop4 + childHeight + lp.bottomMargin + getNextLocationOffset(child);
                i2 += getChildrenSkipCount(child, i2);
                childTop = childTop6;
            }
            i2++;
            paddingLeft = paddingLeft;
        }
    }

    /* JADX WARN: Code duplicated, block: B:29:0x00c5  */
    /* JADX WARN: Code duplicated, block: B:30:0x00c9  */
    /* JADX WARN: Code duplicated, block: B:33:0x00d3  */
    /* JADX WARN: Code duplicated, block: B:35:0x00d7  */
    /* JADX WARN: Code duplicated, block: B:37:0x00db  */
    /* JADX WARN: Code duplicated, block: B:38:0x00de  */
    /* JADX WARN: Code duplicated, block: B:40:0x00e6  */
    /* JADX WARN: Code duplicated, block: B:41:0x00f3  */
    /* JADX WARN: Code duplicated, block: B:42:0x00f5  */
    /* JADX WARN: Code duplicated, block: B:44:0x00fb  */
    /* JADX WARN: Code duplicated, block: B:45:0x0104  */
    /* JADX WARN: Code duplicated, block: B:46:0x0107  */
    /* JADX WARN: Code duplicated, block: B:49:0x011a  */
    void layoutHorizontal(int left, int top, int right, int bottom) {
        int childLeft;
        int start;
        int dir;
        int layoutDirection;
        int height;
        int childBaseline;
        int gravity;
        int gravity2;
        int gravity3;
        int childTop;
        int childTop2;
        int childTop3;
        boolean isLayoutRtl = ViewUtils.isLayoutRtl(this);
        int paddingTop = getPaddingTop();
        int height2 = bottom - top;
        int childBottom = height2 - getPaddingBottom();
        int childSpace = (height2 - paddingTop) - getPaddingBottom();
        int count = getVirtualChildCount();
        int i = this.mGravity;
        int majorGravity = i & GravityCompat.RELATIVE_HORIZONTAL_GRAVITY_MASK;
        int minorGravity = i & 112;
        boolean baselineAligned = this.mBaselineAligned;
        int[] maxAscent = this.mMaxAscent;
        int[] maxDescent = this.mMaxDescent;
        int layoutDirection2 = ViewCompat.getLayoutDirection(this);
        int absoluteGravity = GravityCompat.getAbsoluteGravity(majorGravity, layoutDirection2);
        if (absoluteGravity == 1) {
            int childLeft2 = getPaddingLeft();
            childLeft = childLeft2 + (((right - left) - this.mTotalLength) / 2);
        } else if (absoluteGravity == 5) {
            int childLeft3 = getPaddingLeft();
            childLeft = ((childLeft3 + right) - left) - this.mTotalLength;
        } else {
            childLeft = getPaddingLeft();
        }
        if (!isLayoutRtl) {
            start = 0;
            dir = 1;
        } else {
            int start2 = count - 1;
            start = start2;
            dir = -1;
        }
        int i2 = 0;
        while (i2 < count) {
            int childIndex = start + (dir * i2);
            boolean isLayoutRtl2 = isLayoutRtl;
            View child = getVirtualChildAt(childIndex);
            if (child == null) {
                childLeft += measureNullChild(childIndex);
                layoutDirection = layoutDirection2;
                height = height2;
            } else {
                int i3 = i2;
                int i4 = child.getVisibility();
                layoutDirection = layoutDirection2;
                if (i4 != 8) {
                    int childWidth = child.getMeasuredWidth();
                    int childHeight = child.getMeasuredHeight();
                    LayoutParams lp = (LayoutParams) child.getLayoutParams();
                    if (!baselineAligned) {
                        height = height2;
                    } else {
                        height = height2;
                        if (lp.height != -1) {
                            childBaseline = child.getBaseline();
                        }
                        gravity = lp.gravity;
                        if (gravity < 0) {
                            gravity2 = gravity;
                        } else {
                            gravity2 = minorGravity;
                        }
                        gravity3 = gravity2 & 112;
                        if (gravity3 != 16) {
                            int childTop4 = ((((childSpace - childHeight) / 2) + paddingTop) + lp.topMargin) - lp.bottomMargin;
                            childTop = childTop4;
                        } else if (gravity3 != 48) {
                            int childTop5 = lp.topMargin;
                            childTop2 = childTop5 + paddingTop;
                            if (childBaseline != -1) {
                                childTop = childTop2 + (maxAscent[1] - childBaseline);
                            } else {
                                childTop = childTop2;
                            }
                        } else if (gravity3 != 80) {
                            int childTop6 = childBottom - childHeight;
                            childTop3 = childTop6 - lp.bottomMargin;
                            if (childBaseline != -1) {
                                childTop = childTop3;
                            } else {
                                int descent = child.getMeasuredHeight() - childBaseline;
                                childTop = childTop3 - (maxDescent[2] - descent);
                            }
                        } else {
                            childTop = paddingTop;
                        }
                        if (hasDividerBeforeChildAt(childIndex)) {
                            childLeft += this.mDividerWidth;
                        }
                        int childLeft4 = childLeft + lp.leftMargin;
                        int childLeft5 = getLocationOffset(child);
                        setChildFrame(child, childLeft4 + childLeft5, childTop, childWidth, childHeight);
                        int childLeft6 = childLeft4 + childWidth + lp.rightMargin + getNextLocationOffset(child);
                        i2 = i3 + getChildrenSkipCount(child, childIndex);
                        childLeft = childLeft6;
                    }
                    childBaseline = -1;
                    gravity = lp.gravity;
                    if (gravity < 0) {
                        gravity2 = gravity;
                    } else {
                        gravity2 = minorGravity;
                    }
                    gravity3 = gravity2 & 112;
                    if (gravity3 != 16) {
                        int childTop7 = ((((childSpace - childHeight) / 2) + paddingTop) + lp.topMargin) - lp.bottomMargin;
                        childTop = childTop7;
                    } else if (gravity3 != 48) {
                        int childTop8 = lp.topMargin;
                        childTop2 = childTop8 + paddingTop;
                        if (childBaseline != -1) {
                            childTop = childTop2 + (maxAscent[1] - childBaseline);
                        } else {
                            childTop = childTop2;
                        }
                    } else if (gravity3 != 80) {
                        int childTop9 = childBottom - childHeight;
                        childTop3 = childTop9 - lp.bottomMargin;
                        if (childBaseline != -1) {
                            childTop = childTop3;
                        } else {
                            int descent2 = child.getMeasuredHeight() - childBaseline;
                            childTop = childTop3 - (maxDescent[2] - descent2);
                        }
                    } else {
                        childTop = paddingTop;
                    }
                    if (hasDividerBeforeChildAt(childIndex)) {
                        childLeft += this.mDividerWidth;
                    }
                    int childLeft7 = childLeft + lp.leftMargin;
                    int childLeft8 = getLocationOffset(child);
                    setChildFrame(child, childLeft7 + childLeft8, childTop, childWidth, childHeight);
                    int childLeft9 = childLeft7 + childWidth + lp.rightMargin + getNextLocationOffset(child);
                    i2 = i3 + getChildrenSkipCount(child, childIndex);
                    childLeft = childLeft9;
                } else {
                    height = height2;
                    i2 = i3;
                }
            }
            i2++;
            isLayoutRtl = isLayoutRtl2;
            layoutDirection2 = layoutDirection;
            height2 = height;
            count = count;
            paddingTop = paddingTop;
            maxDescent = maxDescent;
            maxAscent = maxAscent;
        }
    }

    private void setChildFrame(View child, int left, int top, int width, int height) {
        child.layout(left, top, left + width, top + height);
    }

    public void setOrientation(int orientation) {
        if (this.mOrientation != orientation) {
            this.mOrientation = orientation;
            requestLayout();
        }
    }

    public int getOrientation() {
        return this.mOrientation;
    }

    public void setGravity(int gravity) {
        if (this.mGravity != gravity) {
            if ((8388615 & gravity) == 0) {
                gravity |= GravityCompat.START;
            }
            if ((gravity & 112) == 0) {
                gravity |= 48;
            }
            this.mGravity = gravity;
            requestLayout();
        }
    }

    public int getGravity() {
        return this.mGravity;
    }

    public void setHorizontalGravity(int horizontalGravity) {
        int gravity = horizontalGravity & GravityCompat.RELATIVE_HORIZONTAL_GRAVITY_MASK;
        int i = this.mGravity;
        if ((8388615 & i) != gravity) {
            this.mGravity = ((-8388616) & i) | gravity;
            requestLayout();
        }
    }

    public void setVerticalGravity(int verticalGravity) {
        int gravity = verticalGravity & 112;
        int i = this.mGravity;
        if ((i & 112) != gravity) {
            this.mGravity = (i & (-113)) | gravity;
            requestLayout();
        }
    }

    @Override // android.view.ViewGroup
    public LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(getContext(), attrs);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.view.ViewGroup
    public LayoutParams generateDefaultLayoutParams() {
        int i = this.mOrientation;
        if (i == 0) {
            return new LayoutParams(-2, -2);
        }
        if (i == 1) {
            return new LayoutParams(-1, -2);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.view.ViewGroup
    public LayoutParams generateLayoutParams(ViewGroup.LayoutParams p) {
        return new LayoutParams(p);
    }

    @Override // android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return p instanceof LayoutParams;
    }

    @Override // android.view.View
    public void onInitializeAccessibilityEvent(AccessibilityEvent event) {
        super.onInitializeAccessibilityEvent(event);
        event.setClassName(ACCESSIBILITY_CLASS_NAME);
    }

    @Override // android.view.View
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        info.setClassName(ACCESSIBILITY_CLASS_NAME);
    }

    public static class LayoutParams extends LinearLayout.LayoutParams {
        public LayoutParams(Context c, AttributeSet attrs) {
            super(c, attrs);
        }

        public LayoutParams(int width, int height) {
            super(width, height);
        }

        public LayoutParams(int width, int height, float weight) {
            super(width, height, weight);
        }

        public LayoutParams(ViewGroup.LayoutParams p) {
            super(p);
        }

        public LayoutParams(ViewGroup.MarginLayoutParams source) {
            super(source);
        }
    }
}
