package com.ctzlab.commentapp;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import androidx.appcompat.app.AppCompatActivity;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.material.textfield.TextInputEditText;
import es.dmoral.toasty.Toasty;
import fr.castorflex.android.smoothprogressbar.SmoothProgressBar;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class CreateUserActivity extends AppCompatActivity {
    TextInputEditText displayName;
    Button loginBtn;
    TextInputEditText password;
    SmoothProgressBar progressBar;
    TextInputEditText userName;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_create_user);
        initViews();
        initActions();
    }

    private void initActions() {
        this.loginBtn.setOnClickListener(new View.OnClickListener() { // from class: com.ctzlab.commentapp.CreateUserActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                String userNameValue = CreateUserActivity.this.userName.getText().toString();
                String passwordValue = CreateUserActivity.this.password.getText().toString();
                String displayNameValue = CreateUserActivity.this.displayName.getText().toString();
                if (!userNameValue.equals("") && !passwordValue.equals("")) {
                    try {
                        makeLoginCall(userNameValue, passwordValue, displayNameValue);
                        return;
                    } catch (JSONException e) {
                        e.printStackTrace();
                        return;
                    }
                }
                Toasty.warning(CreateUserActivity.this.getApplicationContext(), "Please Enter Username & Password", 0).show();
            }

            private void makeLoginCall(String userNameValue, String passwordValue, String displayNameValue) throws JSONException {
                CreateUserActivity.this.progressBar.setVisibility(0);
                RequestQueue queue = Volley.newRequestQueue(CreateUserActivity.this);
                String url = AppPreferences.getBaseUrl(CreateUserActivity.this.getApplicationContext()) + "/api3/user";
                JSONObject jsonBody = new JSONObject();
                jsonBody.put("username", userNameValue);
                jsonBody.put("password", passwordValue);
                jsonBody.put("name", displayNameValue);
                JsonObjectRequest postRequest = new JsonObjectRequest(url, jsonBody, new Response.Listener<JSONObject>() { // from class: com.ctzlab.commentapp.CreateUserActivity.1.1
                    @Override // com.android.volley.Response.Listener
                    public void onResponse(JSONObject response) {
                        Log.d("Create User RES :: ", response.toString());
                        Toasty.success(CreateUserActivity.this.getApplicationContext(), "User Created!", 0).show();
                        CreateUserActivity.this.startActivity(new Intent(CreateUserActivity.this, (Class<?>) LoginActivity.class));
                        CreateUserActivity.this.finish();
                        CreateUserActivity.this.progressBar.setVisibility(4);
                    }
                }, new Response.ErrorListener() { // from class: com.ctzlab.commentapp.CreateUserActivity.1.2
                    @Override // com.android.volley.Response.ErrorListener
                    public void onErrorResponse(VolleyError error) {
                        Log.d("Error.Response", String.valueOf(error));
                        CreateUserActivity.this.progressBar.setVisibility(8);
                        Toasty.error(CreateUserActivity.this.getApplicationContext(), (CharSequence) "Something went wrong, please try again!", 0, false).show();
                    }
                });
                postRequest.setRetryPolicy(new DefaultRetryPolicy(10000, 0, 1.0f));
                queue.add(postRequest);
            }
        });
    }

    private void initViews() {
        this.userName = (TextInputEditText) findViewById(R.id.userName);
        this.password = (TextInputEditText) findViewById(R.id.password);
        this.displayName = (TextInputEditText) findViewById(R.id.displayName);
        this.loginBtn = (Button) findViewById(R.id.loginButton);
        this.progressBar = (SmoothProgressBar) findViewById(R.id.progress_horizontal);
    }
}
