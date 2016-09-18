package cn.org.eshow.webapp.action.response;


import cn.org.eshow.model.UserGroup;

import java.util.Date;

/**
 * 群组返回对象
 */
public class UserGroupResponse {

    public Integer id = 0;//
    public Date addTime;//
    public Integer type;//
    public Boolean top;//
    public Boolean disturb;//
    public String nickname;//
    public GroupResponse group;//
    public UserSimpleResponse user;// 用户返回对象

    public UserGroupResponse() {
    }

    public UserGroupResponse(UserGroup userGroup) {
        this.id = userGroup.getId();
        this.addTime = userGroup.getAddTime() == null ? new Date() : userGroup.getAddTime();
        this.type = userGroup.getType() == null ? 2 : userGroup.getType();
        this.top = userGroup.getTop() == null ? Boolean.FALSE : userGroup.getTop();
        this.disturb = userGroup.getDisturb() == null ? Boolean.FALSE : userGroup.getDisturb();
        this.nickname = userGroup.getNickName() == null ? "" : userGroup.getNickName();
        if (userGroup.getGroup() != null) {
            this.group = new GroupResponse(userGroup.getGroup());
        }
        if (userGroup.getUser() != null) {
            this.user = new UserSimpleResponse(userGroup.getUser());
        }
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
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

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public GroupResponse getGroup() {
        return group;
    }

    public void setGroup(GroupResponse group) {
        this.group = group;
    }

    public UserSimpleResponse getUser() {
        return user;
    }

    public void setUser(UserSimpleResponse user) {
        this.user = user;
    }
}
