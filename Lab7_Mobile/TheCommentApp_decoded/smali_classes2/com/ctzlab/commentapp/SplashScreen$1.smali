.class Lcom/ctzlab/commentapp/SplashScreen$1;
.super Ljava/lang/Object;
.source "SplashScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ctzlab/commentapp/SplashScreen;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ctzlab/commentapp/SplashScreen;


# direct methods
.method constructor <init>(Lcom/ctzlab/commentapp/SplashScreen;)V
    .locals 0
    .param p1, "this$0"    # Lcom/ctzlab/commentapp/SplashScreen;

    .line 23
    iput-object p1, p0, Lcom/ctzlab/commentapp/SplashScreen$1;->this$0:Lcom/ctzlab/commentapp/SplashScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 27
    iget-object v0, p0, Lcom/ctzlab/commentapp/SplashScreen$1;->this$0:Lcom/ctzlab/commentapp/SplashScreen;

    invoke-virtual {v0}, Lcom/ctzlab/commentapp/SplashScreen;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/ctzlab/commentapp/AppPreferences;->getIsLoggedIn(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 28
    iget-object v0, p0, Lcom/ctzlab/commentapp/SplashScreen$1;->this$0:Lcom/ctzlab/commentapp/SplashScreen;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/ctzlab/commentapp/SplashScreen$1;->this$0:Lcom/ctzlab/commentapp/SplashScreen;

    const-class v3, Lcom/ctzlab/commentapp/MainActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/ctzlab/commentapp/SplashScreen;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/ctzlab/commentapp/SplashScreen$1;->this$0:Lcom/ctzlab/commentapp/SplashScreen;

    invoke-virtual {v0}, Lcom/ctzlab/commentapp/SplashScreen;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/ctzlab/commentapp/AppPreferences;->getBaseUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 32
    iget-object v0, p0, Lcom/ctzlab/commentapp/SplashScreen$1;->this$0:Lcom/ctzlab/commentapp/SplashScreen;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/ctzlab/commentapp/SplashScreen$1;->this$0:Lcom/ctzlab/commentapp/SplashScreen;

    const-class v3, Lcom/ctzlab/commentapp/BaseUrlPickerActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/ctzlab/commentapp/SplashScreen;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 35
    :cond_1
    iget-object v0, p0, Lcom/ctzlab/commentapp/SplashScreen$1;->this$0:Lcom/ctzlab/commentapp/SplashScreen;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/ctzlab/commentapp/SplashScreen$1;->this$0:Lcom/ctzlab/commentapp/SplashScreen;

    const-class v3, Lcom/ctzlab/commentapp/LoginActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/ctzlab/commentapp/SplashScreen;->startActivity(Landroid/content/Intent;)V

    .line 38
    :goto_0
    iget-object v0, p0, Lcom/ctzlab/commentapp/SplashScreen$1;->this$0:Lcom/ctzlab/commentapp/SplashScreen;

    invoke-virtual {v0}, Lcom/ctzlab/commentapp/SplashScreen;->finish()V

    .line 39
    return-void
.end method
