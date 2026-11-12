.class Lcom/ctzlab/commentapp/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ctzlab/commentapp/MainActivity;->initActions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ctzlab/commentapp/MainActivity;


# direct methods
.method constructor <init>(Lcom/ctzlab/commentapp/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/ctzlab/commentapp/MainActivity;

    .line 70
    iput-object p1, p0, Lcom/ctzlab/commentapp/MainActivity$1;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private postCommentRequest(Lcom/ctzlab/commentapp/modal/Comment;)V
    .locals 8
    .param p1, "comment"    # Lcom/ctzlab/commentapp/modal/Comment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 112
    iget-object v0, p0, Lcom/ctzlab/commentapp/MainActivity$1;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-static {v0}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object v0

    .line 113
    .local v0, "queue":Lcom/android/volley/RequestQueue;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/ctzlab/commentapp/MainActivity$1;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-virtual {v2}, Lcom/ctzlab/commentapp/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/ctzlab/commentapp/AppPreferences;->getBaseUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/api3/comment"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 114
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 115
    .local v2, "jsonBody":Lorg/json/JSONObject;
    invoke-virtual {p1}, Lcom/ctzlab/commentapp/modal/Comment;->getDeviceId()Ljava/lang/String;

    move-result-object v3

    const-string v4, "deviceid"

    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 116
    invoke-virtual {p1}, Lcom/ctzlab/commentapp/modal/Comment;->getLatitude()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Double;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "latitude"

    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 117
    invoke-virtual {p1}, Lcom/ctzlab/commentapp/modal/Comment;->getLongitude()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Double;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "longitude"

    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 118
    invoke-virtual {p1}, Lcom/ctzlab/commentapp/modal/Comment;->getCommentText()Ljava/lang/String;

    move-result-object v3

    const-string v4, "commenttext"

    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 119
    invoke-virtual {p1}, Lcom/ctzlab/commentapp/modal/Comment;->getUsername()Ljava/lang/String;

    move-result-object v3

    const-string v4, "username"

    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 120
    const-string v3, "postid"

    const-string v4, "1"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 121
    new-instance v3, Lcom/android/volley/toolbox/JsonObjectRequest;

    new-instance v4, Lcom/ctzlab/commentapp/MainActivity$1$1;

    invoke-direct {v4, p0}, Lcom/ctzlab/commentapp/MainActivity$1$1;-><init>(Lcom/ctzlab/commentapp/MainActivity$1;)V

    new-instance v5, Lcom/ctzlab/commentapp/MainActivity$1$2;

    invoke-direct {v5, p0}, Lcom/ctzlab/commentapp/MainActivity$1$2;-><init>(Lcom/ctzlab/commentapp/MainActivity$1;)V

    invoke-direct {v3, v1, v2, v4, v5}, Lcom/android/volley/toolbox/JsonObjectRequest;-><init>(Ljava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 141
    .local v3, "postRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    new-instance v4, Lcom/android/volley/DefaultRetryPolicy;

    const/16 v5, 0x2710

    const/4 v6, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v4, v5, v6, v7}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {v3, v4}, Lcom/android/volley/toolbox/JsonObjectRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 142
    invoke-virtual {v0, v3}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 143
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 9
    .param p1, "view"    # Landroid/view/View;

    .line 73
    iget-object v0, p0, Lcom/ctzlab/commentapp/MainActivity$1;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    iget-object v0, v0, Lcom/ctzlab/commentapp/MainActivity;->commentMessage:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    .line 75
    new-instance v0, Lcom/ctzlab/commentapp/modal/Comment;

    invoke-direct {v0}, Lcom/ctzlab/commentapp/modal/Comment;-><init>()V

    .line 77
    .local v0, "comment":Lcom/ctzlab/commentapp/modal/Comment;
    iget-object v2, p0, Lcom/ctzlab/commentapp/MainActivity$1;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-virtual {v2}, Lcom/ctzlab/commentapp/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "android_id"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 79
    .local v2, "android_id":Ljava/lang/String;
    invoke-virtual {v0, v2}, Lcom/ctzlab/commentapp/modal/Comment;->setDeviceId(Ljava/lang/String;)V

    .line 81
    iget-object v3, p0, Lcom/ctzlab/commentapp/MainActivity$1;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    const-string v4, "location"

    invoke-virtual {v3, v4}, Lcom/ctzlab/commentapp/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/location/LocationManager;

    .line 82
    .local v3, "nManager":Landroid/location/LocationManager;
    const-string v4, "gps"

    invoke-virtual {v3, v4}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 83
    iget-object v1, p0, Lcom/ctzlab/commentapp/MainActivity$1;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-static {v1}, Lcom/ctzlab/commentapp/MainActivity;->access$000(Lcom/ctzlab/commentapp/MainActivity;)V

    goto :goto_1

    .line 85
    :cond_0
    iget-object v4, p0, Lcom/ctzlab/commentapp/MainActivity$1;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-static {v4}, Lcom/ctzlab/commentapp/MainActivity;->access$100(Lcom/ctzlab/commentapp/MainActivity;)Landroid/location/Location;

    move-result-object v4

    .line 86
    .local v4, "locationGPS":Landroid/location/Location;
    if-eqz v4, :cond_1

    .line 87
    invoke-virtual {v4}, Landroid/location/Location;->getLatitude()D

    move-result-wide v5

    .line 88
    .local v5, "lat":D
    invoke-virtual {v4}, Landroid/location/Location;->getLongitude()D

    move-result-wide v7

    .line 89
    .local v7, "longi":D
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ctzlab/commentapp/modal/Comment;->setLatitude(Ljava/lang/Double;)V

    .line 90
    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ctzlab/commentapp/modal/Comment;->setLongitude(Ljava/lang/Double;)V

    .line 91
    iget-object v1, p0, Lcom/ctzlab/commentapp/MainActivity$1;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    iget-object v1, v1, Lcom/ctzlab/commentapp/MainActivity;->commentMessage:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v1}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ctzlab/commentapp/modal/Comment;->setCommentText(Ljava/lang/String;)V

    .line 92
    iget-object v1, p0, Lcom/ctzlab/commentapp/MainActivity$1;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-virtual {v1}, Lcom/ctzlab/commentapp/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/ctzlab/commentapp/AppPreferences;->getUsername(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ctzlab/commentapp/modal/Comment;->setUsername(Ljava/lang/String;)V

    .line 96
    :try_start_0
    invoke-direct {p0, v0}, Lcom/ctzlab/commentapp/MainActivity$1;->postCommentRequest(Lcom/ctzlab/commentapp/modal/Comment;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    goto :goto_0

    .line 97
    :catch_0
    move-exception v1

    .line 98
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 101
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v5    # "lat":D
    .end local v7    # "longi":D
    :goto_0
    goto :goto_1

    .line 102
    :cond_1
    iget-object v5, p0, Lcom/ctzlab/commentapp/MainActivity$1;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-virtual {v5}, Lcom/ctzlab/commentapp/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "Unable to find location."

    invoke-static {v5, v6, v1}, Les/dmoral/toasty/Toasty;->error(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 105
    .end local v0    # "comment":Lcom/ctzlab/commentapp/modal/Comment;
    .end local v2    # "android_id":Ljava/lang/String;
    .end local v3    # "nManager":Landroid/location/LocationManager;
    .end local v4    # "locationGPS":Landroid/location/Location;
    :goto_1
    goto :goto_2

    .line 107
    :cond_2
    iget-object v0, p0, Lcom/ctzlab/commentapp/MainActivity$1;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-virtual {v0}, Lcom/ctzlab/commentapp/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "Comment Can Not Be Empty"

    invoke-static {v0, v2, v1}, Les/dmoral/toasty/Toasty;->warning(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 109
    :goto_2
    return-void
.end method
