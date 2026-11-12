.class public Lcom/ctzlab/commentapp/modal/Comment;
.super Ljava/lang/Object;
.source "Comment.java"


# instance fields
.field private commentText:Ljava/lang/String;

.field private deviceId:Ljava/lang/String;

.field private id:Ljava/lang/Integer;

.field private latitude:Ljava/lang/Double;

.field private longitude:Ljava/lang/Double;

.field private username:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCommentText()Ljava/lang/String;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/ctzlab/commentapp/modal/Comment;->commentText:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceId()Ljava/lang/String;
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/ctzlab/commentapp/modal/Comment;->deviceId:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/Integer;
    .locals 1

    .line 9
    iget-object v0, p0, Lcom/ctzlab/commentapp/modal/Comment;->id:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLatitude()Ljava/lang/Double;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/ctzlab/commentapp/modal/Comment;->latitude:Ljava/lang/Double;

    return-object v0
.end method

.method public getLongitude()Ljava/lang/Double;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/ctzlab/commentapp/modal/Comment;->longitude:Ljava/lang/Double;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/ctzlab/commentapp/modal/Comment;->username:Ljava/lang/String;

    return-object v0
.end method

.method public setCommentText(Ljava/lang/String;)V
    .locals 0
    .param p1, "commentText"    # Ljava/lang/String;

    .line 29
    iput-object p1, p0, Lcom/ctzlab/commentapp/modal/Comment;->commentText:Ljava/lang/String;

    .line 30
    return-void
.end method

.method public setDeviceId(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceId"    # Ljava/lang/String;

    .line 21
    iput-object p1, p0, Lcom/ctzlab/commentapp/modal/Comment;->deviceId:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public setId(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/Integer;

    .line 13
    iput-object p1, p0, Lcom/ctzlab/commentapp/modal/Comment;->id:Ljava/lang/Integer;

    .line 14
    return-void
.end method

.method public setLatitude(Ljava/lang/Double;)V
    .locals 0
    .param p1, "latitude"    # Ljava/lang/Double;

    .line 45
    iput-object p1, p0, Lcom/ctzlab/commentapp/modal/Comment;->latitude:Ljava/lang/Double;

    .line 46
    return-void
.end method

.method public setLongitude(Ljava/lang/Double;)V
    .locals 0
    .param p1, "longitude"    # Ljava/lang/Double;

    .line 53
    iput-object p1, p0, Lcom/ctzlab/commentapp/modal/Comment;->longitude:Ljava/lang/Double;

    .line 54
    return-void
.end method

.method public setUsername(Ljava/lang/String;)V
    .locals 0
    .param p1, "username"    # Ljava/lang/String;

    .line 37
    iput-object p1, p0, Lcom/ctzlab/commentapp/modal/Comment;->username:Ljava/lang/String;

    .line 38
    return-void
.end method
