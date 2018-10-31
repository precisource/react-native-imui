package cn.jiguang.imui.messages.viewholder;

import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.Locale;

import cn.jiguang.imui.BuildConfig;
import cn.jiguang.imui.R;
import cn.jiguang.imui.commons.models.ICard;
import cn.jiguang.imui.commons.models.IExtend;
import cn.jiguang.imui.commons.models.IFile;
import cn.jiguang.imui.commons.models.IMessage;
import cn.jiguang.imui.messages.MessageListStyle;

/**
 * Created by dowin on 2017/10/23.
 */

public class FileViewHolder<MESSAGE extends IMessage> extends AvatarViewHolder<MESSAGE> {

    private ImageView image;
    private TextView tvName;
    private TextView tvSize;
    private View layoutTop;

    public FileViewHolder(RecyclerView.Adapter adapter, View itemView, boolean isSender) {
        super(adapter, itemView, isSender);

        image = (ImageView) itemView.findViewById(R.id.file_icon);
        tvName = (TextView) itemView.findViewById(R.id.file_name);
        tvSize = (TextView) itemView.findViewById(R.id.file_size);
        layoutTop = itemView.findViewById(R.id.layout_top);
    }

    @Override
    public void onBind(final MESSAGE message) {
        super.onBind(message);
        IExtend extend = getExtend(message);
        if (extend != null && extend instanceof IFile) {
            IFile file = (IFile)extend;
            switch (file.getExtension().toLowerCase()) {
                case "pdf":
                    image.setImageResource(R.drawable.pdf_file);
                    break;
                default:
                    image.setImageResource(R.drawable.unknown_file);
                    break;
            }
            tvName.setText(file.getDisplayName());
            tvSize.setText(String.format(Locale.US, "%.2fMB", ((float) file.getSize()) / 1024 / 1024));
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
