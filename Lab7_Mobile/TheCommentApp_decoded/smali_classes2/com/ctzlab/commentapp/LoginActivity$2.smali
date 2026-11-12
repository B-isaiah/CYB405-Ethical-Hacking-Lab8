.class Lcom/ctzlab/commentapp/LoginActivity$2;
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

    .line 114
    iput-object p1, p0, Lcom/ctzlab/commentapp/LoginActivity$2;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .line 117
    iget-object v0, p0, Lcom/ctzlab/commentapp/LoginActivity$2;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/ctzlab/commentapp/LoginActivity$2;->this$0:Lcom/ctzlab/commentapp/LoginActivity;

    const-class v3, Lcom/ctzlab/commentapp/CreateUserActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/ctzlab/commentapp/LoginActivity;->startActivity(Landroid/content/Intent;)V

    .line 118
    return-void
.end method
