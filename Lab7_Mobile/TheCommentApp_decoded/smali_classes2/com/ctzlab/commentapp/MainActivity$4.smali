.class Lcom/ctzlab/commentapp/MainActivity$4;
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

    .line 227
    iput-object p1, p0, Lcom/ctzlab/commentapp/MainActivity$4;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 230
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 231
    return-void
.end method
