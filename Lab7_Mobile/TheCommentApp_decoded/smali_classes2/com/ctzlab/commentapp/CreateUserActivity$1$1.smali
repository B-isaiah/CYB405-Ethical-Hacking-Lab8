.class Lcom/ctzlab/commentapp/CreateUserActivity$1$1;
.super Ljava/lang/Object;
.source "CreateUserActivity.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ctzlab/commentapp/CreateUserActivity$1;->makeLoginCall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
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
.field final synthetic this$1:Lcom/ctzlab/commentapp/CreateUserActivity$1;


# direct methods
.method constructor <init>(Lcom/ctzlab/commentapp/CreateUserActivity$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/ctzlab/commentapp/CreateUserActivity$1;

    .line 72
    iput-object p1, p0, Lcom/ctzlab/commentapp/CreateUserActivity$1$1;->this$1:Lcom/ctzlab/commentapp/CreateUserActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .line 72
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/ctzlab/commentapp/CreateUserActivity$1$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "response"    # Lorg/json/JSONObject;

    .line 75
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Create User RES :: "

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    iget-object v0, p0, Lcom/ctzlab/commentapp/CreateUserActivity$1$1;->this$1:Lcom/ctzlab/commentapp/CreateUserActivity$1;

    iget-object v0, v0, Lcom/ctzlab/commentapp/CreateUserActivity$1;->this$0:Lcom/ctzlab/commentapp/CreateUserActivity;

    invoke-virtual {v0}, Lcom/ctzlab/commentapp/CreateUserActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "User Created!"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Les/dmoral/toasty/Toasty;->success(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 77
    iget-object v0, p0, Lcom/ctzlab/commentapp/CreateUserActivity$1$1;->this$1:Lcom/ctzlab/commentapp/CreateUserActivity$1;

    iget-object v0, v0, Lcom/ctzlab/commentapp/CreateUserActivity$1;->this$0:Lcom/ctzlab/commentapp/CreateUserActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/ctzlab/commentapp/CreateUserActivity$1$1;->this$1:Lcom/ctzlab/commentapp/CreateUserActivity$1;

    iget-object v2, v2, Lcom/ctzlab/commentapp/CreateUserActivity$1;->this$0:Lcom/ctzlab/commentapp/CreateUserActivity;

    const-class v3, Lcom/ctzlab/commentapp/LoginActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/ctzlab/commentapp/CreateUserActivity;->startActivity(Landroid/content/Intent;)V

    .line 78
    iget-object v0, p0, Lcom/ctzlab/commentapp/CreateUserActivity$1$1;->this$1:Lcom/ctzlab/commentapp/CreateUserActivity$1;

    iget-object v0, v0, Lcom/ctzlab/commentapp/CreateUserActivity$1;->this$0:Lcom/ctzlab/commentapp/CreateUserActivity;

    invoke-virtual {v0}, Lcom/ctzlab/commentapp/CreateUserActivity;->finish()V

    .line 79
    iget-object v0, p0, Lcom/ctzlab/commentapp/CreateUserActivity$1$1;->this$1:Lcom/ctzlab/commentapp/CreateUserActivity$1;

    iget-object v0, v0, Lcom/ctzlab/commentapp/CreateUserActivity$1;->this$0:Lcom/ctzlab/commentapp/CreateUserActivity;

    iget-object v0, v0, Lcom/ctzlab/commentapp/CreateUserActivity;->progressBar:Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setVisibility(I)V

    .line 80
    return-void
.end method
