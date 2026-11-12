.class Lcom/ctzlab/commentapp/ui/CardAdapter$CartViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "CardAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ctzlab/commentapp/ui/CardAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CartViewHolder"
.end annotation


# instance fields
.field commentBy:Landroid/widget/TextView;

.field commentMessage:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .line 27
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 28
    const v0, 0x7f09007d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/ctzlab/commentapp/ui/CardAdapter$CartViewHolder;->commentMessage:Landroid/widget/TextView;

    .line 29
    const v0, 0x7f09007c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/ctzlab/commentapp/ui/CardAdapter$CartViewHolder;->commentBy:Landroid/widget/TextView;

    .line 30
    return-void
.end method
