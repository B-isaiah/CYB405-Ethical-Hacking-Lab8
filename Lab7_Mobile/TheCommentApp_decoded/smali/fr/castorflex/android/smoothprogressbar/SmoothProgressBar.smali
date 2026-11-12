.class public Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;
.super Landroid/widget/ProgressBar;
.source "SmoothProgressBar.java"


# static fields
.field private static final INTERPOLATOR_ACCELERATE:I = 0x0

.field private static final INTERPOLATOR_ACCELERATEDECELERATE:I = 0x2

.field private static final INTERPOLATOR_DECELERATE:I = 0x3

.field private static final INTERPOLATOR_LINEAR:I = 0x1


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 27
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 31
    sget v0, Lfr/castorflex/android/smoothprogressbar/R$attr;->spbStyle:I

    invoke-direct {p0, p1, p2, v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 22
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .line 35
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct/range {p0 .. p3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    invoke-virtual/range {p0 .. p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->isInEditMode()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 38
    new-instance v2, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    invoke-direct {v2, v1, v3}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;-><init>(Landroid/content/Context;Z)V

    invoke-virtual {v2}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->build()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 39
    return-void

    .line 42
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 43
    .local v2, "res":Landroid/content/res/Resources;
    sget-object v4, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar:[I

    const/4 v5, 0x0

    move-object/from16 v6, p2

    move/from16 v7, p3

    invoke-virtual {v1, v6, v4, v7, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v4

    .line 46
    .local v4, "a":Landroid/content/res/TypedArray;
    sget v8, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_color:I

    sget v9, Lfr/castorflex/android/smoothprogressbar/R$color;->spb_default_color:I

    invoke-virtual {v2, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v4, v8, v9}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v8

    .line 47
    .local v8, "color":I
    sget v9, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_sections_count:I

    sget v10, Lfr/castorflex/android/smoothprogressbar/R$integer;->spb_default_sections_count:I

    invoke-virtual {v2, v10}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v10

    invoke-virtual {v4, v9, v10}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v9

    .line 48
    .local v9, "sectionsCount":I
    sget v10, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_stroke_separator_length:I

    sget v11, Lfr/castorflex/android/smoothprogressbar/R$dimen;->spb_default_stroke_separator_length:I

    invoke-virtual {v2, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    invoke-virtual {v4, v10, v11}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v10

    .line 49
    .local v10, "separatorLength":I
    sget v11, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_stroke_width:I

    sget v12, Lfr/castorflex/android/smoothprogressbar/R$dimen;->spb_default_stroke_width:I

    invoke-virtual {v2, v12}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v12

    invoke-virtual {v4, v11, v12}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v11

    .line 50
    .local v11, "strokeWidth":F
    sget v12, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_speed:I

    sget v13, Lfr/castorflex/android/smoothprogressbar/R$string;->spb_default_speed:I

    invoke-virtual {v2, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v13

    invoke-virtual {v4, v12, v13}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v12

    .line 51
    .local v12, "speed":F
    sget v13, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_progressiveStart_speed:I

    invoke-virtual {v4, v13, v12}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v13

    .line 52
    .local v13, "speedProgressiveStart":F
    sget v14, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_progressiveStop_speed:I

    invoke-virtual {v4, v14, v12}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v14

    .line 53
    .local v14, "speedProgressiveStop":F
    sget v15, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_interpolator:I

    const/4 v3, -0x1

    invoke-virtual {v4, v15, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v15

    .line 54
    .local v15, "iInterpolator":I
    sget v3, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_reversed:I

    sget v5, Lfr/castorflex/android/smoothprogressbar/R$bool;->spb_default_reversed:I

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    invoke-virtual {v4, v3, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    .line 55
    .local v3, "reversed":Z
    sget v5, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_mirror_mode:I

    sget v6, Lfr/castorflex/android/smoothprogressbar/R$bool;->spb_default_mirror_mode:I

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v6

    invoke-virtual {v4, v5, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    .line 56
    .local v5, "mirrorMode":Z
    sget v6, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_colors:I

    const/4 v7, 0x0

    invoke-virtual {v4, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    .line 57
    .local v6, "colorsId":I
    sget v7, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_progressiveStart_activated:I

    sget v0, Lfr/castorflex/android/smoothprogressbar/R$bool;->spb_default_progressiveStart_activated:I

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    invoke-virtual {v4, v7, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    .line 58
    .local v0, "progressiveStartActivated":Z
    sget v7, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_background:I

    invoke-virtual {v4, v7}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 59
    .local v7, "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    move/from16 v19, v8

    .end local v8    # "color":I
    .local v19, "color":I
    sget v8, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_generate_background_with_colors:I

    move-object/from16 v20, v7

    const/4 v7, 0x0

    .end local v7    # "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    .local v20, "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v4, v8, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v8

    .line 60
    .local v8, "generateBackgroundWithColors":Z
    move/from16 v18, v8

    .end local v8    # "generateBackgroundWithColors":Z
    .local v18, "generateBackgroundWithColors":Z
    sget v8, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_gradients:I

    invoke-virtual {v4, v8, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    .line 61
    .local v7, "gradients":Z
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 64
    const/4 v8, 0x0

    .line 65
    .local v8, "interpolator":Landroid/view/animation/Interpolator;
    move-object/from16 v21, v4

    const/4 v4, -0x1

    .end local v4    # "a":Landroid/content/res/TypedArray;
    .local v21, "a":Landroid/content/res/TypedArray;
    if-ne v15, v4, :cond_1

    .line 66
    invoke-virtual/range {p0 .. p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->getInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v8

    .line 68
    :cond_1
    if-nez v8, :cond_5

    .line 69
    const/4 v4, 0x1

    if-eq v15, v4, :cond_4

    const/4 v4, 0x2

    if-eq v15, v4, :cond_3

    const/4 v4, 0x3

    if-eq v15, v4, :cond_2

    .line 81
    new-instance v4, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    move-object v8, v4

    goto :goto_0

    .line 74
    :cond_2
    new-instance v4, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    move-object v8, v4

    .line 75
    goto :goto_0

    .line 71
    :cond_3
    new-instance v4, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    move-object v8, v4

    .line 72
    goto :goto_0

    .line 77
    :cond_4
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    move-object v8, v4

    .line 85
    :cond_5
    :goto_0
    const/4 v4, 0x0

    .line 87
    .local v4, "colors":[I
    if-eqz v6, :cond_6

    .line 88
    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v4

    .line 91
    :cond_6
    move-object/from16 v16, v2

    .end local v2    # "res":Landroid/content/res/Resources;
    .local v16, "res":Landroid/content/res/Resources;
    new-instance v2, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    invoke-direct {v2, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;-><init>(Landroid/content/Context;)V

    .line 92
    invoke-virtual {v2, v12}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->speed(F)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    move-result-object v2

    .line 93
    invoke-virtual {v2, v13}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->progressiveStartSpeed(F)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    move-result-object v2

    .line 94
    invoke-virtual {v2, v14}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->progressiveStopSpeed(F)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    move-result-object v2

    .line 95
    invoke-virtual {v2, v8}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->interpolator(Landroid/view/animation/Interpolator;)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    move-result-object v2

    .line 96
    invoke-virtual {v2, v9}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->sectionsCount(I)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    move-result-object v2

    .line 97
    invoke-virtual {v2, v10}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->separatorLength(I)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    move-result-object v2

    .line 98
    invoke-virtual {v2, v11}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->strokeWidth(F)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    move-result-object v2

    .line 99
    invoke-virtual {v2, v3}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->reversed(Z)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    move-result-object v2

    .line 100
    invoke-virtual {v2, v5}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mirrorMode(Z)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    move-result-object v2

    .line 101
    invoke-virtual {v2, v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->progressiveStart(Z)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    move-result-object v2

    .line 102
    invoke-virtual {v2, v7}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->gradients(Z)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    move-result-object v2

    .line 104
    .local v2, "builder":Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    if-eqz v20, :cond_7

    .line 105
    move/from16 v17, v0

    move-object/from16 v0, v20

    .end local v20    # "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    .local v0, "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    .local v17, "progressiveStartActivated":Z
    invoke-virtual {v2, v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->backgroundDrawable(Landroid/graphics/drawable/Drawable;)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    goto :goto_1

    .line 104
    .end local v17    # "progressiveStartActivated":Z
    .local v0, "progressiveStartActivated":Z
    .restart local v20    # "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    :cond_7
    move/from16 v17, v0

    move-object/from16 v0, v20

    .line 108
    .end local v20    # "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    .local v0, "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    .restart local v17    # "progressiveStartActivated":Z
    :goto_1
    if-eqz v18, :cond_8

    .line 109
    invoke-virtual {v2}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->generateBackgroundUsingColors()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    .line 112
    :cond_8
    if-eqz v4, :cond_9

    move-object/from16 v20, v0

    .end local v0    # "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    .restart local v20    # "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    array-length v0, v4

    if-lez v0, :cond_a

    .line 113
    invoke-virtual {v2, v4}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->colors([I)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    move/from16 v0, v19

    goto :goto_2

    .line 112
    .end local v20    # "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    .restart local v0    # "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    :cond_9
    move-object/from16 v20, v0

    .line 115
    .end local v0    # "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    .restart local v20    # "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    :cond_a
    move/from16 v0, v19

    .end local v19    # "color":I
    .local v0, "color":I
    invoke-virtual {v2, v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->color(I)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    .line 117
    :goto_2
    move/from16 v19, v0

    .end local v0    # "color":I
    .restart local v19    # "color":I
    invoke-virtual {v2}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->build()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    .line 118
    .local v0, "d":Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;
    move-object/from16 v1, p0

    invoke-virtual {v1, v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 119
    return-void
.end method

.method private checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;
    .locals 3

    .line 210
    invoke-virtual {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 211
    .local v0, "ret":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    instance-of v1, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    if-eqz v1, :cond_0

    .line 213
    move-object v1, v0

    check-cast v1, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    return-object v1

    .line 212
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "The drawable is not a SmoothProgressDrawable"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public applyStyle(I)V
    .locals 5
    .param p1, "styleResId"    # I

    .line 122
    invoke-virtual {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar:[I

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3, p1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 124
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_color:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 125
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_color:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    invoke-virtual {p0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setSmoothProgressDrawableColor(I)V

    .line 127
    :cond_0
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_colors:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 128
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_colors:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 129
    .local v1, "colorsId":I
    if-eqz v1, :cond_1

    .line 130
    invoke-virtual {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v2

    .line 131
    .local v2, "colors":[I
    if-eqz v2, :cond_1

    array-length v4, v2

    if-lez v4, :cond_1

    .line 132
    invoke-virtual {p0, v2}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setSmoothProgressDrawableColors([I)V

    .line 135
    .end local v1    # "colorsId":I
    .end local v2    # "colors":[I
    :cond_1
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_sections_count:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 136
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_sections_count:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    invoke-virtual {p0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setSmoothProgressDrawableSectionsCount(I)V

    .line 138
    :cond_2
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_stroke_separator_length:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 139
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_stroke_separator_length:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    invoke-virtual {p0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setSmoothProgressDrawableSeparatorLength(I)V

    .line 141
    :cond_3
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_stroke_width:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_4

    .line 142
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_stroke_width:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    invoke-virtual {p0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setSmoothProgressDrawableStrokeWidth(F)V

    .line 144
    :cond_4
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_speed:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 145
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_speed:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    invoke-virtual {p0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setSmoothProgressDrawableSpeed(F)V

    .line 147
    :cond_5
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_progressiveStart_speed:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 148
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_progressiveStart_speed:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    invoke-virtual {p0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setSmoothProgressDrawableProgressiveStartSpeed(F)V

    .line 150
    :cond_6
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_progressiveStop_speed:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 151
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_progressiveStop_speed:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    invoke-virtual {p0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setSmoothProgressDrawableProgressiveStopSpeed(F)V

    .line 153
    :cond_7
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_reversed:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 154
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_reversed:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setSmoothProgressDrawableReversed(Z)V

    .line 156
    :cond_8
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_mirror_mode:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 157
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_mirror_mode:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setSmoothProgressDrawableMirrorMode(Z)V

    .line 159
    :cond_9
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_progressiveStart_activated:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 160
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_progressiveStart_activated:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setProgressiveStartActivated(Z)V

    .line 162
    :cond_a
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_progressiveStart_activated:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 163
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_progressiveStart_activated:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setProgressiveStartActivated(Z)V

    .line 165
    :cond_b
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_gradients:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 166
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_gradients:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setSmoothProgressDrawableUseGradients(Z)V

    .line 168
    :cond_c
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_generate_background_with_colors:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 169
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_generate_background_with_colors:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 170
    nop

    .line 171
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v1

    invoke-virtual {v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->getColors()[I

    move-result-object v1

    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v2

    invoke-virtual {v2}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->getStrokeWidth()F

    move-result v2

    invoke-static {v1, v2}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBarUtils;->generateDrawableWithColors([IF)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 170
    invoke-virtual {p0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setSmoothProgressDrawableBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 174
    :cond_d
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_interpolator:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 175
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$styleable;->SmoothProgressBar_spb_interpolator:I

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    .line 177
    .local v1, "iInterpolator":I
    if-eqz v1, :cond_11

    const/4 v2, 0x1

    if-eq v1, v2, :cond_10

    const/4 v2, 0x2

    if-eq v1, v2, :cond_f

    const/4 v2, 0x3

    if-eq v1, v2, :cond_e

    .line 191
    const/4 v2, 0x0

    .local v2, "interpolator":Landroid/view/animation/Interpolator;
    goto :goto_0

    .line 182
    .end local v2    # "interpolator":Landroid/view/animation/Interpolator;
    :cond_e
    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 183
    .restart local v2    # "interpolator":Landroid/view/animation/Interpolator;
    goto :goto_0

    .line 179
    .end local v2    # "interpolator":Landroid/view/animation/Interpolator;
    :cond_f
    new-instance v2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 180
    .restart local v2    # "interpolator":Landroid/view/animation/Interpolator;
    goto :goto_0

    .line 185
    .end local v2    # "interpolator":Landroid/view/animation/Interpolator;
    :cond_10
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 186
    .restart local v2    # "interpolator":Landroid/view/animation/Interpolator;
    goto :goto_0

    .line 188
    .end local v2    # "interpolator":Landroid/view/animation/Interpolator;
    :cond_11
    new-instance v2, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 189
    .restart local v2    # "interpolator":Landroid/view/animation/Interpolator;
    nop

    .line 193
    :goto_0
    if-eqz v2, :cond_12

    .line 194
    invoke-virtual {p0, v2}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 197
    .end local v1    # "iInterpolator":I
    .end local v2    # "interpolator":Landroid/view/animation/Interpolator;
    :cond_12
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 198
    return-void
.end method

.method protected declared-synchronized onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    monitor-enter p0

    .line 202
    :try_start_0
    invoke-super {p0, p1}, Landroid/widget/ProgressBar;->onDraw(Landroid/graphics/Canvas;)V

    .line 203
    invoke-virtual {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->isIndeterminate()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    if-eqz v0, :cond_0

    .line 204
    invoke-virtual {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-virtual {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 205
    invoke-virtual {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 207
    .end local p0    # "this":Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;
    :cond_0
    monitor-exit p0

    return-void

    .line 201
    .end local p1    # "canvas":Landroid/graphics/Canvas;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public progressiveStart()V
    .locals 1

    .line 285
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->progressiveStart()V

    .line 286
    return-void
.end method

.method public progressiveStop()V
    .locals 1

    .line 289
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->progressiveStop()V

    .line 290
    return-void
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)V
    .locals 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .line 218
    invoke-super {p0, p1}, Landroid/widget/ProgressBar;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 219
    invoke-virtual {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 220
    .local v0, "ret":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    instance-of v1, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    if-eqz v1, :cond_0

    .line 221
    move-object v1, v0

    check-cast v1, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-virtual {v1, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 222
    :cond_0
    return-void
.end method

.method public setProgressiveStartActivated(Z)V
    .locals 1
    .param p1, "progressiveStartActivated"    # Z

    .line 269
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setProgressiveStartActivated(Z)V

    .line 270
    return-void
.end method

.method public setSmoothProgressDrawableBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .line 277
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 278
    return-void
.end method

.method public setSmoothProgressDrawableCallbacks(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Callbacks;)V
    .locals 1
    .param p1, "listener"    # Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Callbacks;

    .line 273
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setCallbacks(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Callbacks;)V

    .line 274
    return-void
.end method

.method public setSmoothProgressDrawableColor(I)V
    .locals 1
    .param p1, "color"    # I

    .line 233
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setColor(I)V

    .line 234
    return-void
.end method

.method public setSmoothProgressDrawableColors([I)V
    .locals 1
    .param p1, "colors"    # [I

    .line 229
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setColors([I)V

    .line 230
    return-void
.end method

.method public setSmoothProgressDrawableInterpolator(Landroid/view/animation/Interpolator;)V
    .locals 1
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .line 225
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 226
    return-void
.end method

.method public setSmoothProgressDrawableMirrorMode(Z)V
    .locals 1
    .param p1, "mirrorMode"    # Z

    .line 265
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setMirrorMode(Z)V

    .line 266
    return-void
.end method

.method public setSmoothProgressDrawableProgressiveStartSpeed(F)V
    .locals 1
    .param p1, "speed"    # F

    .line 241
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setProgressiveStartSpeed(F)V

    .line 242
    return-void
.end method

.method public setSmoothProgressDrawableProgressiveStopSpeed(F)V
    .locals 1
    .param p1, "speed"    # F

    .line 245
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setProgressiveStopSpeed(F)V

    .line 246
    return-void
.end method

.method public setSmoothProgressDrawableReversed(Z)V
    .locals 1
    .param p1, "reversed"    # Z

    .line 261
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setReversed(Z)V

    .line 262
    return-void
.end method

.method public setSmoothProgressDrawableSectionsCount(I)V
    .locals 1
    .param p1, "sectionsCount"    # I

    .line 249
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setSectionsCount(I)V

    .line 250
    return-void
.end method

.method public setSmoothProgressDrawableSeparatorLength(I)V
    .locals 1
    .param p1, "separatorLength"    # I

    .line 253
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setSeparatorLength(I)V

    .line 254
    return-void
.end method

.method public setSmoothProgressDrawableSpeed(F)V
    .locals 1
    .param p1, "speed"    # F

    .line 237
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setSpeed(F)V

    .line 238
    return-void
.end method

.method public setSmoothProgressDrawableStrokeWidth(F)V
    .locals 1
    .param p1, "strokeWidth"    # F

    .line 257
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setStrokeWidth(F)V

    .line 258
    return-void
.end method

.method public setSmoothProgressDrawableUseGradients(Z)V
    .locals 1
    .param p1, "useGradients"    # Z

    .line 281
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->checkIndeterminateDrawable()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->setUseGradients(Z)V

    .line 282
    return-void
.end method
