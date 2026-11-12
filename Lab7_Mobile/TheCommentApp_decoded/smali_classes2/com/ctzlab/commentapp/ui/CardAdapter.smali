.class public Lcom/ctzlab/commentapp/ui/CardAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "CardAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ctzlab/commentapp/ui/CardAdapter$CartViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/ctzlab/commentapp/ui/CardAdapter$CartViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private cartItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ctzlab/commentapp/modal/Comment;",
            ">;"
        }
    .end annotation
.end field

.field private context:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Ljava/util/List;Landroid/app/Activity;)V
    .locals 0
    .param p2, "context"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ctzlab/commentapp/modal/Comment;",
            ">;",
            "Landroid/app/Activity;",
            ")V"
        }
    .end annotation

    .line 34
    .local p1, "moviesList":Ljava/util/List;, "Ljava/util/List<Lcom/ctzlab/commentapp/modal/Comment;>;"
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/ctzlab/commentapp/ui/CardAdapter;->cartItems:Ljava/util/List;

    .line 36
    iput-object p2, p0, Lcom/ctzlab/commentapp/ui/CardAdapter;->context:Landroid/app/Activity;

    .line 37
    return-void
.end method


# virtual methods
.method public getAdapterData()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ctzlab/commentapp/modal/Comment;",
            ">;"
        }
    .end annotation

    .line 57
    iget-object v0, p0, Lcom/ctzlab/commentapp/ui/CardAdapter;->cartItems:Ljava/util/List;

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/ctzlab/commentapp/ui/CardAdapter;->cartItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .line 67
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemViewType(I)I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 19
    check-cast p1, Lcom/ctzlab/commentapp/ui/CardAdapter$CartViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/ctzlab/commentapp/ui/CardAdapter;->onBindViewHolder(Lcom/ctzlab/commentapp/ui/CardAdapter$CartViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/ctzlab/commentapp/ui/CardAdapter$CartViewHolder;I)V
    .locals 5
    .param p1, "holder"    # Lcom/ctzlab/commentapp/ui/CardAdapter$CartViewHolder;
    .param p2, "position"    # I

    .line 51
    iget-object v0, p0, Lcom/ctzlab/commentapp/ui/CardAdapter;->cartItems:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ctzlab/commentapp/modal/Comment;

    .line 52
    .local v0, "item":Lcom/ctzlab/commentapp/modal/Comment;
    iget-object v1, p1, Lcom/ctzlab/commentapp/ui/CardAdapter$CartViewHolder;->commentMessage:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/ctzlab/commentapp/modal/Comment;->getCommentText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    iget-object v1, p1, Lcom/ctzlab/commentapp/ui/CardAdapter$CartViewHolder;->commentBy:Landroid/widget/TextView;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/ctzlab/commentapp/modal/Comment;->getUsername()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "@%s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/ctzlab/commentapp/ui/CardAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/ctzlab/commentapp/ui/CardAdapter$CartViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/ctzlab/commentapp/ui/CardAdapter$CartViewHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .line 42
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 43
    const v1, 0x7f0c0021

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 45
    .local v0, "itemView":Landroid/view/View;
    new-instance v1, Lcom/ctzlab/commentapp/ui/CardAdapter$CartViewHolder;

    invoke-direct {v1, v0}, Lcom/ctzlab/commentapp/ui/CardAdapter$CartViewHolder;-><init>(Landroid/view/View;)V

    return-object v1
.end method
