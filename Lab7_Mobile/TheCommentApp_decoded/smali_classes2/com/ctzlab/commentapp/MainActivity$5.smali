.class Lcom/ctzlab/commentapp/MainActivity$5;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ctzlab/commentapp/MainActivity;->OnGPS()V
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

    .line 222
    iput-object p1, p0, Lcom/ctzlab/commentapp/MainActivity$5;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 225
    iget-object v0, p0, Lcom/ctzlab/commentapp/MainActivity$5;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.LOCATION_SOURCE_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/ctzlab/commentapp/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 226
    return-void
.end method
