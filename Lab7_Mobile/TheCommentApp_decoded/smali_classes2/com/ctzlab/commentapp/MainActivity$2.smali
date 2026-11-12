.class Lcom/ctzlab/commentapp/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ctzlab/commentapp/MainActivity;->loadData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener<",
        "Lorg/json/JSONArray;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ctzlab/commentapp/MainActivity;


# direct methods
.method constructor <init>(Lcom/ctzlab/commentapp/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/ctzlab/commentapp/MainActivity;

    .line 159
    iput-object p1, p0, Lcom/ctzlab/commentapp/MainActivity$2;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .line 159
    check-cast p1, Lorg/json/JSONArray;

    invoke-virtual {p0, p1}, Lcom/ctzlab/commentapp/MainActivity$2;->onResponse(Lorg/json/JSONArray;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONArray;)V
    .locals 5
    .param p1, "response"    # Lorg/json/JSONArray;

    .line 163
    :try_start_0
    const-string v0, "COMMENTS:::: "

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 165
    .local v0, "commentList":Ljava/util/List;, "Ljava/util/List<Lcom/ctzlab/commentapp/modal/Comment;>;"
    const/4 v1, 0x0

    .local v1, "itr":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 166
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 167
    .local v2, "commentObj":Lorg/json/JSONObject;
    new-instance v3, Lcom/ctzlab/commentapp/modal/Comment;

    invoke-direct {v3}, Lcom/ctzlab/commentapp/modal/Comment;-><init>()V

    .line 168
    .local v3, "comment":Lcom/ctzlab/commentapp/modal/Comment;
    const-string v4, "username"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/ctzlab/commentapp/modal/Comment;->setUsername(Ljava/lang/String;)V

    .line 169
    const-string v4, "commenttext"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/ctzlab/commentapp/modal/Comment;->setCommentText(Ljava/lang/String;)V

    .line 170
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    nop

    .end local v2    # "commentObj":Lorg/json/JSONObject;
    .end local v3    # "comment":Lcom/ctzlab/commentapp/modal/Comment;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 173
    .end local v1    # "itr":I
    :cond_0
    new-instance v1, Lcom/ctzlab/commentapp/ui/CardAdapter;

    iget-object v2, p0, Lcom/ctzlab/commentapp/MainActivity$2;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-direct {v1, v0, v2}, Lcom/ctzlab/commentapp/ui/CardAdapter;-><init>(Ljava/util/List;Landroid/app/Activity;)V

    .line 174
    .local v1, "adapter":Lcom/ctzlab/commentapp/ui/CardAdapter;
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    iget-object v3, p0, Lcom/ctzlab/commentapp/MainActivity$2;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    invoke-direct {v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 175
    .local v2, "mLayoutManager":Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    iget-object v3, p0, Lcom/ctzlab/commentapp/MainActivity$2;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    iget-object v3, v3, Lcom/ctzlab/commentapp/MainActivity;->listView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 176
    iget-object v3, p0, Lcom/ctzlab/commentapp/MainActivity$2;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    iget-object v3, v3, Lcom/ctzlab/commentapp/MainActivity;->listView:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v4, Lcom/ctzlab/commentapp/MainActivity$2$1;

    invoke-direct {v4, p0}, Lcom/ctzlab/commentapp/MainActivity$2$1;-><init>(Lcom/ctzlab/commentapp/MainActivity$2;)V

    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 197
    iget-object v3, p0, Lcom/ctzlab/commentapp/MainActivity$2;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    iget-object v3, v3, Lcom/ctzlab/commentapp/MainActivity;->listView:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v4, Landroidx/recyclerview/widget/DefaultItemAnimator;

    invoke-direct {v4}, Landroidx/recyclerview/widget/DefaultItemAnimator;-><init>()V

    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    .line 198
    iget-object v3, p0, Lcom/ctzlab/commentapp/MainActivity$2;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    iget-object v3, v3, Lcom/ctzlab/commentapp/MainActivity;->listView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    .end local v0    # "commentList":Ljava/util/List;, "Ljava/util/List<Lcom/ctzlab/commentapp/modal/Comment;>;"
    .end local v1    # "adapter":Lcom/ctzlab/commentapp/ui/CardAdapter;
    .end local v2    # "mLayoutManager":Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    goto :goto_1

    .line 199
    :catch_0
    move-exception v0

    .line 200
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 202
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_1
    iget-object v0, p0, Lcom/ctzlab/commentapp/MainActivity$2;->this$0:Lcom/ctzlab/commentapp/MainActivity;

    iget-object v0, v0, Lcom/ctzlab/commentapp/MainActivity;->loader:Landroid/widget/TextView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 203
    return-void
.end method
