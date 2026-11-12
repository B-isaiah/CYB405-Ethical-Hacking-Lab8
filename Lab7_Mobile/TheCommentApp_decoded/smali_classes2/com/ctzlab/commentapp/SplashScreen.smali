.class public Lcom/ctzlab/commentapp/SplashScreen;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SplashScreen.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 16
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 17
    const v0, 0x7f0c0020

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/SplashScreen;->setContentView(I)V

    .line 18
    invoke-virtual {p0}, Lcom/ctzlab/commentapp/SplashScreen;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 19
    .local v0, "decorView":Landroid/view/View;
    const/4 v1, 0x6

    .line 21
    .local v1, "uiOptions":I
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 23
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    new-instance v3, Lcom/ctzlab/commentapp/SplashScreen$1;

    invoke-direct {v3, p0}, Lcom/ctzlab/commentapp/SplashScreen$1;-><init>(Lcom/ctzlab/commentapp/SplashScreen;)V

    const-wide/16 v4, 0xfa0

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 42
    return-void
.end method
