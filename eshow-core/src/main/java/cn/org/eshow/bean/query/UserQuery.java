package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * User 查询Bean
 *
 * @author leida
 */
public class UserQuery extends BaseQuery {

    public Date startAddTime;
    public Date endAddTime;
    public Date startUpdateTime;
    public Date endUpdateTime;
    public Date addTime;//
    public Date updateTime;//
    public String username;
    public String email;//
    public String nickname;//
    public String website;//
    public String realname;//
    public Integer age;//
    public Boolean photo;//
    public String easemobId;

    public UserQuery() {
    }

    public UserQuery(String username) {
        this.username = username;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Boolean getPhoto() {
        return photo;
    }

    public void setPhoto(Boolean photo) {
        this.photo = photo;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getEasemobId() {
        return easemobId;
    }

    public void setEasemobId(String easemobId) {
        this.easemobId = easemobId;
    }
}