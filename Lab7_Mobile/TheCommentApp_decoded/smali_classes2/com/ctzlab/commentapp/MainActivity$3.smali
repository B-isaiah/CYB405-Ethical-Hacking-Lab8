.class Lcom/ctzlab/commentapp/MainActivity$3;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ctzlab/commentapp/MainActivity;->loadData()V
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

    .line 206
    iput-object p1, p0, Lcom/ctzlab/commentapp/MainActivity$3;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 3
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .line 209
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Error.Response"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    iget-object v0, p0, Lcom/ctzlab/commentapp/MainActivity$3;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    iget-object v0, v0, Lcom/ctzlab/commentapp/MainActivity;->loader:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 211
    iget-object v0, p0, Lcom/ctzlab/commentapp/MainActivity$3;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-virtual {v0}, Lcom/ctzlab/commentapp/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Something went wrong, please try again!"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2, v2}, Les/dmoral/toasty/Toasty;->error(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 212
    return-void
.end method
