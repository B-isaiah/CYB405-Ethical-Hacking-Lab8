.class Lcom/ctzlab/commentapp/CreateUserActivity$1;
.super Ljava/lang/Object;
.source "CreateUserActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ctzlab/commentapp/CreateUserActivity;->initActions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ctzlab/commentapp/CreateUserActivity;


# direct methods
.method constructor <init>(Lcom/ctzlab/commentapp/CreateUserActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/ctzlab/commentapp/CreateUserActivity;

    .line 45
    iput-object p1, p0, Lcom/ctzlab/commentapp/CreateUserActivity$1;->this$0:Lcom/ctzlab/commentapp/CreateUserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private makeLoginCall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "userNameValue"    # Ljava/lang/String;
    .param p2, "passwordValue"    # Ljava/lang/String;
    .param p3, "displayNameValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 64
    iget-object v0, p0, Lcom/ctzlab/commentapp/CreateUserActivity$1;->this$0:Lcom/ctzlab/commentapp/CreateUserActivity;

    iget-object v0, v0, Lcom/ctzlab/commentapp/CreateUserActivity;->progressBar:Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;->setVisibility(I)V

    .line 65
    iget-object v0, p0, Lcom/ctzlab/commentapp/CreateUserActivity$1;->this$0:Lcom/ctzlab/commentapp/CreateUserActivity;

    invoke-static {v0}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object v0

    .line 66
    .local v0, "queue":Lcom/android/volley/RequestQueue;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/ctzlab/commentapp/CreateUserActivity$1;->this$0:Lcom/ctzlab/commentapp/CreateUserActivity;

    invoke-virtual {v3}, Lcom/ctzlab/commentapp/CreateUserActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/ctzlab/commentapp/AppPreferences;->getBaseUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/api3/user"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 67
    .local v2, "url":Ljava/lang/String;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 68
    .local v3, "jsonBody":Lorg/json/JSONObject;
    const-string v4, "username"

    invoke-virtual {v3, v4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 69
    const-string v4, "password"

    invoke-virtual {v3, v4, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 70
    const-string v4, "name"

    invoke-virtual {v3, v4, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 71
    new-instance v4, Lcom/android/volley/toolbox/JsonObjectRequest;

    new-instance v5, Lcom/ctzlab/commentapp/CreateUserActivity$1$1;

    invoke-direct {v5, p0}, Lcom/ctzlab/commentapp/CreateUserActivity$1$1;-><init>(Lcom/ctzlab/commentapp/CreateUserActivity$1;)V

    new-instance v6, Lcom/ctzlab/commentapp/CreateUserActivity$1$2;

    invoke-direct {v6, p0}, Lcom/ctzlab/commentapp/CreateUserActivity$1$2;-><init>(Lcom/ctzlab/commentapp/CreateUserActivity$1;)V

    invoke-direct {v4, v2, v3, v5, v6}, Lcom/android/volley/toolbox/JsonObjectRequest;-><init>(Ljava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 93
    .local v4, "postRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    new-instance v5, Lcom/android/volley/DefaultRetryPolicy;

    const/16 v6, 0x2710

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v5, v6, v1, v7}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {v4, v5}, Lcom/android/volley/toolbox/JsonObjectRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 94
    invoke-virtual {v0, v4}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 95
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;

    .line 48
    iget-object v0, p0, Lcom/ctzlab/commentapp/CreateUserActivity$1;->this$0:Lcom/ctzlab/commentapp/CreateUserActivity;

    iget-object v0, v0, Lcom/ctzlab/commentapp/CreateUserActivity;->userName:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, "userNameValue":Ljava/lang/String;
    iget-object v1, p0, Lcom/ctzlab/commentapp/CreateUserActivity$1;->this$0:Lcom/ctzlab/commentapp/CreateUserActivity;

    iget-object v1, v1, Lcom/ctzlab/commentapp/CreateUserActivity;->password:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v1}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 50
    .local v1, "passwordValue":Ljava/lang/String;
    iget-object v2, p0, Lcom/ctzlab/commentapp/CreateUserActivity$1;->this$0:Lcom/ctzlab/commentapp/CreateUserActivity;

    iget-object v2, v2, Lcom/ctzlab/commentapp/CreateUserActivity;->displayName:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v2}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 51
    .local v2, "displayNameValue":Ljava/lang/String;
    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 53
    :try_start_0
    invoke-direct {p0, v0, v1, v2}, Lcom/ctzlab/commentapp/CreateUserActivity$1;->makeLoginCall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    :goto_0
    goto :goto_1

    .line 54
    :catch_0
    move-exception v3

    .line 55
    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    .end local v3    # "e":Lorg/json/JSONException;
    goto :goto_0

    .line 59
    :cond_0
    iget-object v3, p0, Lcom/ctzlab/commentapp/CreateUserActivity$1;->this$0:Lcom/ctzlab/commentapp/CreateUserActivity;

    invoke-virtual {v3}, Lcom/ctzlab/commentapp/CreateUserActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "Please Enter Username & Password"

    invoke-static {v3, v5, v4}, Les/dmoral/toasty/Toasty;->warning(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 61
    :goto_1
    return-void
.end method
