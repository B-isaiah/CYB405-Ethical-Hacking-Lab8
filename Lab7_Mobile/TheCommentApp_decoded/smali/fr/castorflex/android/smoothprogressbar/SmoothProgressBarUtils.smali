.class public final Lfr/castorflex/android/smoothprogressbar/SmoothProgressBarUtils;
.super Ljava/lang/Object;
.source "SmoothProgressBarUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    return-void
.end method

.method static checkAngle(I)V
    .locals 4
    .param p0, "angle"    # I

    .line 30
    if-ltz p0, :cond_0

    const/16 v0, 0x168

    if-gt p0, v0, :cond_0

    .line 32
    return-void

    .line 31
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "Illegal angle %d: must be >=0 and <= 360"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static checkColors([I)V
    .locals 2
    .param p0, "colors"    # [I

    .line 25
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    .line 27
    return-void

    .line 26
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You must provide at least 1 color"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 3
    .param p0, "o"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;

    .line 45
    if-eqz p0, :cond_0

    .line 47
    return-void

    .line 46
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "%s must be not null"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static checkPositive(ILjava/lang/String;)V
    .locals 3
    .param p0, "number"    # I
    .param p1, "name"    # Ljava/lang/String;

    .line 40
    if-lez p0, :cond_0

    .line 42
    return-void

    .line 41
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "%s must not be null"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static checkPositiveOrZero(FLjava/lang/String;)V
    .locals 4
    .param p0, "number"    # F
    .param p1, "name"    # Ljava/lang/String;

    .line 35
    const/4 v0, 0x0

    cmpg-float v0, p0, v0

    if-ltz v0, :cond_0

    .line 37
    return-void

    .line 36
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "%s %d must be positive"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static checkSpeed(F)V
    .locals 2
    .param p0, "speed"    # F

    .line 20
    const/4 v0, 0x0

    cmpg-float v0, p0, v0

    if-lez v0, :cond_0

    .line 22
    return-void

    .line 21
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Speed must be >= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static generateDrawableWithColors([IF)Landroid/graphics/drawable/Drawable;
    .locals 2
    .param p0, "colors"    # [I
    .param p1, "strokeWidth"    # F

    .line 14
    if-eqz p0, :cond_1

    array-length v0, p0

    if-nez v0, :cond_0

    goto :goto_0

    .line 16
    :cond_0
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v1, Lfr/castorflex/android/smoothprogressbar/ColorsShape;

    invoke-direct {v1, p1, p0}, Lfr/castorflex/android/smoothprogressbar/ColorsShape;-><init>(F[I)V

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    return-object v0

    .line 14
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method
