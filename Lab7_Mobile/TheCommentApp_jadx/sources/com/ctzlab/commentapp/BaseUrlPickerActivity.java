package com.ctzlab.commentapp;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import androidx.appcompat.app.AppCompatActivity;
import com.google.android.material.textfield.TextInputEditText;

/* JADX INFO: loaded from: classes2.dex */
public class BaseUrlPickerActivity extends AppCompatActivity {
    Button loginBtn;
    TextInputEditText userName;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_base_url_picker);
        initViews();
        initActions();
    }

    private void initActions() {
        this.loginBtn.setOnClickListener(new View.OnClickListener() { // from class: com.ctzlab.commentapp.BaseUrlPickerActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (!BaseUrlPickerActivity.this.userName.getText().toString().equals("")) {
                    AppPreferences.setBaseUrl(BaseUrlPickerActivity.this.getApplicationContext(), BaseUrlPickerActivity.this.userName.getText().toString());
                    BaseUrlPickerActivity.this.startActivity(new Intent(BaseUrlPickerActivity.this, (Class<?>) LoginActivity.class));
                    BaseUrlPickerActivity.this.finish();
                }
            }
        });
    }

    private void initViews() {
        this.userName = (TextInputEditText) findViewById(R.id.baseUrl);
        this.loginBtn = (Button) findViewById(R.id.saveBtn);
    }
}
