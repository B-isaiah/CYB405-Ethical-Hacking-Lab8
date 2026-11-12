package com.ctzlab.commentapp;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
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
public class LoginActivity extends AppCompatActivity {
    TextView createAccount;
    Button loginBtn;
    TextInputEditText password;
    SmoothProgressBar progressBar;
    TextInputEditText userName;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        initViews();
        initActions();
    }

    private void initActions() {
        this.loginBtn.setOnClickListener(new View.OnClickListener() { // from class: com.ctzlab.commentapp.LoginActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                String userNameValue = LoginActivity.this.userName.getText().toString();
                String passwordValue = LoginActivity.this.password.getText().toString();
                if (!userNameValue.equals("") && !passwordValue.equals("")) {
                    try {
                        makeLoginCall(userNameValue, passwordValue);
                        return;
                    } catch (JSONException e) {
                        e.printStackTrace();
                        return;
                    }
                }
                Toasty.warning(LoginActivity.this.getApplicationContext(), "Please Enter Username & Password", 0).show();
            }

            private void makeLoginCall(String userNameValue, String passwordValue) throws JSONException {
                LoginActivity.this.progressBar.setVisibility(0);
                RequestQueue queue = Volley.newRequestQueue(LoginActivity.this);
                String url = AppPreferences.getBaseUrl(LoginActivity.this.getApplicationContext()) + "/api3/user/login";
                JSONObject jsonBody = new JSONObject();
                jsonBody.put("username", userNameValue);
                jsonBody.put("password", passwordValue);
                JsonObjectRequest postRequest = new JsonObjectRequest(url, jsonBody, new Response.Listener<JSONObject>() { // from class: com.ctzlab.commentapp.LoginActivity.1.1
                    @Override // com.android.volley.Response.Listener
                    public void onResponse(JSONObject response) {
                        try {
                            Log.d("Login User RES :: ", response.toString());
                            if (response.getBoolean("success")) {
                                String user = response.getString("username");
                                AppPreferences.setUsername(LoginActivity.this.getApplicationContext(), user);
                                Toasty.success(LoginActivity.this.getApplicationContext(), "Login Success", 0).show();
                                AppPreferences.setIsLoggedIn(LoginActivity.this.getApplicationContext(), true);
                                LoginActivity.this.startActivity(new Intent(LoginActivity.this, (Class<?>) MainActivity.class));
                                LoginActivity.this.finish();
                            } else {
                                Toasty.error(LoginActivity.this.getApplicationContext(), "Error", 0).show();
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        LoginActivity.this.progressBar.setVisibility(4);
                    }
                }, new Response.ErrorListener() { // from class: com.ctzlab.commentapp.LoginActivity.1.2
                    @Override // com.android.volley.Response.ErrorListener
                    public void onErrorResponse(VolleyError error) {
                        Log.d("Error.Response", String.valueOf(error));
                        LoginActivity.this.progressBar.setVisibility(8);
                        Toasty.error(LoginActivity.this.getApplicationContext(), (CharSequence) "Something went wrong, please try again!", 0, false).show();
                    }
                });
                postRequest.setRetryPolicy(new DefaultRetryPolicy(10000, 0, 1.0f));
                queue.add(postRequest);
            }
        });
        this.createAccount.setOnClickListener(new View.OnClickListener() { // from class: com.ctzlab.commentapp.LoginActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                LoginActivity.this.startActivity(new Intent(LoginActivity.this, (Class<?>) CreateUserActivity.class));
            }
        });
    }

    private void initViews() {
        this.userName = (TextInputEditText) findViewById(R.id.userName);
        this.password = (TextInputEditText) findViewById(R.id.password);
        this.createAccount = (TextView) findViewById(R.id.createAccount);
        this.loginBtn = (Button) findViewById(R.id.loginButton);
        this.progressBar = (SmoothProgressBar) findViewById(R.id.progress_horizontal);
    }
}
