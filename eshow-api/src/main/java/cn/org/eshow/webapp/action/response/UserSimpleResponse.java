package cn.org.eshow.webapp.action.response;

import cn.org.eshow.model.User;

import java.util.*;

/**
 * 用户返回对象
 */
public class UserSimpleResponse {

    public Integer id;// 用户ID
    public Integer version;// 版本号
    public Date addTime;// 添加时间
    public Date updateTime;// 更新时间
    public String username;// 用户名
    public String nickname;// 昵称
    public Integer age;// 年龄
    public String photo;// 头像
    public String realname;// 真实姓名
    public Boolean male;// 性别
    public String intro;// 自我介绍
    public String clientId;
    public String deviceToken;//设备推送Token

    public UserSimpleResponse(User user) {
        this.id = user.getId();
        this.version = user.getVersion();
        this.addTime = user.getAddTime();
        this.updateTime = user.getUpdateTime();
        this.username = user.getUsername();
        this.age = user.getAge() == null ? 0 : user.getAge();
        this.photo = user.getPhoto() == null ? "" : user.getPhoto();
        this.realname = user.getRealname() == null ? "" : user.getRealname();
        this.male = user.getMale();
        this.intro = user.getIntro();
        this.clientId = user.getClientId() == null ? "" : user.getClientId();
        this.deviceToken = user.getDeviceToken() == null ? "" : user.getDeviceToken();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public Boolean getMale() {
        return male;
    }

    public void setMale(Boolean male) {
        this.male = male;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getDeviceToken() {
        return deviceToken;
    }

    public void setDeviceToken(String deviceToken) {
        this.deviceToken = deviceToken;
    }

}
