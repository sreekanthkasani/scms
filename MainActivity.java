package com.example.sreekanthkasani.connectapp.News;

import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.example.sreekanthkasani.connectapp.Dashboard.DashboardActivity;
import com.example.sreekanthkasani.connectapp.Diet.DietActivity;
import com.example.sreekanthkasani.connectapp.R;
import com.example.sreekanthkasani.connectapp.utils.BottomNavigationHelper;
import com.example.sreekanthkasani.connectapp.utils.fetchNewsApi;
import com.example.sreekanthkasani.connectapp.utils.newsDataStore;
import com.ittianyu.bottomnavigationviewex.BottomNavigationViewEx;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;

import okhttp3.OkHttpClient;

public class NewsActivity extends AppCompatActivity {
    private String TAG = "NewsActivity";
    private Context mcontext = NewsActivity.this;
    private int ACTIVITY_NUM = 1;
    private newsDataStore nDataStore;
    private ArrayList<newsDataStore> dataStore = new ArrayList<newsDataStore>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        overridePendingTransition(0,0);
        setContentView(R.layout.activity_news);
        setBottomNavigationView();
        RecyclerView recyclerView = (RecyclerView) findViewById(R.id.newsView);
        RecyclerView.LayoutManager llayoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(llayoutManager);
        recyclerView.setHasFixedSize(true);
        fetchNewsApi api = new fetchNewsApi(mcontext);
        dataStore = api.fetchNews();
        Toast.makeText(mcontext,"i got data... i got data:>"+dataStore.size(),Toast.LENGTH_SHORT).show();
        RecyclerView.Adapter adapter = new NewsHandlerAdapter(dataStore,mcontext);
        recyclerView.setAdapter(adapter);
    }

    private void setBottomNavigationView(){
        BottomNavigationViewEx bottomNavigationViewEx = (BottomNavigationViewEx) findViewById(R.id.Bnavigation);
        BottomNavigationHelper.refineBottomNavigationView(bottomNavigationViewEx);
        BottomNavigationHelper.enableNavigation(mcontext,bottomNavigationViewEx);
        Menu menu = bottomNavigationViewEx.getMenu();
        MenuItem menuItem = menu.getItem(ACTIVITY_NUM);
        menuItem.setChecked(true);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        this.finish();
    }

}
