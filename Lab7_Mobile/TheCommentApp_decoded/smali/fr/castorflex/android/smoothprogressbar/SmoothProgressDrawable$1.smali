.class Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;
.super Ljava/lang/Object;
.source "SmoothProgressDrawable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;


# direct methods
.method constructor <init>(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;)V
    .locals 0
    .param p1, "this$0"    # Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    .line 560
    iput-object p1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 564
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-virtual {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->isFinishing()Z

    move-result v0

    const v1, 0x3c23d70a    # 0.01f

    if-eqz v0, :cond_0

    .line 565
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-static {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$000(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;)F

    move-result v2

    iget-object v3, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-static {v3}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$100(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;)F

    move-result v3

    mul-float/2addr v3, v1

    add-float/2addr v2, v3

    invoke-static {v0, v2}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$002(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;F)F

    .line 566
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-static {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$200(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;)F

    move-result v2

    iget-object v3, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-static {v3}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$100(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;)F

    move-result v3

    mul-float/2addr v3, v1

    add-float/2addr v2, v3

    invoke-static {v0, v2}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$202(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;F)F

    .line 567
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-static {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$000(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;)F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_2

    .line 568
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-virtual {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->stop()V

    goto :goto_0

    .line 570
    :cond_0
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-virtual {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->isStarting()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 571
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-static {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$200(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;)F

    move-result v2

    iget-object v3, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-static {v3}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$300(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;)F

    move-result v3

    mul-float/2addr v3, v1

    add-float/2addr v2, v3

    invoke-static {v0, v2}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$202(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;F)F

    goto :goto_0

    .line 573
    :cond_1
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-static {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$200(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;)F

    move-result v2

    iget-object v3, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-static {v3}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$400(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;)F

    move-result v3

    mul-float/2addr v3, v1

    add-float/2addr v2, v3

    invoke-static {v0, v2}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$202(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;F)F

    .line 576
    :cond_2
    :goto_0
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-static {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$200(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;)F

    move-result v0

    iget-object v1, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-static {v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$500(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;)F

    move-result v1

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_3

    .line 577
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$602(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;Z)Z

    .line 578
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-static {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$200(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;)F

    move-result v1

    iget-object v2, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-static {v2}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$500(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;)F

    move-result v2

    sub-float/2addr v1, v2

    invoke-static {v0, v1}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$202(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;F)F

    .line 581
    :cond_3
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-virtual {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 582
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-static {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->access$700(Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x10

    add-long/2addr v2, v4

    invoke-virtual {v0, v1, v2, v3}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 584
    :cond_4
    iget-object v0, p0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable$1;->this$0:Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;

    invoke-virtual {v0}, Lfr/castorflex/android/smoothprogressbar/SmoothProgressDrawable;->invalidateSelf()V

    .line 585
    return-void
.end method
