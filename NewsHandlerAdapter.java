package com.example.sreekanthkasani.connectapp.News;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.VolleyError;
import com.android.volley.toolbox.ImageLoader;
import com.bumptech.glide.Glide;
import com.example.sreekanthkasani.connectapp.R;
import com.example.sreekanthkasani.connectapp.utils.SingletonReq;
import com.example.sreekanthkasani.connectapp.utils.newsDataStore;

import java.util.ArrayList;
import java.util.zip.Inflater;

/**
 * Created by sreekanth kasani  ') on 11/21/2017.
 */

public class NewsHandlerAdapter extends RecyclerView.Adapter<NewsHandlerAdapter.newsViewHolder>{

    private ArrayList<newsDataStore> newsHolder = new ArrayList<newsDataStore>();
    private ImageLoader imageLoader;
    private SingletonReq singletonReqNew;
    private Context mcontext;

    public NewsHandlerAdapter(ArrayList newsHolder,Context mcontext){
        Toast.makeText(mcontext,"NewsHandlerAdapter in Action",Toast.LENGTH_SHORT).show();
        this.newsHolder = newsHolder;
          this.mcontext = mcontext;
    }

    @Override
    public newsViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        Toast.makeText(mcontext,"view holder created",Toast.LENGTH_SHORT).show();
        View  card = LayoutInflater.from(parent.getContext()).inflate(R.layout.news_holder,parent,false);
        newsViewHolder nvh = new newsViewHolder(card);
        return nvh;
    }

    @Override
    public void onBindViewHolder(final newsViewHolder holder, int position) {
        //Glide.with(mcontext).load(newsHolder.get(position).getUrlToImage()).into(holder.imageView);
        holder.imageView.setImageResource(R.drawable.news);
        holder.title.setText(newsHolder.get(position).getTitle());
        holder.source.setText(newsHolder.get(position).getName());
        Toast.makeText(mcontext,"components binded successfuly",Toast.LENGTH_SHORT).show();
    }

    @Override
    public int getItemCount()
    {
        return newsHolder.size();
    }

    public class newsViewHolder extends RecyclerView.ViewHolder {

        ImageView imageView;
        TextView title,source;

        public newsViewHolder(View itemView) {
            super(itemView);
            imageView = (ImageView) itemView.findViewById(R.id.imgHolder);
            title = (TextView) itemView.findViewById(R.id.newsDesc);
            source = (TextView) itemView.findViewById(R.id.newsSrc);
            Toast.makeText(mcontext,"info regarding components passed successfully",Toast.LENGTH_SHORT).show();
        }
    }
}
