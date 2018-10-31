package cn.jiguang.imui.messages.viewholder;

import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import cn.jiguang.imui.BuildConfig;
import cn.jiguang.imui.R;
import cn.jiguang.imui.commons.models.ICard;
import cn.jiguang.imui.commons.models.IFile;
import cn.jiguang.imui.commons.models.IMessage;
import cn.jiguang.imui.messages.MessageListStyle;

/**
 * Created by dowin on 2017/10/23.
 */

public class FileViewHolder<MESSAGE extends IMessage> extends AvatarViewHolder<MESSAGE> {

    private ImageView image;
    private TextView name;
    private View layoutTop;

    public FileViewHolder(RecyclerView.Adapter adapter, View itemView, boolean isSender) {
        super(adapter, itemView, isSender);

        image = (ImageView) itemView.findViewById(R.id.file_icon);
        name = (TextView) itemView.findViewById(R.id.file_name);
        layoutTop = itemView.findViewById(R.id.layout_top);
    }

    @Override
    public void onBind(final MESSAGE message) {
        super.onBind(message);
        IFile file = getExtend(message);
        if (file != null) {
            name.setText(file.getDisplayName());
        }
        layoutTop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (mMsgClickListener != null) {
                    mMsgClickListener.onMessageClick(message);
                }
            }
        });
        layoutTop.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View v) {
                if (mMsgLongClickListener != null) {
                    mMsgLongClickListener.onMessageLongClick(message);
                } else {
                    if (BuildConfig.DEBUG) {
                        Log.w("MsgListAdapter", "Didn't set long click listener! Drop event.");
                    }
                }
                return true;
            }
        });
    }

    @Override
    public void applyStyle(MessageListStyle style) {
        super.applyStyle(style);
    }
}
