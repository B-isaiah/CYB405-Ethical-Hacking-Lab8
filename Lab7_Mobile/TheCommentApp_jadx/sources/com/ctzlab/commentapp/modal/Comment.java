package com.ctzlab.commentapp.modal;

/* JADX INFO: loaded from: classes2.dex */
public class Comment {
    private String commentText;
    private String deviceId;
    private Integer id;
    private Double latitude;
    private Double longitude;
    private String username;

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeviceId() {
        return this.deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
    }

    public String getCommentText() {
        return this.commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Double getLatitude() {
        return this.latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return this.longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }
}
