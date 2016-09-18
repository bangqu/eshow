package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * 群组查询对象
 */
public class GroupQuery extends BaseQuery {

    public Date startAddTime; // 开始添加时间
    public Date endAddTime; // 结束添加时间
    public Date startUpdateTime;// 开始更新时间
    public Date endUpdateTime; // 结束更新时间
    public String type;// 群组类型
    public String name;// 群组名称模糊查询
    public String fullname;//群组名称
    public Integer number;// 成员数
    public Integer maxNumber;// 成员上限
    public String easemobGroupId;
    public String easemobGroupIds[];
    public Boolean open;
    public Boolean enabled;// 是否可用
    public Integer userId;//用户ID
    public Long version;

    public GroupQuery() {
    }

    public GroupQuery(Boolean enabled) {
        this.enabled = enabled;
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

    public Date getStartUpdateTime() {
        return startUpdateTime;
    }

    public void setStartUpdateTime(Date startUpdateTime) {
        this.startUpdateTime = startUpdateTime;
    }

    public Date getEndUpdateTime() {
        return endUpdateTime;
    }

    public void setEndUpdateTime(Date endUpdateTime) {
        this.endUpdateTime = endUpdateTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getMaxNumber() {
        return maxNumber;
    }

    public void setMaxNumber(Integer maxNumber) {
        this.maxNumber = maxNumber;
    }

    public String getEasemobGroupId() {
        return easemobGroupId;
    }

    public void setEasemobGroupId(String easemobGroupId) {
        this.easemobGroupId = easemobGroupId;
    }

    public String[] getEasemobGroupIds() {
        return easemobGroupIds;
    }

    public void setEasemobGroupIds(String[] easemobGroupIds) {
        this.easemobGroupIds = easemobGroupIds;
    }

    public Boolean getOpen() {
        return open;
    }

    public void setOpen(Boolean open) {
        this.open = open;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }


    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }


    public Long getVersion() {
        return version;
    }

    public void setVersion(Long version) {
        this.version = version;
    }
}
