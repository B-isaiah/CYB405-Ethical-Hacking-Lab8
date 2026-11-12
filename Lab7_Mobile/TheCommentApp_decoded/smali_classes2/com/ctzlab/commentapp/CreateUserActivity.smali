.class public Lcom/ctzlab/commentapp/CreateUserActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "CreateUserActivity.java"


# instance fields
.field displayName:Lcom/google/android/material/textfield/TextInputEditText;

.field loginBtn:Landroid/widget/Button;

.field password:Lcom/google/android/material/textfield/TextInputEditText;

.field progressBar:Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;

.field userName:Lcom/google/android/material/textfield/TextInputEditText;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private initActions()V
    .locals 2

    .line 45
    iget-object v0, p0, Lcom/ctzlab/commentapp/CreateUserActivity;->loginBtn:Landroid/widget/Button;

    new-instance v1, Lcom/ctzlab/commentapp/CreateUserActivity$1;

    invoke-direct {v1, p0}, Lcom/ctzlab/commentapp/CreateUserActivity$1;-><init>(Lcom/ctzlab/commentapp/CreateUserActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    return-void
.end method

.method private initViews()V
    .locals 1

    .line 100
    const v0, 0x7f0901d9

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/CreateUserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/ctzlab/commentapp/CreateUserActivity;->userName:Lcom/google/android/material/textfield/TextInputEditText;

    .line 101
    const v0, 0x7f090145

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/CreateUserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/ctzlab/commentapp/CreateUserActivity;->password:Lcom/google/android/material/textfield/TextInputEditText;

    .line 102
    const v0, 0x7f0900a2

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/CreateUserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/ctzlab/commentapp/CreateUserActivity;->displayName:Lcom/google/android/material/textfield/TextInputEditText;

    .line 103
    const v0, 0x7f0900f1

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/CreateUserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/ctzlab/commentapp/CreateUserActivity;->loginBtn:Landroid/widget/Button;

    .line 104
    const v0, 0x7f090151

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/CreateUserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;

    iput-object v0, p0, Lcom/ctzlab/commentapp/CreateUserActivity;->progressBar:Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;

    .line 105
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 37
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 38
    const v0, 0x7f0c001d

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/CreateUserActivity;->setContentView(I)V

    .line 40
    invoke-direct {p0}, Lcom/ctzlab/commentapp/CreateUserActivity;->initViews()V

    .line 41
    invoke-direct {p0}, Lcom/ctzlab/commentapp/CreateUserActivity;->initActions()V

    .line 42
    return-void
.end method
