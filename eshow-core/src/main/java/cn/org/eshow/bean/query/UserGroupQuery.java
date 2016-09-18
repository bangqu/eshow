package cn.org.eshow.bean.query;


import java.util.Date;

/**
 * 群组用户表
 */
public class UserGroupQuery extends BaseQuery {

    public Date startAddTime; // 开始添加时间
    public Date endAddTime; // 结束添加时间
    public Integer type;// 类型（1管理员，2成员）
    public Boolean top;// 是否置顶
    public Boolean disturb;// 是否可打扰
    public String nickName;// 本群的昵称
    public Integer groupId;// 群组ID
    public Integer userId;//用户ID

    public UserGroupQuery() {

    }

    public Date getStartAddTime() {
        return startAddTime;
    }

    public void setStartAddTime(Date startAddTime) {
        this.startAddTime = startAddTime;
    }

    public Date getEndAddTime() {
        return endAddTime;
    }

    public void setEndAddTime(Date endAddTime) {
        this.endAddTime = endAddTime;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Boolean getTop() {
        return top;
    }

    public void setTop(Boolean top) {
        this.top = top;
    }

    public Boolean getDisturb() {
        return disturb;
    }

    public void setDisturb(Boolean disturb) {
        this.disturb = disturb;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
