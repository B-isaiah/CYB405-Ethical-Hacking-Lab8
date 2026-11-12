package com.ctzlab.commentapp.ui;

import android.app.Activity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.ctzlab.commentapp.R;
import com.ctzlab.commentapp.modal.Comment;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class CardAdapter extends RecyclerView.Adapter<CartViewHolder> {
    private List<Comment> cartItems;
    private Activity context;

    static class CartViewHolder extends RecyclerView.ViewHolder {
        TextView commentBy;
        TextView commentMessage;

        CartViewHolder(View view) {
            super(view);
            this.commentMessage = (TextView) view.findViewById(R.id.commentMessage);
            this.commentBy = (TextView) view.findViewById(R.id.commentBy);
        }
    }

    public CardAdapter(List<Comment> moviesList, Activity context) {
        this.cartItems = moviesList;
        this.context = context;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public CartViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.comment_card, parent, false);
        return new CartViewHolder(itemView);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(CartViewHolder holder, int position) {
        Comment item = this.cartItems.get(position);
        holder.commentMessage.setText(item.getCommentText());
        holder.commentBy.setText(String.format("@%s", item.getUsername()));
    }

    public List<Comment> getAdapterData() {
        return this.cartItems;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.cartItems.size();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemViewType(int position) {
        return super.getItemViewType(position);
    }
}
