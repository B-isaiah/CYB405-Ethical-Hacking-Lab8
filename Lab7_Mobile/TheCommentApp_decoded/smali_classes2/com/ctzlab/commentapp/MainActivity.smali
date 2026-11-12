.class public Lcom/ctzlab/commentapp/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# instance fields
.field commentMessage:Lcom/google/android/material/textfield/TextInputEditText;

.field listView:Landroidx/recyclerview/widget/RecyclerView;

.field loader:Landroid/widget/TextView;

.field postComment:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private OnGPS()V
    .locals 4

    .line 221
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 222
    .local v0, "builder":Landroidx/appcompat/app/AlertDialog$Builder;
    const-string v1, "Enable GPS"

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setCancelable(Z)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/ctzlab/commentapp/MainActivity$5;

    invoke-direct {v2, p0}, Lcom/ctzlab/commentapp/MainActivity$5;-><init>(Lcom/ctzlab/commentapp/MainActivity;)V

    const-string v3, "Yes"

    invoke-virtual {v1, v3, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/ctzlab/commentapp/MainActivity$4;

    invoke-direct {v2, p0}, Lcom/ctzlab/commentapp/MainActivity$4;-><init>(Lcom/ctzlab/commentapp/MainActivity;)V

    .line 227
    const-string v3, "No"

    invoke-virtual {v1, v3, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 233
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v1

    .line 234
    .local v1, "alertDialog":Landroidx/appcompat/app/AlertDialog;
    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog;->show()V

    .line 235
    return-void
.end method

.method static synthetic access$000(Lcom/ctzlab/commentapp/MainActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/ctzlab/commentapp/MainActivity;

    .line 52
    invoke-direct {p0}, Lcom/ctzlab/commentapp/MainActivity;->OnGPS()V

    return-void
.end method

.method static synthetic access$100(Lcom/ctzlab/commentapp/MainActivity;)Landroid/location/Location;
    .locals 1
    .param p0, "x0"    # Lcom/ctzlab/commentapp/MainActivity;

    .line 52
    invoke-direct {p0}, Lcom/ctzlab/commentapp/MainActivity;->getLastKnownLocation()Landroid/location/Location;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/ctzlab/commentapp/MainActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/ctzlab/commentapp/MainActivity;

    .line 52
    invoke-direct {p0}, Lcom/ctzlab/commentapp/MainActivity;->loadData()V

    return-void
.end method

.method private getLastKnownLocation()Landroid/location/Location;
    .locals 8

    .line 238
    const-string v0, "location"

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/LocationManager;

    .line 239
    .local v1, "mLocationManager":Landroid/location/LocationManager;
    invoke-virtual {p0}, Lcom/ctzlab/commentapp/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    .line 240
    .end local v1    # "mLocationManager":Landroid/location/LocationManager;
    .local v0, "mLocationManager":Landroid/location/LocationManager;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getProviders(Z)Ljava/util/List;

    move-result-object v2

    .line 241
    .local v2, "providers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .line 242
    .local v3, "bestLocation":Landroid/location/Location;
    const-string v4, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {p0, v4}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_0

    .line 243
    const-string v5, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {p0, v5}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_0

    .line 245
    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4, v1}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    goto :goto_1

    .line 247
    :cond_0
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 248
    .local v4, "provider":Ljava/lang/String;
    invoke-virtual {v0, v4}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v5

    .line 249
    .local v5, "l":Landroid/location/Location;
    if-nez v5, :cond_1

    .line 250
    goto :goto_0

    .line 252
    :cond_1
    if-eqz v3, :cond_2

    invoke-virtual {v5}, Landroid/location/Location;->getAccuracy()F

    move-result v6

    invoke-virtual {v3}, Landroid/location/Location;->getAccuracy()F

    move-result v7

    cmpg-float v6, v6, v7

    if-gez v6, :cond_3

    .line 254
    :cond_2
    move-object v3, v5

    .line 256
    .end local v4    # "provider":Ljava/lang/String;
    .end local v5    # "l":Landroid/location/Location;
    :cond_3
    goto :goto_0

    .line 258
    :cond_4
    :goto_1
    return-object v3
.end method

.method private initActions()V
    .locals 2

    .line 70
    iget-object v0, p0, Lcom/ctzlab/commentapp/MainActivity;->postComment:Landroid/widget/ImageView;

    new-instance v1, Lcom/ctzlab/commentapp/MainActivity$1;

    invoke-direct {v1, p0}, Lcom/ctzlab/commentapp/MainActivity$1;-><init>(Lcom/ctzlab/commentapp/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 145
    return-void
.end method

.method private initViews()V
    .locals 1

    .line 148
    const v0, 0x7f0900f0

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/ctzlab/commentapp/MainActivity;->loader:Landroid/widget/TextView;

    .line 149
    const v0, 0x7f09014d

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/ctzlab/commentapp/MainActivity;->postComment:Landroid/widget/ImageView;

    .line 150
    const v0, 0x7f09007d

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/ctzlab/commentapp/MainActivity;->commentMessage:Lcom/google/android/material/textfield/TextInputEditText;

    .line 151
    const v0, 0x7f0900ee

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v0, p0, Lcom/ctzlab/commentapp/MainActivity;->listView:Landroidx/recyclerview/widget/RecyclerView;

    .line 152
    return-void
.end method

.method private loadData()V
    .locals 7

    .line 155
    invoke-static {p0}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object v0

    .line 156
    .local v0, "queue":Lcom/android/volley/RequestQueue;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/ctzlab/commentapp/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/ctzlab/commentapp/AppPreferences;->getBaseUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/api3/comment"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 158
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/android/volley/toolbox/JsonArrayRequest;

    new-instance v3, Lcom/ctzlab/commentapp/MainActivity$2;

    invoke-direct {v3, p0}, Lcom/ctzlab/commentapp/MainActivity$2;-><init>(Lcom/ctzlab/commentapp/MainActivity;)V

    new-instance v4, Lcom/ctzlab/commentapp/MainActivity$3;

    invoke-direct {v4, p0}, Lcom/ctzlab/commentapp/MainActivity$3;-><init>(Lcom/ctzlab/commentapp/MainActivity;)V

    invoke-direct {v2, v1, v3, v4}, Lcom/android/volley/toolbox/JsonArrayRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 216
    .local v2, "postRequest":Lcom/android/volley/toolbox/JsonArrayRequest;
    new-instance v3, Lcom/android/volley/DefaultRetryPolicy;

    const/16 v4, 0x2710

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v3, v4, v5, v6}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {v2, v3}, Lcom/android/volley/toolbox/JsonArrayRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 217
    invoke-virtual {v0, v2}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 218
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 61
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 62
    const v0, 0x7f0c001f

    invoke-virtual {p0, v0}, Lcom/ctzlab/commentapp/MainActivity;->setContentView(I)V

    .line 64
    invoke-direct {p0}, Lcom/ctzlab/commentapp/MainActivity;->initViews()V

    .line 65
    invoke-direct {p0}, Lcom/ctzlab/commentapp/MainActivity;->initActions()V

    .line 66
    invoke-direct {p0}, Lcom/ctzlab/commentapp/MainActivity;->loadData()V

    .line 67
    return-void
.end method
