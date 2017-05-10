package com.example.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "app")
public class App implements Serializable {


    @Id
    @GeneratedValue()
    private Long id;// ID
    @Column()
    private String appName;            // 应用名字
    @Column()
    private String createTime;         // 创建时间
    @Column()
    private String appType;            // 应用版本
    @Column()
    private String type;               //标签
    @Column()
    private String appId;
    @Column()
    private String appKey;
    @Column()
    private String masterSecret;

    public App() {
    }

    public App(String appName, String createTime, String appType, String type, String appId, String appKey, String masterSecret) {
        this.appName = appName;
        this.createTime = createTime;
        this.appType = appType;
        this.type = type;
        this.appId = appId;
        this.appKey = appKey;
        this.masterSecret = masterSecret;
    }

    @Override
    public String toString() {
        return "App{" +
                "id=" + id +
                ", appName='" + appName + '\'' +
                ", createTime='" + createTime + '\'' +
                ", appType='" + appType + '\'' +
                ", type='" + type + '\'' +
                ", appId='" + appId + '\'' +
                ", appKey='" + appKey + '\'' +
                ", masterSecret='" + masterSecret + '\'' +
                '}';
    }


    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }


    public String getAppType() {
        return appType;
    }

    public void setAppType(String appType) {
        this.appType = appType;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getAppKey() {
        return appKey;
    }

    public void setAppKey(String appKey) {
        this.appKey = appKey;
    }

    public String getMasterSecret() {
        return masterSecret;
    }

    public void setMasterSecret(String masterSecret) {
        this.masterSecret = masterSecret;
    }
}
