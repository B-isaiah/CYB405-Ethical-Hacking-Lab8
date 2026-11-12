.class public Lcom/ctzlab/commentapp/BaseUrlPickerActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "BaseUrlPickerActivity.java"


# instance fields
.field loginBtn:Landroid/widget/Button;

.field userName:Lcom/google/android/material/textfield/TextInputEditText;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private initActions()V
    .locals 2

    .line 26
    iget-object v0, p0, Lcom/ctzlab/commentapp/BaseUrlPickerActivity;->loginBtn:Landroid/widget/Button;

    new-instance v1, Lcom/ctzlab/commentapp/BaseUrlPickerActivity$1;

    invoke-direct {v1, p0}, Lcom/ctzlab/commentapp/BaseUrlPickerActivity$1;-><init>(Lcom/ctzlab/commentapp/BaseUrlPickerActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 36
    return-void
.end method

.method private initViews()V
    .locals 1

    .line 39
    const v0, 0x7f090058

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/BaseUrlPickerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/ctzlab/commentapp/BaseUrlPickerActivity;->userName:Lcom/google/android/material/textfield/TextInputEditText;

    .line 40
    const v0, 0x7f09015c

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/BaseUrlPickerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/ctzlab/commentapp/BaseUrlPickerActivity;->loginBtn:Landroid/widget/Button;

    .line 41
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 18
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    const v0, 0x7f0c001c

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/BaseUrlPickerActivity;->setContentView(I)V

    .line 21
    invoke-direct {p0}, Lcom/ctzlab/commentapp/BaseUrlPickerActivity;->initViews()V

    .line 22
    invoke-direct {p0}, Lcom/ctzlab/commentapp/BaseUrlPickerActivity;->initActions()V

    .line 23
    return-void
.end method
