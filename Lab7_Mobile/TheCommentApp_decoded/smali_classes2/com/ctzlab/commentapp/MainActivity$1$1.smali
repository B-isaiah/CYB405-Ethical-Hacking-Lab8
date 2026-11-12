.class Lcom/ctzlab/commentapp/MainActivity$1$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ctzlab/commentapp/MainActivity$1;->postCommentRequest(Lcom/ctzlab/commentapp/modal/Comment;)V
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
.field final synthetic this$1:Lcom/ctzlab/commentapp/MainActivity$1;


# direct methods
.method constructor <init>(Lcom/ctzlab/commentapp/MainActivity$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/ctzlab/commentapp/MainActivity$1;

    .line 122
    iput-object p1, p0, Lcom/ctzlab/commentapp/MainActivity$1$1;->this$1:Lcom/ctzlab/commentapp/MainActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .line 122
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/ctzlab/commentapp/MainActivity$1$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "response"    # Lorg/json/JSONObject;

    .line 125
    iget-object v0, p0, Lcom/ctzlab/commentapp/MainActivity$1$1;->this$1:Lcom/ctzlab/commentapp/MainActivity$1;

    iget-object v0, v0, Lcom/ctzlab/commentapp/MainActivity$1;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    iget-object v0, v0, Lcom/ctzlab/commentapp/MainActivity;->commentMessage:Lcom/google/android/material/textfield/TextInputEditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 126
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "POST RES:::"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    iget-object v0, p0, Lcom/ctzlab/commentapp/MainActivity$1$1;->this$1:Lcom/ctzlab/commentapp/MainActivity$1;

    iget-object v0, v0, Lcom/ctzlab/commentapp/MainActivity$1;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    iget-object v0, v0, Lcom/ctzlab/commentapp/MainActivity;->loader:Landroid/widget/TextView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 128
    iget-object v0, p0, Lcom/ctzlab/commentapp/MainActivity$1$1;->this$1:Lcom/ctzlab/commentapp/MainActivity$1;

    iget-object v0, v0, Lcom/ctzlab/commentapp/MainActivity$1;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-static {v0}, Lcom/ctzlab/commentapp/MainActivity;->access$200(Lcom/ctzlab/commentapp/MainActivity;)V

    .line 129
    return-void
.end method
