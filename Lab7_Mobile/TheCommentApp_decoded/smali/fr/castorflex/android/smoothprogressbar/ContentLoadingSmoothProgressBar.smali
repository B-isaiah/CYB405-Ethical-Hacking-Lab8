.class public Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;
.super Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;
.source "ContentLoadingSmoothProgressBar.java"


# static fields
.field private static final MIN_DELAY:I = 0x1f4

.field private static final MIN_SHOW_TIME:I = 0x1f4


# instance fields
.field private final mDelayedHide:Ljava/lang/Runnable;

.field private final mDelayedShow:Ljava/lang/Runnable;

.field private mDismissed:Z

.field private mPostedHide:Z

.field private mPostedShow:Z

.field private mStartTime:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 47
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mStartTime:J

    .line 18
    iput-boolean v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mPostedHide:Z

    .line 20
    iput-boolean v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mPostedShow:Z

    .line 22
    iput-boolean v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mDismissed:Z

    .line 24
    new-instance v0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar$1;

    invoke-direct {v0, p0}, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar$1;-><init>(Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;)V

    iput-object v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    .line 34
    new-instance v0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar$2;

    invoke-direct {v0, p0}, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar$2;-><init>(Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;)V

    iput-object v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    .line 52
    return-void
.end method

.method static synthetic access$002(Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;Z)Z
    .locals 0
    .param p0, "x0"    # Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;
    .param p1, "x1"    # Z

    .line 11
    iput-boolean p1, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mPostedHide:Z

    return p1
.end method

.method static synthetic access$102(Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;J)J
    .locals 0
    .param p0, "x0"    # Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;
    .param p1, "x1"    # J

    .line 11
    iput-wide p1, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mStartTime:J

    return-wide p1
.end method

.method static synthetic access$202(Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;Z)Z
    .locals 0
    .param p0, "x0"    # Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;
    .param p1, "x1"    # Z

    .line 11
    iput-boolean p1, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mPostedShow:Z

    return p1
.end method

.method static synthetic access$300(Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;)Z
    .locals 1
    .param p0, "x0"    # Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;

    .line 11
    iget-boolean v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mDismissed:Z

    return v0
.end method

.method private removeCallbacks()V
    .locals 1

    .line 67
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 68
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 69
    return-void
.end method


# virtual methods
.method public hide()V
    .locals 9

    .line 77
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mDismissed:Z

    .line 78
    iget-object v1, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 79
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mStartTime:J

    sub-long/2addr v1, v3

    .line 80
    .local v1, "diff":J
    const-wide/16 v5, 0x1f4

    cmp-long v7, v1, v5

    if-gez v7, :cond_1

    const-wide/16 v7, -0x1

    cmp-long v3, v3, v7

    if-nez v3, :cond_0

    goto :goto_0

    .line 89
    :cond_0
    iget-boolean v3, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mPostedHide:Z

    if-nez v3, :cond_2

    .line 90
    iget-object v3, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    sub-long/2addr v5, v1

    invoke-virtual {p0, v3, v5, v6}, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 91
    iput-boolean v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mPostedHide:Z

    goto :goto_1

    .line 84
    :cond_1
    :goto_0
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->setVisibility(I)V

    .line 94
    :cond_2
    :goto_1
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 56
    invoke-super {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->onAttachedToWindow()V

    .line 57
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->removeCallbacks()V

    .line 58
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 62
    invoke-super {p0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->onDetachedFromWindow()V

    .line 63
    invoke-direct {p0}, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->removeCallbacks()V

    .line 64
    return-void
.end method

.method public show()V
    .locals 3

    .line 102
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mStartTime:J

    .line 103
    const/4 v0, 0x0

    iput-boolean v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mDismissed:Z

    .line 104
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 105
    iget-boolean v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mPostedShow:Z

    if-nez v0, :cond_0

    .line 106
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    const-wide/16 v1, 0x1f4

    invoke-virtual {p0, v0, v1, v2}, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 107
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfr/castorflex/android/smoothprogressbar/ContentLoadingSmoothProgressBar;->mPostedShow:Z

    .line 109
    :cond_0
    return-void
.end method
