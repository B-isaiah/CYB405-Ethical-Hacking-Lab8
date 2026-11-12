.class Lcom/ctzlab/commentapp/MainActivity$2$1;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ctzlab/commentapp/MainActivity$2;->onResponse(Lorg/json/JSONArray;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/ctzlab/commentapp/MainActivity$2;


# direct methods
.method constructor <init>(Lcom/ctzlab/commentapp/MainActivity$2;)V
    .locals 0
    .param p1, "this$1"    # Lcom/ctzlab/commentapp/MainActivity$2;

    .line 176
    iput-object p1, p0, Lcom/ctzlab/commentapp/MainActivity$2$1;->this$1:Lcom/ctzlab/commentapp/MainActivity$2;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V

    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 2
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroidx/recyclerview/widget/RecyclerView;
    .param p4, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 184
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V

    .line 185
    const/4 v0, 0x5

    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 186
    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 187
    const/16 v1, 0x28

    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 190
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I

    move-result v1

    if-nez v1, :cond_0

    .line 191
    iput v0, p1, Landroid/graphics/Rect;->top:I

    goto :goto_0

    .line 193
    :cond_0
    const/4 v0, 0x0

    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 195
    :goto_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 0
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "parent"    # Landroidx/recyclerview/widget/RecyclerView;
    .param p3, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 179
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;->onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V

    .line 180
    return-void
.end method
