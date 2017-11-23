package com.example.sreekanthkasani.connectapp.utils;

import android.content.Context;
import android.util.Log;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static android.icu.lang.UCharacter.GraphemeClusterBreak.L;

/**
 * Created by sreekanth kasani  ') on 11/22/2017.
 */

public class fetchNewsApi {

    private final ArrayList<newsDataStore> dataStoreHolder = new ArrayList<newsDataStore>();
    private String News_source = "https://newsapi.org/v2/everything?q=diet&sortBy=publishedAt&apiKey=da4a0fddc12e4e56ab2c4cb5a5dca470";
    private Context mcontext;
    private String TAG = "hello";

    public fetchNewsApi(Context mcontext) {
        Log.d(TAG,"news api has been called");
        this.mcontext = mcontext;
    }

    public ArrayList<newsDataStore> fetchNews(){
        //Toast.makeText(mcontext,"on the way to fetch news",Toast.LENGTH_SHORT).show();
         JsonObjectRequest fetchNewsRequest = new JsonObjectRequest(Request.Method.GET, News_source,
           new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                try {
                    StringBuilder data = new StringBuilder();
                    final String KEY_ARTICLES = "articles";
                    Toast.makeText(mcontext,"response successfull",Toast.LENGTH_SHORT).show();
                    JSONArray newsWrapper = response.getJSONArray("articles");
                    int count=0;
                    while (count< newsWrapper.length()){
                        JSONObject articles = newsWrapper.getJSONObject(count);
                        JSONObject source = articles.getJSONObject("source");

                        newsDataStore  dataStore = new newsDataStore();
                        dataStore.setName(source.getString("name"));
                        dataStore.setTitle(articles.getString("title"));
                        dataStore.setUrl(articles.getString("url"));
                        dataStore.setUrlToImage(articles.getString("urlToImage"));

                        dataStoreHolder.add(dataStore);

                        Toast.makeText(mcontext,"newsWrapper"+newsWrapper.length()+"count"+count,Toast.LENGTH_SHORT).show();
                        //Toast.makeText(mcontext,nsource+"\n"+title+"\n"+url+"\n"+image,Toast.LENGTH_SHORT).show();
                        count++;
                    }

                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                error.printStackTrace();
                Toast.makeText(mcontext,"somethig went wrong",Toast.LENGTH_SHORT).show();
            }
        });

        SingletonReq.singletonInstance(mcontext).addRequestQueue(fetchNewsRequest);
        Toast.makeText(mcontext,"return dataStore Holder"+dataStoreHolder.size(),Toast.LENGTH_SHORT).show();
        return  dataStoreHolder;
    }

    //public ArrayList<newsDataStore> parseJsonObject(JSONObject response){

      //  return  dataStoreHolder;
    //}
}
