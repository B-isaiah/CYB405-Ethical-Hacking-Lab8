.class Lcom/ctzlab/commentapp/LoginActivity$1$1;
.super Ljava/lang/Object;
.source "LoginActivity.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ctzlab/commentapp/LoginActivity$1;->makeLoginCall(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/ctzlab/commentapp/LoginActivity$1;


# direct methods
.method constructor <init>(Lcom/ctzlab/commentapp/LoginActivity$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/ctzlab/commentapp/LoginActivity$1;

    .line 75
    iput-object p1, p0, Lcom/ctzlab/commentapp/LoginActivity$1$1;->this$1:Lcom/ctzlab/commentapp/LoginActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .line 75
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/ctzlab/commentapp/LoginActivity$1$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "response"    # Lorg/json/JSONObject;

    .line 79
    :try_start_0
    const-string v0, "Login User RES :: "

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    const-string v0, "success"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 81
    const-string v0, "username"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "user":Ljava/lang/String;
    iget-object v2, p0, Lcom/ctzlab/commentapp/LoginActivity$1$1;->this$1:Lcom/ctzlab/commentapp/LoginActivity$1;

    iget-object v2, v2, Lcom/ctzlab/commentapp/LoginActivity$1;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    invoke-virtual {v2}, Lcom/ctzlab/commentapp/LoginActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/ctzlab/commentapp/AppPreferences;->setUsername(Landroid/content/Context;Ljava/lang/String;)V

    .line 83
    iget-object v2, p0, Lcom/ctzlab/commentapp/LoginActivity$1$1;->this$1:Lcom/ctzlab/commentapp/LoginActivity$1;

    iget-object v2, v2, Lcom/ctzlab/commentapp/LoginActivity$1;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    invoke-virtual {v2}, Lcom/ctzlab/commentapp/LoginActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "Login Success"

    invoke-static {v2, v3, v1}, Les/dmoral/toasty/Toasty;->success(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 84
    iget-object v1, p0, Lcom/ctzlab/commentapp/LoginActivity$1$1;->this$1:Lcom/ctzlab/commentapp/LoginActivity$1;

    iget-object v1, v1, Lcom/ctzlab/commentapp/LoginActivity$1;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    invoke-virtual {v1}, Lcom/ctzlab/commentapp/LoginActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/ctzlab/commentapp/AppPreferences;->setIsLoggedIn(Landroid/content/Context;Z)V

    .line 85
    iget-object v1, p0, Lcom/ctzlab/commentapp/LoginActivity$1$1;->this$1:Lcom/ctzlab/commentapp/LoginActivity$1;

    iget-object v1, v1, Lcom/ctzlab/commentapp/LoginActivity$1;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lcom/ctzlab/commentapp/LoginActivity$1$1;->this$1:Lcom/ctzlab/commentapp/LoginActivity$1;

    iget-object v3, v3, Lcom/ctzlab/commentapp/LoginActivity$1;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    const-class v4, Lcom/ctzlab/commentapp/MainActivity;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2}, Lcom/ctzlab/commentapp/LoginActivity;->startActivity(Landroid/content/Intent;)V

    .line 86
    iget-object v1, p0, Lcom/ctzlab/commentapp/LoginActivity$1$1;->this$1:Lcom/ctzlab/commentapp/LoginActivity$1;

    iget-object v1, v1, Lcom/ctzlab/commentapp/LoginActivity$1;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    invoke-virtual {v1}, Lcom/ctzlab/commentapp/LoginActivity;->finish()V

    .line 87
    .end local v0    # "user":Ljava/lang/String;
    goto :goto_0

    .line 89
    :cond_0
    iget-object v0, p0, Lcom/ctzlab/commentapp/LoginActivity$1$1;->this$1:Lcom/ctzlab/commentapp/LoginActivity$1;

    iget-object v0, v0, Lcom/ctzlab/commentapp/LoginActivity$1;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    invoke-virtual {v0}, Lcom/ctzlab/commentapp/LoginActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "Error"

    invoke-static {v0, v2, v1}, Les/dmoral/toasty/Toasty;->error(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    :goto_0
    goto :goto_1

    .line 91
    :catch_0
    move-exception v0

    .line 92
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 94
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_1
    iget-object v0, p0, Lcom/ctzlab/commentapp/LoginActivity$1$1;->this$1:Lcom/ctzlab/commentapp/LoginActivity$1;

    iget-object v0, v0, Lcom/ctzlab/commentapp/LoginActivity$1;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    iget-object v0, v0, Lcom/ctzlab/commentapp/LoginActivity;->progressBar:Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setVisibility(I)V

    .line 95
    return-void
.end method
