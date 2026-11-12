.class public Les/dmoral/toasty/Toasty$Config;
.super Ljava/lang/Object;
.source "Toasty.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Les/dmoral/toasty/Toasty;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Config"
.end annotation


# instance fields
.field private allowQueue:Z

.field private textSize:I

.field private tintIcon:Z

.field private typeface:Landroid/graphics/Typeface;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 344
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 338
    invoke-static {}, Les/dmoral/toasty/Toasty;->access$000()Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Les/dmoral/toasty/Toasty$Config;->typeface:Landroid/graphics/Typeface;

    .line 339
    invoke-static {}, Les/dmoral/toasty/Toasty;->access$100()I

    move-result v0

    iput v0, p0, Les/dmoral/toasty/Toasty$Config;->textSize:I

    .line 341
    invoke-static {}, Les/dmoral/toasty/Toasty;->access$200()Z

    move-result v0

    iput-boolean v0, p0, Les/dmoral/toasty/Toasty$Config;->tintIcon:Z

    .line 342
    const/4 v0, 0x1

    iput-boolean v0, p0, Les/dmoral/toasty/Toasty$Config;->allowQueue:Z

    .line 346
    return-void
.end method

.method public static getInstance()Les/dmoral/toasty/Toasty$Config;
    .locals 1

    .line 350
    new-instance v0, Les/dmoral/toasty/Toasty$Config;

    invoke-direct {v0}, Les/dmoral/toasty/Toasty$Config;-><init>()V

    return-object v0
.end method

.method public static reset()V
    .locals 1

    .line 354
    invoke-static {}, Les/dmoral/toasty/Toasty;->access$300()Landroid/graphics/Typeface;

    move-result-object v0

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$002(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 355
    const/16 v0, 0x10

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$102(I)I

    .line 356
    const/4 v0, 0x1

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$202(Z)Z

    .line 357
    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$402(Z)Z

    .line 358
    return-void
.end method


# virtual methods
.method public allowQueue(Z)Les/dmoral/toasty/Toasty$Config;
    .locals 0
    .param p1, "allowQueue"    # Z

    .line 380
    iput-boolean p1, p0, Les/dmoral/toasty/Toasty$Config;->allowQueue:Z

    .line 381
    return-object p0
.end method

.method public apply()V
    .locals 1

    .line 385
    iget-object v0, p0, Les/dmoral/toasty/Toasty$Config;->typeface:Landroid/graphics/Typeface;

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$002(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 386
    iget v0, p0, Les/dmoral/toasty/Toasty$Config;->textSize:I

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$102(I)I

    .line 387
    iget-boolean v0, p0, Les/dmoral/toasty/Toasty$Config;->tintIcon:Z

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$202(Z)Z

    .line 388
    iget-boolean v0, p0, Les/dmoral/toasty/Toasty$Config;->allowQueue:Z

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$402(Z)Z

    .line 389
    return-void
.end method

.method public setTextSize(I)Les/dmoral/toasty/Toasty$Config;
    .locals 0
    .param p1, "sizeInSp"    # I

    .line 368
    iput p1, p0, Les/dmoral/toasty/Toasty$Config;->textSize:I

    .line 369
    return-object p0
.end method

.method public setToastTypeface(Landroid/graphics/Typeface;)Les/dmoral/toasty/Toasty$Config;
    .locals 0
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .line 362
    iput-object p1, p0, Les/dmoral/toasty/Toasty$Config;->typeface:Landroid/graphics/Typeface;

    .line 363
    return-object p0
.end method

.method public tintIcon(Z)Les/dmoral/toasty/Toasty$Config;
    .locals 0
    .param p1, "tintIcon"    # Z

    .line 374
    iput-boolean p1, p0, Les/dmoral/toasty/Toasty$Config;->tintIcon:Z

    .line 375
    return-object p0
.end method
