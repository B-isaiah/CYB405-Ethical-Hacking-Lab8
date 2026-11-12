.class public Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
.super Ljava/lang/Object;
.source "SmoothProgressDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mBackgroundDrawableWhenHidden:Landroid/graphics/drawable/Drawable;

.field private mColors:[I

.field private mGenerateBackgroundUsingColors:Z

.field private mGradients:Z

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mMirrorMode:Z

.field private mOnProgressiveStopEndedListener:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Callbacks;

.field private mProgressiveStartActivated:Z

.field private mProgressiveStartSpeed:F

.field private mProgressiveStopSpeed:F

.field private mReversed:Z

.field private mSectionsCount:I

.field private mSpeed:F

.field private mStrokeSeparatorLength:I

.field private mStrokeWidth:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 629
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;-><init>(Landroid/content/Context;Z)V

    .line 630
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "editMode"    # Z

    .line 632
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 633
    invoke-direct {p0, p1, p2}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->initValues(Landroid/content/Context;Z)V

    .line 634
    return-void
.end method

.method private initValues(Landroid/content/Context;Z)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "editMode"    # Z

    .line 659
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 660
    .local v0, "res":Landroid/content/res/Resources;
    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    iput-object v1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 661
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez p2, :cond_0

    .line 662
    sget v3, Lfr/castorflex/android/smoothprogressbar/R$integer;->spb_default_sections_count:I

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    iput v3, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mSectionsCount:I

    .line 663
    sget v3, Lfr/castorflex/android/smoothprogressbar/R$string;->spb_default_speed:I

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    iput v3, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mSpeed:F

    .line 664
    sget v3, Lfr/castorflex/android/smoothprogressbar/R$bool;->spb_default_reversed:I

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    iput-boolean v3, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mReversed:Z

    .line 665
    sget v3, Lfr/castorflex/android/smoothprogressbar/R$bool;->spb_default_progressiveStart_activated:I

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    iput-boolean v3, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mProgressiveStartActivated:Z

    .line 666
    new-array v1, v1, [I

    sget v3, Lfr/castorflex/android/smoothprogressbar/R$color;->spb_default_color:I

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    aput v3, v1, v2

    iput-object v1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mColors:[I

    .line 667
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$dimen;->spb_default_stroke_separator_length:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mStrokeSeparatorLength:I

    .line 668
    sget v1, Lfr/castorflex/android/smoothprogressbar/R$dimen;->spb_default_stroke_width:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mStrokeWidth:F

    goto :goto_0

    .line 670
    :cond_0
    const/4 v3, 0x4

    iput v3, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mSectionsCount:I

    .line 671
    const/high16 v4, 0x3f800000    # 1.0f

    iput v4, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mSpeed:F

    .line 672
    iput-boolean v2, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mReversed:Z

    .line 673
    iput-boolean v2, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mProgressiveStartActivated:Z

    .line 674
    new-array v1, v1, [I

    const v4, -0xcc4a1b

    aput v4, v1, v2

    iput-object v1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mColors:[I

    .line 675
    iput v3, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mStrokeSeparatorLength:I

    .line 676
    const/high16 v1, 0x40800000    # 4.0f

    iput v1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mStrokeWidth:F

    .line 678
    :goto_0
    iget v1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mSpeed:F

    iput v1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mProgressiveStartSpeed:F

    .line 679
    iput v1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mProgressiveStopSpeed:F

    .line 680
    iput-boolean v2, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mGradients:Z

    .line 681
    return-void
.end method


# virtual methods
.method public backgroundDrawable(Landroid/graphics/drawable/Drawable;)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 0
    .param p1, "backgroundDrawableWhenHidden"    # Landroid/graphics/drawable/Drawable;

    .line 757
    iput-object p1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mBackgroundDrawableWhenHidden:Landroid/graphics/drawable/Drawable;

    .line 758
    return-object p0
.end method

.method public build()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;
    .locals 18

    .line 637
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mGenerateBackgroundUsingColors:Z

    if-eqz v1, :cond_0

    .line 638
    iget-object v1, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mColors:[I

    iget v2, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mStrokeWidth:F

    invoke-static {v1, v2}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBarUtils;->generateDrawableWithColors([IF)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mBackgroundDrawableWhenHidden:Landroid/graphics/drawable/Drawable;

    .line 640
    :cond_0
    new-instance v1, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    iget-object v3, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mInterpolator:Landroid/view/animation/Interpolator;

    iget v4, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mSectionsCount:I

    iget v5, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mStrokeSeparatorLength:I

    iget-object v6, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mColors:[I

    iget v7, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mStrokeWidth:F

    iget v8, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mSpeed:F

    iget v9, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mProgressiveStartSpeed:F

    iget v10, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mProgressiveStopSpeed:F

    iget-boolean v11, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mReversed:Z

    iget-boolean v12, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mMirrorMode:Z

    iget-object v13, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mOnProgressiveStopEndedListener:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Callbacks;

    iget-boolean v14, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mProgressiveStartActivated:Z

    iget-object v15, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mBackgroundDrawableWhenHidden:Landroid/graphics/drawable/Drawable;

    iget-boolean v2, v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mGradients:Z

    const/16 v17, 0x0

    move/from16 v16, v2

    move-object v2, v1

    invoke-direct/range {v2 .. v17}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;-><init>(Landroid/view/animation/Interpolator;II[IFFFFZZLfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Callbacks;ZLandroid/graphics/drawable/Drawable;ZLfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;)V

    .line 655
    .local v1, "ret":Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;
    return-object v1
.end method

.method public callbacks(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Callbacks;)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 0
    .param p1, "onProgressiveStopEndedListener"    # Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Callbacks;

    .line 752
    iput-object p1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mOnProgressiveStopEndedListener:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Callbacks;

    .line 753
    return-object p0
.end method

.method public color(I)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 2
    .param p1, "color"    # I

    .line 702
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput p1, v0, v1

    iput-object v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mColors:[I

    .line 703
    return-object p0
.end method

.method public colors([I)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 0
    .param p1, "colors"    # [I

    .line 707
    invoke-static {p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBarUtils;->checkColors([I)V

    .line 708
    iput-object p1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mColors:[I

    .line 709
    return-object p0
.end method

.method public generateBackgroundUsingColors()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 1

    .line 762
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mGenerateBackgroundUsingColors:Z

    .line 763
    return-object p0
.end method

.method public gradients()Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 1

    .line 767
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->gradients(Z)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;

    move-result-object v0

    return-object v0
.end method

.method public gradients(Z)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 0
    .param p1, "useGradients"    # Z

    .line 771
    iput-boolean p1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mGradients:Z

    .line 772
    return-object p0
.end method

.method public interpolator(Landroid/view/animation/Interpolator;)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 1
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .line 684
    const-string v0, "Interpolator"

    invoke-static {p1, v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBarUtils;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 685
    iput-object p1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 686
    return-object p0
.end method

.method public mirrorMode(Z)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 0
    .param p1, "mirrorMode"    # Z

    .line 742
    iput-boolean p1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mMirrorMode:Z

    .line 743
    return-object p0
.end method

.method public progressiveStart(Z)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 0
    .param p1, "progressiveStartActivated"    # Z

    .line 747
    iput-boolean p1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mProgressiveStartActivated:Z

    .line 748
    return-object p0
.end method

.method public progressiveStartSpeed(F)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 0
    .param p1, "progressiveStartSpeed"    # F

    .line 725
    invoke-static {p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBarUtils;->checkSpeed(F)V

    .line 726
    iput p1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mProgressiveStartSpeed:F

    .line 727
    return-object p0
.end method

.method public progressiveStopSpeed(F)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 0
    .param p1, "progressiveStopSpeed"    # F

    .line 731
    invoke-static {p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBarUtils;->checkSpeed(F)V

    .line 732
    iput p1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mProgressiveStopSpeed:F

    .line 733
    return-object p0
.end method

.method public reversed(Z)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 0
    .param p1, "reversed"    # Z

    .line 737
    iput-boolean p1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mReversed:Z

    .line 738
    return-object p0
.end method

.method public sectionsCount(I)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 1
    .param p1, "sectionsCount"    # I

    .line 690
    const-string v0, "Sections count"

    invoke-static {p1, v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBarUtils;->checkPositive(ILjava/lang/String;)V

    .line 691
    iput p1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mSectionsCount:I

    .line 692
    return-object p0
.end method

.method public separatorLength(I)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 2
    .param p1, "separatorLength"    # I

    .line 696
    int-to-float v0, p1

    const-string v1, "Separator length"

    invoke-static {v0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBarUtils;->checkPositiveOrZero(FLjava/lang/String;)V

    .line 697
    iput p1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mStrokeSeparatorLength:I

    .line 698
    return-object p0
.end method

.method public speed(F)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 0
    .param p1, "speed"    # F

    .line 719
    invoke-static {p1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBarUtils;->checkSpeed(F)V

    .line 720
    iput p1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mSpeed:F

    .line 721
    return-object p0
.end method

.method public strokeWidth(F)Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;
    .locals 1
    .param p1, "width"    # F

    .line 713
    const-string v0, "Width"

    invoke-static {p1, v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBarUtils;->checkPositiveOrZero(FLjava/lang/String;)V

    .line 714
    iput p1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$Builder;->mStrokeWidth:F

    .line 715
    return-object p0
.end method
