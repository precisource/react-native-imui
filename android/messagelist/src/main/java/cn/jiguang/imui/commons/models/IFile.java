package cn.jiguang.imui.commons.models;

public interface IFile {
    String getPath();
    long getSize();
    String getMd5();
    String getUrl();
    String getDisplayName();
    String getExtension();
    boolean isForceUpload();
}
