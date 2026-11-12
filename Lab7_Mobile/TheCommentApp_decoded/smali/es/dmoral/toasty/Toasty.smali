.class public Les/dmoral/toasty/Toasty;
.super Ljava/lang/Object;
.source "Toasty.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Les/dmoral/toasty/Toasty$Config;
    }
.end annotation


# static fields
.field public static final LENGTH_LONG:I = 0x1

.field public static final LENGTH_SHORT:I

.field private static final LOADED_TOAST_TYPEFACE:Landroid/graphics/Typeface;

.field private static allowQueue:Z

.field private static currentTypeface:Landroid/graphics/Typeface;

.field private static lastToast:Landroid/widget/Toast;

.field private static textSize:I

.field private static tintIcon:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 39
    const-string v0, "sans-serif-condensed"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    sput-object v0, Les/dmoral/toasty/Toasty;->LOADED_TOAST_TYPEFACE:Landroid/graphics/Typeface;

    .line 40
    sput-object v0, Les/dmoral/toasty/Toasty;->currentTypeface:Landroid/graphics/Typeface;

    .line 41
    const/16 v0, 0x10

    sput v0, Les/dmoral/toasty/Toasty;->textSize:I

    .line 43
    const/4 v0, 0x1

    sput-boolean v0, Les/dmoral/toasty/Toasty;->tintIcon:Z

    .line 44
    sput-boolean v0, Les/dmoral/toasty/Toasty;->allowQueue:Z

    .line 46
    const/4 v0, 0x0

    sput-object v0, Les/dmoral/toasty/Toasty;->lastToast:Landroid/widget/Toast;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method static synthetic access$000()Landroid/graphics/Typeface;
    .locals 1

    .line 38
    sget-object v0, Les/dmoral/toasty/Toasty;->currentTypeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method static synthetic access$002(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
    .locals 0
    .param p0, "x0"    # Landroid/graphics/Typeface;

    .line 38
    sput-object p0, Les/dmoral/toasty/Toasty;->currentTypeface:Landroid/graphics/Typeface;

    return-object p0
.end method

.method static synthetic access$100()I
    .locals 1

    .line 38
    sget v0, Les/dmoral/toasty/Toasty;->textSize:I

    return v0
.end method

.method static synthetic access$102(I)I
    .locals 0
    .param p0, "x0"    # I

    .line 38
    sput p0, Les/dmoral/toasty/Toasty;->textSize:I

    return p0
.end method

.method static synthetic access$200()Z
    .locals 1

    .line 38
    sget-boolean v0, Les/dmoral/toasty/Toasty;->tintIcon:Z

    return v0
.end method

.method static synthetic access$202(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .line 38
    sput-boolean p0, Les/dmoral/toasty/Toasty;->tintIcon:Z

    return p0
.end method

.method static synthetic access$300()Landroid/graphics/Typeface;
    .locals 1

    .line 38
    sget-object v0, Les/dmoral/toasty/Toasty;->LOADED_TOAST_TYPEFACE:Landroid/graphics/Typeface;

    return-object v0
.end method

.method static synthetic access$402(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .line 38
    sput-boolean p0, Les/dmoral/toasty/Toasty;->allowQueue:Z

    return p0
.end method

.method public static custom(Landroid/content/Context;IIIIZZ)Landroid/widget/Toast;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "iconRes"    # I
    .param p3, "tintColorRes"    # I
    .param p4, "duration"    # I
    .param p5, "withIcon"    # Z
    .param p6, "shouldTint"    # Z

    .line 265
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p2}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 266
    invoke-static {p0, p3}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v3

    sget v0, Les/dmoral/toasty/R$color;->defaultTextColor:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v4

    .line 265
    move-object v0, p0

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-static/range {v0 .. v7}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static custom(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p3, "tintColorRes"    # I
    .param p4, "textColorRes"    # I
    .param p5, "duration"    # I
    .param p6, "withIcon"    # Z
    .param p7, "shouldTint"    # Z

    .line 291
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p3}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v3

    .line 292
    invoke-static {p0, p4}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v4

    .line 291
    move-object v0, p0

    move-object v2, p2

    move v5, p5

    move v6, p6

    move v7, p7

    invoke-static/range {v0 .. v7}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static custom(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;IIZZ)Landroid/widget/Toast;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p3, "tintColorRes"    # I
    .param p4, "duration"    # I
    .param p5, "withIcon"    # Z
    .param p6, "shouldTint"    # Z

    .line 283
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p3}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v3

    sget v0, Les/dmoral/toasty/R$color;->defaultTextColor:I

    .line 284
    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v4

    .line 283
    move-object v0, p0

    move-object v2, p2

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-static/range {v0 .. v7}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static custom(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;IZ)Landroid/widget/Toast;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p3, "duration"    # I
    .param p4, "withIcon"    # Z

    .line 250
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget v0, Les/dmoral/toasty/R$color;->defaultTextColor:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v4

    const/4 v3, -0x1

    const/4 v7, 0x0

    move-object v0, p0

    move-object v2, p2

    move v5, p3

    move v6, p4

    invoke-static/range {v0 .. v7}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static custom(Landroid/content/Context;Ljava/lang/CharSequence;IIIZZ)Landroid/widget/Toast;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "iconRes"    # I
    .param p3, "tintColorRes"    # I
    .param p4, "duration"    # I
    .param p5, "withIcon"    # Z
    .param p6, "shouldTint"    # Z

    .line 274
    invoke-static {p0, p2}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 275
    invoke-static {p0, p3}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v3

    sget v0, Les/dmoral/toasty/R$color;->defaultTextColor:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v4

    .line 274
    move-object v0, p0

    move-object v1, p1

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-static/range {v0 .. v7}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p3, "tintColor"    # I
    .param p4, "textColor"    # I
    .param p5, "duration"    # I
    .param p6, "withIcon"    # Z
    .param p7, "shouldTint"    # Z

    .line 300
    const-string v0, ""

    invoke-static {p0, v0, p5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 301
    .local v0, "currentToast":Landroid/widget/Toast;
    const-string v1, "layout_inflater"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    sget v2, Les/dmoral/toasty/R$layout;->toast_layout:I

    .line 302
    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 303
    .local v1, "toastLayout":Landroid/view/View;
    sget v2, Les/dmoral/toasty/R$id;->toast_icon:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 304
    .local v2, "toastIcon":Landroid/widget/ImageView;
    sget v3, Les/dmoral/toasty/R$id;->toast_text:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 307
    .local v3, "toastTextView":Landroid/widget/TextView;
    if-eqz p7, :cond_0

    .line 308
    invoke-static {p0, p3}, Les/dmoral/toasty/ToastyUtils;->tint9PatchDrawableFrame(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .local v4, "drawableFrame":Landroid/graphics/drawable/Drawable;
    goto :goto_0

    .line 310
    .end local v4    # "drawableFrame":Landroid/graphics/drawable/Drawable;
    :cond_0
    sget v4, Les/dmoral/toasty/R$drawable;->toast_frame:I

    invoke-static {p0, v4}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 311
    .restart local v4    # "drawableFrame":Landroid/graphics/drawable/Drawable;
    :goto_0
    invoke-static {v1, v4}, Les/dmoral/toasty/ToastyUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 313
    if-eqz p6, :cond_3

    .line 314
    if-eqz p2, :cond_2

    .line 316
    sget-boolean v5, Les/dmoral/toasty/Toasty;->tintIcon:Z

    if-eqz v5, :cond_1

    invoke-static {p2, p4}, Les/dmoral/toasty/ToastyUtils;->tintIcon(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    goto :goto_1

    :cond_1
    move-object v5, p2

    :goto_1
    invoke-static {v2, v5}, Les/dmoral/toasty/ToastyUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    goto :goto_2

    .line 315
    :cond_2
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Avoid passing \'icon\' as null if \'withIcon\' is set to true"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 318
    :cond_3
    const/16 v5, 0x8

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 321
    :goto_2
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 322
    invoke-virtual {v3, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 323
    sget-object v5, Les/dmoral/toasty/Toasty;->currentTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 324
    const/4 v5, 0x2

    sget v6, Les/dmoral/toasty/Toasty;->textSize:I

    int-to-float v6, v6

    invoke-virtual {v3, v5, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 326
    invoke-virtual {v0, v1}, Landroid/widget/Toast;->setView(Landroid/view/View;)V

    .line 328
    sget-boolean v5, Les/dmoral/toasty/Toasty;->allowQueue:Z

    if-nez v5, :cond_5

    .line 329
    sget-object v5, Les/dmoral/toasty/Toasty;->lastToast:Landroid/widget/Toast;

    if-eqz v5, :cond_4

    .line 330
    invoke-virtual {v5}, Landroid/widget/Toast;->cancel()V

    .line 331
    :cond_4
    sput-object v0, Les/dmoral/toasty/Toasty;->lastToast:Landroid/widget/Toast;

    .line 334
    :cond_5
    return-object v0
.end method

.method public static custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IZ)Landroid/widget/Toast;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p3, "duration"    # I
    .param p4, "withIcon"    # Z

    .line 257
    sget v0, Les/dmoral/toasty/R$color;->defaultTextColor:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v5

    const/4 v4, -0x1

    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v6, p3

    move v7, p4

    invoke-static/range {v1 .. v8}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static error(Landroid/content/Context;I)Landroid/widget/Toast;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I

    .line 215
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2}, Les/dmoral/toasty/Toasty;->error(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static error(Landroid/content/Context;II)Landroid/widget/Toast;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "duration"    # I

    .line 225
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, p2, v1}, Les/dmoral/toasty/Toasty;->error(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static error(Landroid/content/Context;IIZ)Landroid/widget/Toast;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "duration"    # I
    .param p3, "withIcon"    # Z

    .line 235
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget v0, Les/dmoral/toasty/R$drawable;->ic_clear_white_24dp:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    sget v0, Les/dmoral/toasty/R$color;->errorColor:I

    .line 236
    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v3

    sget v0, Les/dmoral/toasty/R$color;->defaultTextColor:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v4

    .line 235
    const/4 v7, 0x1

    move-object v0, p0

    move v5, p2

    move v6, p3

    invoke-static/range {v0 .. v7}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static error(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/Toast;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;

    .line 220
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Les/dmoral/toasty/Toasty;->error(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static error(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "duration"    # I

    .line 230
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Les/dmoral/toasty/Toasty;->error(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static error(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "duration"    # I
    .param p3, "withIcon"    # Z

    .line 242
    sget v0, Les/dmoral/toasty/R$drawable;->ic_clear_white_24dp:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    sget v0, Les/dmoral/toasty/R$color;->errorColor:I

    .line 243
    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v4

    sget v0, Les/dmoral/toasty/R$color;->defaultTextColor:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v5

    .line 242
    const/4 v8, 0x1

    move-object v1, p0

    move-object v2, p1

    move v6, p2

    move v7, p3

    invoke-static/range {v1 .. v8}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static info(Landroid/content/Context;I)Landroid/widget/Toast;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I

    .line 147
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2}, Les/dmoral/toasty/Toasty;->info(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static info(Landroid/content/Context;II)Landroid/widget/Toast;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "duration"    # I

    .line 157
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, p2, v1}, Les/dmoral/toasty/Toasty;->info(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static info(Landroid/content/Context;IIZ)Landroid/widget/Toast;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "duration"    # I
    .param p3, "withIcon"    # Z

    .line 167
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget v0, Les/dmoral/toasty/R$drawable;->ic_info_outline_white_24dp:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    sget v0, Les/dmoral/toasty/R$color;->infoColor:I

    .line 168
    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v3

    sget v0, Les/dmoral/toasty/R$color;->defaultTextColor:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v4

    .line 167
    const/4 v7, 0x1

    move-object v0, p0

    move v5, p2

    move v6, p3

    invoke-static/range {v0 .. v7}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static info(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/Toast;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;

    .line 152
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Les/dmoral/toasty/Toasty;->info(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static info(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "duration"    # I

    .line 162
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Les/dmoral/toasty/Toasty;->info(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static info(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "duration"    # I
    .param p3, "withIcon"    # Z

    .line 174
    sget v0, Les/dmoral/toasty/R$drawable;->ic_info_outline_white_24dp:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    sget v0, Les/dmoral/toasty/R$color;->infoColor:I

    .line 175
    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v4

    sget v0, Les/dmoral/toasty/R$color;->defaultTextColor:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v5

    .line 174
    const/4 v8, 0x1

    move-object v1, p0

    move-object v2, p1

    move v6, p2

    move v7, p3

    invoke-static/range {v1 .. v8}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static normal(Landroid/content/Context;I)Landroid/widget/Toast;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I

    .line 57
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2, v1}, Les/dmoral/toasty/Toasty;->normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Z)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static normal(Landroid/content/Context;II)Landroid/widget/Toast;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "duration"    # I

    .line 77
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, v0, p2, v1, v2}, Les/dmoral/toasty/Toasty;->normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Z)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static normal(Landroid/content/Context;IILandroid/graphics/drawable/Drawable;)Landroid/widget/Toast;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "duration"    # I
    .param p3, "icon"    # Landroid/graphics/drawable/Drawable;

    .line 88
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, p2, p3, v1}, Les/dmoral/toasty/Toasty;->normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Z)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static normal(Landroid/content/Context;IILandroid/graphics/drawable/Drawable;Z)Landroid/widget/Toast;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "duration"    # I
    .param p3, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p4, "withIcon"    # Z

    .line 100
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget v0, Les/dmoral/toasty/R$color;->normalColor:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v3

    sget v0, Les/dmoral/toasty/R$color;->defaultTextColor:I

    .line 101
    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v4

    .line 100
    const/4 v7, 0x1

    move-object v0, p0

    move-object v2, p3

    move v5, p2

    move v6, p4

    invoke-static/range {v0 .. v7}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static normal(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Landroid/widget/Toast;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "icon"    # Landroid/graphics/drawable/Drawable;

    .line 67
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, p2, v2}, Les/dmoral/toasty/Toasty;->normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Z)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static normal(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/Toast;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;

    .line 62
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, v0}, Les/dmoral/toasty/Toasty;->normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Z)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static normal(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "duration"    # I

    .line 82
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, p2, v0, v1}, Les/dmoral/toasty/Toasty;->normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Z)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;)Landroid/widget/Toast;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "duration"    # I
    .param p3, "icon"    # Landroid/graphics/drawable/Drawable;

    .line 94
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, p3, v0}, Les/dmoral/toasty/Toasty;->normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Z)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Z)Landroid/widget/Toast;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "duration"    # I
    .param p3, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p4, "withIcon"    # Z

    .line 107
    sget v0, Les/dmoral/toasty/R$color;->normalColor:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v4

    sget v0, Les/dmoral/toasty/R$color;->defaultTextColor:I

    .line 108
    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v5

    .line 107
    const/4 v8, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p3

    move v6, p2

    move v7, p4

    invoke-static/range {v1 .. v8}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static normal(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;)Landroid/widget/Toast;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "icon"    # Landroid/graphics/drawable/Drawable;

    .line 72
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, p2, v1}, Les/dmoral/toasty/Toasty;->normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Z)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static success(Landroid/content/Context;I)Landroid/widget/Toast;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I

    .line 181
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2}, Les/dmoral/toasty/Toasty;->success(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static success(Landroid/content/Context;II)Landroid/widget/Toast;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "duration"    # I

    .line 191
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, p2, v1}, Les/dmoral/toasty/Toasty;->success(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static success(Landroid/content/Context;IIZ)Landroid/widget/Toast;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "duration"    # I
    .param p3, "withIcon"    # Z

    .line 201
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget v0, Les/dmoral/toasty/R$drawable;->ic_check_white_24dp:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    sget v0, Les/dmoral/toasty/R$color;->successColor:I

    .line 202
    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v3

    sget v0, Les/dmoral/toasty/R$color;->defaultTextColor:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v4

    .line 201
    const/4 v7, 0x1

    move-object v0, p0

    move v5, p2

    move v6, p3

    invoke-static/range {v0 .. v7}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static success(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/Toast;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;

    .line 186
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Les/dmoral/toasty/Toasty;->success(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static success(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "duration"    # I

    .line 196
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Les/dmoral/toasty/Toasty;->success(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static success(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "duration"    # I
    .param p3, "withIcon"    # Z

    .line 208
    sget v0, Les/dmoral/toasty/R$drawable;->ic_check_white_24dp:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    sget v0, Les/dmoral/toasty/R$color;->successColor:I

    .line 209
    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v4

    sget v0, Les/dmoral/toasty/R$color;->defaultTextColor:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v5

    .line 208
    const/4 v8, 0x1

    move-object v1, p0

    move-object v2, p1

    move v6, p2

    move v7, p3

    invoke-static/range {v1 .. v8}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static warning(Landroid/content/Context;I)Landroid/widget/Toast;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I

    .line 113
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2}, Les/dmoral/toasty/Toasty;->warning(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static warning(Landroid/content/Context;II)Landroid/widget/Toast;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "duration"    # I

    .line 123
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, p2, v1}, Les/dmoral/toasty/Toasty;->warning(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static warning(Landroid/content/Context;IIZ)Landroid/widget/Toast;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # I
    .param p2, "duration"    # I
    .param p3, "withIcon"    # Z

    .line 133
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget v0, Les/dmoral/toasty/R$drawable;->ic_error_outline_white_24dp:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    sget v0, Les/dmoral/toasty/R$color;->warningColor:I

    .line 134
    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v3

    sget v0, Les/dmoral/toasty/R$color;->defaultTextColor:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v4

    .line 133
    const/4 v7, 0x1

    move-object v0, p0

    move v5, p2

    move v6, p3

    invoke-static/range {v0 .. v7}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static warning(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/Toast;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;

    .line 118
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Les/dmoral/toasty/Toasty;->warning(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static warning(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "duration"    # I

    .line 128
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Les/dmoral/toasty/Toasty;->warning(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method

.method public static warning(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "duration"    # I
    .param p3, "withIcon"    # Z

    .line 140
    sget v0, Les/dmoral/toasty/R$drawable;->ic_error_outline_white_24dp:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    sget v0, Les/dmoral/toasty/R$color;->warningColor:I

    .line 141
    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v4

    sget v0, Les/dmoral/toasty/R$color;->defaultTextColor:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getColor(Landroid/content/Context;I)I

    move-result v5

    .line 140
    const/4 v8, 0x1

    move-object v1, p0

    move-object v2, p1

    move v6, p2

    move v7, p3

    invoke-static/range {v1 .. v8}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIIZZ)Landroid/widget/Toast;

    move-result-object v0

    return-object v0
.end method
