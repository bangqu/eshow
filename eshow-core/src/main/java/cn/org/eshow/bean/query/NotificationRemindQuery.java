package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * 通知数量查询对象
 */
public class NotificationRemindQuery extends BaseQuery {

    public Date startAddTime;//开始添加时间
    public Date endAddTime;//结束添加时间
    public Integer minFriendCount;//最小新好友请求数量
    public Integer maxFriendCount;//最大新好友请求数量
    public Integer minNotificationCount;//最小新通知数量
    public Integer maxNotificationCount;//最大新通知数量
    public Integer userId;//用户ID
    public String field;//清空字段

    public NotificationRemindQuery() {
    }

    public NotificationRemindQuery(Integer userId) {
        this.userId = userId;
    }

    public Date getEndAddTime() {
        return endAddTime;
    }

    public void setEndAddTime(Date endAddTime) {
        this.endAddTime = endAddTime;
    }

    public Date getStartAddTime() {
        return startAddTime;
    }

    public void setStartAddTime(Date startAddTime) {
        this.startAddTime = startAddTime;
    }

    public Integer getMinFriendCount() {
        return minFriendCount;
    }

    public void setMinFriendCount(Integer minFriendCount) {
        this.minFriendCount = minFriendCount;
    }

    public Integer getMaxFriendCount() {
        return maxFriendCount;
    }

    public void setMaxFriendCount(Integer maxFriendCount) {
        this.maxFriendCount = maxFriendCount;
    }

    public Integer getMinNotificationCount() {
        return minNotificationCount;
    }

    public void setMinNotificationCount(Integer minNotificationCount) {
        this.minNotificationCount = minNotificationCount;
    }

    public Integer getMaxNotificationCount() {
        return maxNotificationCount;
    }

    public void setMaxNotificationCount(Integer maxNotificationCount) {
        this.maxNotificationCount = maxNotificationCount;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }
}
