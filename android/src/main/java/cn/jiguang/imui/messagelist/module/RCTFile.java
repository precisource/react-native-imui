package cn.jiguang.imui.messagelist.module;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.WritableMap;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import cn.jiguang.imui.commons.models.IFile;
import cn.jiguang.imui.messagelist.MessageConstant;

/**
 * Created by dowin on 2017/10/23.
 */

public class RCTFile extends RCTExtend implements IFile {

    private String path;
    private long size;
    ;
    private String md5;
    private String url;
    private String displayName;
    private String extension;
    private boolean forceUpload;

    public RCTFile(String path, long size, String md5, String url, String displayName, String extension, boolean forceUpload) {
        this.path = path;
        this.size = size;
        this.md5 = md5;
        this.url = url;
        this.displayName = displayName;
        this.extension = extension;
        this.forceUpload = forceUpload;
    }


    @Override
    JsonElement toJSON() {
        JsonObject json = new JsonObject();
        json.addProperty(MessageConstant.File.PATH, path);
        json.addProperty(MessageConstant.File.SIZE, size);
        json.addProperty(MessageConstant.File.MD5, md5);
        json.addProperty(MessageConstant.File.URL, url);
        json.addProperty(MessageConstant.File.DISPLAY_NAME, displayName);
        json.addProperty(MessageConstant.File.EXTENSION, extension);
        json.addProperty(MessageConstant.File.FORCE_UPLOAD, forceUpload);
        return json;
    }

    @Override
    WritableMap toWritableMap() {
        WritableMap fileObj = Arguments.createMap();
        fileObj.putString(MessageConstant.File.PATH, path);
        fileObj.putDouble(MessageConstant.File.SIZE, size);
        fileObj.putString(MessageConstant.File.MD5, md5);
        fileObj.putString(MessageConstant.File.URL, url);
        fileObj.putString(MessageConstant.File.DISPLAY_NAME, displayName);
        fileObj.putString(MessageConstant.File.EXTENSION, extension);
        fileObj.putBoolean(MessageConstant.File.FORCE_UPLOAD, forceUpload);
        return fileObj;
    }

    @Override
    public String getPath() {
        return this.path;
    }

    @Override
    public long getSize() {
        return this.size;
    }

    @Override
    public String getMd5() {
        return this.md5;
    }

    @Override
    public String getUrl() {
        return this.url;
    }

    @Override
    public String getDisplayName() {
        return this.displayName;
    }

    @Override
    public String getExtension() {
        return this.extension;
    }

    @Override
    public boolean isForceUpload() {
        return this.forceUpload;
    }
}
