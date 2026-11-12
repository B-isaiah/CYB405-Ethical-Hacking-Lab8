package com.ctzlab.commentapp;

import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.location.Location;
import android.location.LocationManager;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.ctzlab.commentapp.modal.Comment;
import com.ctzlab.commentapp.ui.CardAdapter;
import com.google.android.material.textfield.TextInputEditText;
import es.dmoral.toasty.Toasty;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class MainActivity extends AppCompatActivity {
    TextInputEditText commentMessage;
    RecyclerView listView;
    TextView loader;
    ImageView postComment;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        initViews();
        initActions();
        loadData();
    }

    private void initActions() {
        this.postComment.setOnClickListener(new View.OnClickListener() { // from class: com.ctzlab.commentapp.MainActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (!MainActivity.this.commentMessage.getText().toString().equals("")) {
                    Comment comment = new Comment();
                    String android_id = Settings.Secure.getString(MainActivity.this.getContentResolver(), "android_id");
                    comment.setDeviceId(android_id);
                    LocationManager nManager = (LocationManager) MainActivity.this.getSystemService("location");
                    if (!nManager.isProviderEnabled("gps")) {
                        MainActivity.this.OnGPS();
                        return;
                    }
                    Location locationGPS = MainActivity.this.getLastKnownLocation();
                    if (locationGPS != null) {
                        double lat = locationGPS.getLatitude();
                        double longi = locationGPS.getLongitude();
                        comment.setLatitude(Double.valueOf(lat));
                        comment.setLongitude(Double.valueOf(longi));
                        comment.setCommentText(MainActivity.this.commentMessage.getText().toString());
                        comment.setUsername(AppPreferences.getUsername(MainActivity.this.getApplicationContext()));
                        try {
                            postCommentRequest(comment);
                            return;
                        } catch (JSONException e) {
                            e.printStackTrace();
                            return;
                        }
                    }
                    Toasty.error(MainActivity.this.getApplicationContext(), "Unable to find location.", 0).show();
                    return;
                }
                Toasty.warning(MainActivity.this.getApplicationContext(), "Comment Can Not Be Empty", 0).show();
            }

            private void postCommentRequest(Comment comment) throws JSONException {
                RequestQueue queue = Volley.newRequestQueue(MainActivity.this);
                String url = AppPreferences.getBaseUrl(MainActivity.this.getApplicationContext()) + "/api3/comment";
                JSONObject jsonBody = new JSONObject();
                jsonBody.put("deviceid", comment.getDeviceId());
                jsonBody.put("latitude", comment.getLatitude().toString());
                jsonBody.put("longitude", comment.getLongitude().toString());
                jsonBody.put("commenttext", comment.getCommentText());
                jsonBody.put("username", comment.getUsername());
                jsonBody.put("postid", "1");
                JsonObjectRequest postRequest = new JsonObjectRequest(url, jsonBody, new Response.Listener<JSONObject>() { // from class: com.ctzlab.commentapp.MainActivity.1.1
                    @Override // com.android.volley.Response.Listener
                    public void onResponse(JSONObject response) {
                        MainActivity.this.commentMessage.setText("");
                        Log.i("POST RES:::", response.toString());
                        MainActivity.this.loader.setVisibility(4);
                        MainActivity.this.loadData();
                    }
                }, new Response.ErrorListener() { // from class: com.ctzlab.commentapp.MainActivity.1.2
                    @Override // com.android.volley.Response.ErrorListener
                    public void onErrorResponse(VolleyError error) {
                        Log.d("Error.Response", String.valueOf(error));
                        MainActivity.this.loader.setVisibility(8);
                        Toasty.error(MainActivity.this.getApplicationContext(), (CharSequence) "Something went wrong, please try again!", 0, false).show();
                    }
                });
                postRequest.setRetryPolicy(new DefaultRetryPolicy(10000, 0, 1.0f));
                queue.add(postRequest);
            }
        });
    }

    private void initViews() {
        this.loader = (TextView) findViewById(R.id.loading);
        this.postComment = (ImageView) findViewById(R.id.postComment);
        this.commentMessage = (TextInputEditText) findViewById(R.id.commentMessage);
        this.listView = (RecyclerView) findViewById(R.id.listView);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadData() {
        RequestQueue queue = Volley.newRequestQueue(this);
        String url = AppPreferences.getBaseUrl(getApplicationContext()) + "/api3/comment";
        JsonArrayRequest postRequest = new JsonArrayRequest(url, new Response.Listener<JSONArray>() { // from class: com.ctzlab.commentapp.MainActivity.2
            @Override // com.android.volley.Response.Listener
            public void onResponse(JSONArray response) {
                try {
                    Log.i("COMMENTS:::: ", response.toString());
                    List<Comment> commentList = new ArrayList<>();
                    for (int itr = 0; itr < response.length(); itr++) {
                        JSONObject commentObj = response.getJSONObject(itr);
                        Comment comment = new Comment();
                        comment.setUsername(commentObj.getString("username"));
                        comment.setCommentText(commentObj.getString("commenttext"));
                        commentList.add(comment);
                    }
                    CardAdapter adapter = new CardAdapter(commentList, MainActivity.this);
                    RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(MainActivity.this);
                    MainActivity.this.listView.setLayoutManager(mLayoutManager);
                    MainActivity.this.listView.addItemDecoration(new RecyclerView.ItemDecoration() { // from class: com.ctzlab.commentapp.MainActivity.2.1
                        @Override // androidx.recyclerview.widget.RecyclerView.ItemDecoration
                        public void onDraw(Canvas c, RecyclerView parent, RecyclerView.State state) {
                            super.onDraw(c, parent, state);
                        }

                        @Override // androidx.recyclerview.widget.RecyclerView.ItemDecoration
                        public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
                            super.getItemOffsets(outRect, view, parent, state);
                            outRect.left = 5;
                            outRect.right = 5;
                            outRect.bottom = 40;
                            if (parent.getChildLayoutPosition(view) == 0) {
                                outRect.top = 5;
                            } else {
                                outRect.top = 0;
                            }
                        }
                    });
                    MainActivity.this.listView.setItemAnimator(new DefaultItemAnimator());
                    MainActivity.this.listView.setAdapter(adapter);
                } catch (JSONException e) {
                    e.printStackTrace();
                }
                MainActivity.this.loader.setVisibility(4);
            }
        }, new Response.ErrorListener() { // from class: com.ctzlab.commentapp.MainActivity.3
            @Override // com.android.volley.Response.ErrorListener
            public void onErrorResponse(VolleyError error) {
                Log.d("Error.Response", String.valueOf(error));
                MainActivity.this.loader.setVisibility(8);
                Toasty.error(MainActivity.this.getApplicationContext(), (CharSequence) "Something went wrong, please try again!", 0, false).show();
            }
        });
        postRequest.setRetryPolicy(new DefaultRetryPolicy(10000, 0, 1.0f));
        queue.add(postRequest);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void OnGPS() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setMessage("Enable GPS").setCancelable(false).setPositiveButton("Yes", new DialogInterface.OnClickListener() { // from class: com.ctzlab.commentapp.MainActivity.5
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                MainActivity.this.startActivity(new Intent("android.settings.LOCATION_SOURCE_SETTINGS"));
            }
        }).setNegativeButton("No", new DialogInterface.OnClickListener() { // from class: com.ctzlab.commentapp.MainActivity.4
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                dialog.cancel();
            }
        });
        AlertDialog alertDialog = builder.create();
        alertDialog.show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Location getLastKnownLocation() {
        LocationManager mLocationManager = (LocationManager) getApplicationContext().getSystemService("location");
        List<String> providers = mLocationManager.getProviders(true);
        Location bestLocation = null;
        if (ActivityCompat.checkSelfPermission(this, "android.permission.ACCESS_FINE_LOCATION") != 0 && ActivityCompat.checkSelfPermission(this, "android.permission.ACCESS_COARSE_LOCATION") != 0) {
            ActivityCompat.requestPermissions(this, new String[]{"android.permission.ACCESS_FINE_LOCATION"}, 1);
        } else {
            for (String provider : providers) {
                Location l = mLocationManager.getLastKnownLocation(provider);
                if (l != null && (bestLocation == null || l.getAccuracy() < bestLocation.getAccuracy())) {
                    bestLocation = l;
                }
            }
        }
        return bestLocation;
    }
}
