.class Lcom/ctzlab/commentapp/LoginActivity$1;
.super Ljava/lang/Object;
.source "LoginActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ctzlab/commentapp/LoginActivity;->initActions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ctzlab/commentapp/LoginActivity;


# direct methods
.method constructor <init>(Lcom/ctzlab/commentapp/LoginActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/ctzlab/commentapp/LoginActivity;

    .line 49
    iput-object p1, p0, Lcom/ctzlab/commentapp/LoginActivity$1;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private makeLoginCall(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "userNameValue"    # Ljava/lang/String;
    .param p2, "passwordValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 68
    iget-object v0, p0, Lcom/ctzlab/commentapp/LoginActivity$1;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    iget-object v0, v0, Lcom/ctzlab/commentapp/LoginActivity;->progressBar:Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setVisibility(I)V

    .line 69
    iget-object v0, p0, Lcom/ctzlab/commentapp/LoginActivity$1;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    invoke-static {v0}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object v0

    .line 70
    .local v0, "queue":Lcom/android/volley/RequestQueue;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/ctzlab/commentapp/LoginActivity$1;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    invoke-virtual {v3}, Lcom/ctzlab/commentapp/LoginActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/ctzlab/commentapp/AppPreferences;->getBaseUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/api3/user/login"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 71
    .local v2, "url":Ljava/lang/String;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 72
    .local v3, "jsonBody":Lorg/json/JSONObject;
    const-string v4, "username"

    invoke-virtual {v3, v4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 73
    const-string v4, "password"

    invoke-virtual {v3, v4, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 74
    new-instance v4, Lcom/android/volley/toolbox/JsonObjectRequest;

    new-instance v5, Lcom/ctzlab/commentapp/LoginActivity$1$1;

    invoke-direct {v5, p0}, Lcom/ctzlab/commentapp/LoginActivity$1$1;-><init>(Lcom/ctzlab/commentapp/LoginActivity$1;)V

    new-instance v6, Lcom/ctzlab/commentapp/LoginActivity$1$2;

    invoke-direct {v6, p0}, Lcom/ctzlab/commentapp/LoginActivity$1$2;-><init>(Lcom/ctzlab/commentapp/LoginActivity$1;)V

    invoke-direct {v4, v2, v3, v5, v6}, Lcom/android/volley/toolbox/JsonObjectRequest;-><init>(Ljava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 108
    .local v4, "postRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    new-instance v5, Lcom/android/volley/DefaultRetryPolicy;

    const/16 v6, 0x2710

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v5, v6, v1, v7}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {v4, v5}, Lcom/android/volley/toolbox/JsonObjectRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 109
    invoke-virtual {v0, v4}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 110
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .line 52
    iget-object v0, p0, Lcom/ctzlab/commentapp/LoginActivity$1;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    iget-object v0, v0, Lcom/ctzlab/commentapp/LoginActivity;->userName:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 53
    .local v0, "userNameValue":Ljava/lang/String;
    iget-object v1, p0, Lcom/ctzlab/commentapp/LoginActivity$1;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    iget-object v1, v1, Lcom/ctzlab/commentapp/LoginActivity;->password:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v1}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 55
    .local v1, "passwordValue":Ljava/lang/String;
    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 57
    :try_start_0
    invoke-direct {p0, v0, v1}, Lcom/ctzlab/commentapp/LoginActivity$1;->makeLoginCall(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    :goto_0
    goto :goto_1

    .line 58
    :catch_0
    move-exception v2

    .line 59
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    .end local v2    # "e":Lorg/json/JSONException;
    goto :goto_0

    .line 63
    :cond_0
    iget-object v2, p0, Lcom/ctzlab/commentapp/LoginActivity$1;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    invoke-virtual {v2}, Lcom/ctzlab/commentapp/LoginActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    const-string v4, "Please Enter Username & Password"

    invoke-static {v2, v4, v3}, Les/dmoral/toasty/Toasty;->warning(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 65
    :goto_1
    return-void
.end method
