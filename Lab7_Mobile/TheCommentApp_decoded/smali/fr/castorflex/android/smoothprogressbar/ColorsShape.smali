.class public Lfr/castorflex/android/smoothprogressbar/ColorsShape;
.super Landroid/graphics/drawable/shapes/Shape;
.source "ColorsShape.java"


# instance fields
.field private mColors:[I

.field private mStrokeWidth:F


# direct methods
.method public constructor <init>(F[I)V
    .locals 0
    .param p1, "strokeWidth"    # F
    .param p2, "colors"    # [I

    .line 15
    invoke-direct {p0}, Landroid/graphics/drawable/shapes/Shape;-><init>()V

    .line 16
    iput p1, p0, Lfr/castorflex/android/smoothprogressbar/ColorsShape;->mStrokeWidth:F

    .line 17
    iput-object p2, p0, Lfr/castorflex/android/smoothprogressbar/ColorsShape;->mColors:[I

    .line 18
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .locals 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;

    .line 38
    move-object v0, p0

    move-object/from16 v7, p2

    iget-object v1, v0, Lfr/castorflex/android/smoothprogressbar/ColorsShape;->mColors:[I

    array-length v1, v1

    int-to-float v1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    div-float v8, v2, v1

    .line 39
    .local v8, "ratio":F
    const/4 v1, 0x0

    .line 40
    .local v1, "i":I
    iget v2, v0, Lfr/castorflex/android/smoothprogressbar/ColorsShape;->mStrokeWidth:F

    invoke-virtual {v7, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 41
    iget-object v9, v0, Lfr/castorflex/android/smoothprogressbar/ColorsShape;->mColors:[I

    array-length v10, v9

    const/4 v2, 0x0

    move v11, v2

    :goto_0
    if-ge v11, v10, :cond_0

    aget v12, v9, v11

    .line 42
    .local v12, "color":I
    invoke-virtual {v7, v12}, Landroid/graphics/Paint;->setColor(I)V

    .line 43
    int-to-float v2, v1

    mul-float/2addr v2, v8

    invoke-virtual {p0}, Lfr/castorflex/android/smoothprogressbar/ColorsShape;->getWidth()F

    move-result v3

    mul-float/2addr v2, v3

    invoke-virtual {p0}, Lfr/castorflex/android/smoothprogressbar/ColorsShape;->getHeight()F

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    add-int/lit8 v13, v1, 0x1

    .end local v1    # "i":I
    .local v13, "i":I
    int-to-float v1, v13

    mul-float/2addr v1, v8

    invoke-virtual {p0}, Lfr/castorflex/android/smoothprogressbar/ColorsShape;->getWidth()F

    move-result v5

    mul-float/2addr v5, v1

    invoke-virtual {p0}, Lfr/castorflex/android/smoothprogressbar/ColorsShape;->getHeight()F

    move-result v1

    div-float v6, v1, v4

    move-object v1, p1

    move v4, v5

    move v5, v6

    move-object/from16 v6, p2

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 41
    .end local v12    # "color":I
    add-int/lit8 v11, v11, 0x1

    move v1, v13

    goto :goto_0

    .line 45
    .end local v13    # "i":I
    .restart local v1    # "i":I
    :cond_0
    return-void
.end method

.method public getColors()[I
    .locals 1

    .line 29
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/ColorsShape;->mColors:[I

    return-object v0
.end method

.method public getStrokeWidth()F
    .locals 1

    .line 21
    iget v0, p0, Lfr/castorflex/android/smoothprogressbar/ColorsShape;->mStrokeWidth:F

    return v0
.end method

.method public setColors([I)V
    .locals 0
    .param p1, "colors"    # [I

    .line 33
    iput-object p1, p0, Lfr/castorflex/android/smoothprogressbar/ColorsShape;->mColors:[I

    .line 34
    return-void
.end method

.method public setStrokeWidth(F)V
    .locals 0
    .param p1, "strokeWidth"    # F

    .line 25
    iput p1, p0, Lfr/castorflex/android/smoothprogressbar/ColorsShape;->mStrokeWidth:F

    .line 26
    return-void
.end method
