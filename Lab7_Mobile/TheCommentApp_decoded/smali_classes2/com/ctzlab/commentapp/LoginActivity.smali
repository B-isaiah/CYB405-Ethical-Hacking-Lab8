.class public Lcom/ctzlab/commentapp/LoginActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "LoginActivity.java"


# instance fields
.field createAccount:Landroid/widget/TextView;

.field loginBtn:Landroid/widget/Button;

.field password:Lcom/google/android/material/textfield/TextInputEditText;

.field progressBar:Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;

.field userName:Lcom/google/android/material/textfield/TextInputEditText;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private initActions()V
    .locals 2

    .line 49
    iget-object v0, p0, Lcom/ctzlab/commentapp/LoginActivity;->loginBtn:Landroid/widget/Button;

    new-instance v1, Lcom/ctzlab/commentapp/LoginActivity$1;

    invoke-direct {v1, p0}, Lcom/ctzlab/commentapp/LoginActivity$1;-><init>(Lcom/ctzlab/commentapp/LoginActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    iget-object v0, p0, Lcom/ctzlab/commentapp/LoginActivity;->createAccount:Landroid/widget/TextView;

    new-instance v1, Lcom/ctzlab/commentapp/LoginActivity$2;

    invoke-direct {v1, p0}, Lcom/ctzlab/commentapp/LoginActivity$2;-><init>(Lcom/ctzlab/commentapp/LoginActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    return-void
.end method

.method private initViews()V
    .locals 1

    .line 124
    const v0, 0x7f0901d9

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/ctzlab/commentapp/LoginActivity;->userName:Lcom/google/android/material/textfield/TextInputEditText;

    .line 125
    const v0, 0x7f090145

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/ctzlab/commentapp/LoginActivity;->password:Lcom/google/android/material/textfield/TextInputEditText;

    .line 126
    const v0, 0x7f090089

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/ctzlab/commentapp/LoginActivity;->createAccount:Landroid/widget/TextView;

    .line 127
    const v0, 0x7f0900f1

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/ctzlab/commentapp/LoginActivity;->loginBtn:Landroid/widget/Button;

    .line 128
    const v0, 0x7f090151

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;

    iput-object v0, p0, Lcom/ctzlab/commentapp/LoginActivity;->progressBar:Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;

    .line 129
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 41
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 42
    const v0, 0x7f0c001e

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/LoginActivity;->setContentView(I)V

    .line 44
    invoke-direct {p0}, Lcom/ctzlab/commentapp/LoginActivity;->initViews()V

    .line 45
    invoke-direct {p0}, Lcom/ctzlab/commentapp/LoginActivity;->initActions()V

    .line 46
    return-void
.end method
