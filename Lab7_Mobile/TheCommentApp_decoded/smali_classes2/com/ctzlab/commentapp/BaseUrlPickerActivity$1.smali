.class Lcom/ctzlab/commentapp/BaseUrlPickerActivity$1;
.super Ljava/lang/Object;
.source "BaseUrlPickerActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ctzlab/commentapp/BaseUrlPickerActivity;->initActions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ctzlab/commentapp/BaseUrlPickerActivity;


# direct methods
.method constructor <init>(Lcom/ctzlab/commentapp/BaseUrlPickerActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/ctzlab/commentapp/BaseUrlPickerActivity;

    .line 26
    iput-object p1, p0, Lcom/ctzlab/commentapp/BaseUrlPickerActivity$1;->this$0:Lcom/ctzlab/commentapp/BaseUrlPickerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .line 29
    iget-object v0, p0, Lcom/ctzlab/commentapp/BaseUrlPickerActivity$1;->this$0:Lcom/ctzlab/commentapp/BaseUrlPickerActivity;

    iget-object v0, v0, Lcom/ctzlab/commentapp/BaseUrlPickerActivity;->userName:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 30
    iget-object v0, p0, Lcom/ctzlab/commentapp/BaseUrlPickerActivity$1;->this$0:Lcom/ctzlab/commentapp/BaseUrlPickerActivity;

    invoke-virtual {v0}, Lcom/ctzlab/commentapp/BaseUrlPickerActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/ctzlab/commentapp/BaseUrlPickerActivity$1;->this$0:Lcom/ctzlab/commentapp/BaseUrlPickerActivity;

    iget-object v1, v1, Lcom/ctzlab/commentapp/BaseUrlPickerActivity;->userName:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v1}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ctzlab/commentapp/AppPreferences;->setBaseUrl(Landroid/content/Context;Ljava/lang/String;)V

    .line 31
    iget-object v0, p0, Lcom/ctzlab/commentapp/BaseUrlPickerActivity$1;->this$0:Lcom/ctzlab/commentapp/BaseUrlPickerActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/ctzlab/commentapp/BaseUrlPickerActivity$1;->this$0:Lcom/ctzlab/commentapp/BaseUrlPickerActivity;

    const-class v3, Lcom/ctzlab/commentapp/LoginActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/ctzlab/commentapp/BaseUrlPickerActivity;->startActivity(Landroid/content/Intent;)V

    .line 32
    iget-object v0, p0, Lcom/ctzlab/commentapp/BaseUrlPickerActivity$1;->this$0:Lcom/ctzlab/commentapp/BaseUrlPickerActivity;

    invoke-virtual {v0}, Lcom/ctzlab/commentapp/BaseUrlPickerActivity;->finish()V

    .line 34
    :cond_0
    return-void
.end method
