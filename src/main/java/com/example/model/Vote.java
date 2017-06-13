package com.example.model;


import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "vote")
public class Vote implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 投票活动的唯一标识
	 */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    /**
     * 投票活动属于哪个app
     */
    @Column(name="app_id")
    private String appId;

    /**
     * 投票海报图片路径
     */
    @Column(name="poster_url")
    private String posterUrl;

    /**
     * 单选多选方式
     */
    @Column(name="choice_type")
    private String choiceType;

    /**
     * 活动生成时间
     */
    @Column(name="create_time")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * 活动结束时间
     */
    @Column(name="end_time")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /**
     * 活动说明
     */
    @Column(name="description")
    private String description;

    /**
     * 活动参与次数选择
     */
    @Column(name="several_times")
    private int severalTimes;

    /**
     * 活动开始时间
     */
    @Column(name="start_time")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /**
     * 活动在线状态
     */
    @Column(name="online_status")
    private String onlineStatus;

    /**
     * 审核状态
     */
    @Column(name="status")
    private String status;

    /**
     * 活动标题
     */
    @Column(name="title")
    private String title;

    /**
     * 投票时间间隔
     */
    @Column(name="time_interval")
    private String timeInterval;

    /**
     * 文字选项集合或者图片选项集合
     */
    @Column(name="options")
    private String options;

    /**
     *记录活动更新时间
     */
    @Column(name="update_time")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    /**
     *投票花费,eg：消耗积分
     */
    @Column(name="cost")
    private String cost;

    /**
     *投票形式：文字投票还是图片投票
     */
    @Column(name="type")
    private String type;

    /**
     *投票人身份，eg:会员
     */
    @Column(name="member_level")
    private String memberLevel;

    /**
     *记录创建人
     */
    @Column(name="creator_id")
    private String creatorId;


    public Vote() {
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getPosterUrl() {
        return posterUrl;
    }

    public void setPosterUrl(String posterUrl) {
        this.posterUrl = posterUrl;
    }

    public String getChoiceType() {
        return choiceType;
    }

    public void setChoiceType(String choiceType) {
        this.choiceType = choiceType;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getSeveralTimes() {
        return severalTimes;
    }

    public void setSeveralTimes(int severalTimes) {
        this.severalTimes = severalTimes;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public String getOnlineStatus() {
        return onlineStatus;
    }

    public void setOnlineStatus(String onlineStatus) {
        this.onlineStatus = onlineStatus;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTimeInterval() {
        return timeInterval;
    }

    public void setTimeInterval(String timeInterval) {
        this.timeInterval = timeInterval;
    }

    public String getOptions() {
        return options;
    }

    public void setOptions(String options) {
        this.options = options;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMemberLevel() {
        return memberLevel;
    }

    public void setMemberLevel(String memberLevel) {
        this.memberLevel = memberLevel;
    }

    public String getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(String creatorId) {
        this.creatorId = creatorId;
    }


    @Override
    public String toString() {
        return "Vote{" +
            "id=" + id +
            ", appId='" + appId + '\'' +
            ", posterUrl='" + posterUrl + '\'' +
            ", choiceType='" + choiceType + '\'' +
            ", createTime=" + createTime +
            ", endTime=" + endTime +
            ", description='" + description + '\'' +
            ", severalTimes=" + severalTimes +
            ", startTime=" + startTime +
            ", onlineStatus='" + onlineStatus + '\'' +
            ", status='" + status + '\'' +
            ", title='" + title + '\'' +
            ", timeInterval='" + timeInterval + '\'' +
            ", options='" + options + '\'' +
            ", updateTime=" + updateTime +
            ", cost='" + cost + '\'' +
            ", type='" + type + '\'' +
            ", memberLevel='" + memberLevel + '\'' +
            ", creatorId='" + creatorId + '\'' +
            '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Vote vote = (Vote) o;

        if (severalTimes != vote.severalTimes) return false;
        if (id != null ? !id.equals(vote.id) : vote.id != null) return false;
        if (appId != null ? !appId.equals(vote.appId) : vote.appId != null) return false;
        if (posterUrl != null ? !posterUrl.equals(vote.posterUrl) : vote.posterUrl != null) return false;
        if (choiceType != null ? !choiceType.equals(vote.choiceType) : vote.choiceType != null) return false;
        if (createTime != null ? !createTime.equals(vote.createTime) : vote.createTime != null) return false;
        if (endTime != null ? !endTime.equals(vote.endTime) : vote.endTime != null) return false;
        if (description != null ? !description.equals(vote.description) : vote.description != null) return false;
        if (startTime != null ? !startTime.equals(vote.startTime) : vote.startTime != null) return false;
        if (onlineStatus != null ? !onlineStatus.equals(vote.onlineStatus) : vote.onlineStatus != null) return false;
        if (status != null ? !status.equals(vote.status) : vote.status != null) return false;
        if (title != null ? !title.equals(vote.title) : vote.title != null) return false;
        if (timeInterval != null ? !timeInterval.equals(vote.timeInterval) : vote.timeInterval != null) return false;
        if (options != null ? !options.equals(vote.options) : vote.options != null) return false;
        if (updateTime != null ? !updateTime.equals(vote.updateTime) : vote.updateTime != null) return false;
        if (cost != null ? !cost.equals(vote.cost) : vote.cost != null) return false;
        if (type != null ? !type.equals(vote.type) : vote.type != null) return false;
        if (memberLevel != null ? !memberLevel.equals(vote.memberLevel) : vote.memberLevel != null) return false;
        return creatorId != null ? creatorId.equals(vote.creatorId) : vote.creatorId == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (appId != null ? appId.hashCode() : 0);
        result = 31 * result + (posterUrl != null ? posterUrl.hashCode() : 0);
        result = 31 * result + (choiceType != null ? choiceType.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (endTime != null ? endTime.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + severalTimes;
        result = 31 * result + (startTime != null ? startTime.hashCode() : 0);
        result = 31 * result + (onlineStatus != null ? onlineStatus.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (timeInterval != null ? timeInterval.hashCode() : 0);
        result = 31 * result + (options != null ? options.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (cost != null ? cost.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (memberLevel != null ? memberLevel.hashCode() : 0);
        result = 31 * result + (creatorId != null ? creatorId.hashCode() : 0);
        return result;
    }
}
