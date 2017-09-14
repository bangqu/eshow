package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * 第三方账号查询对象
 */
public class ThirdPartyQuery extends BaseQuery {

    public Date startAddTime;//开始添加时间
    public Date endAddTime;//结束添加时间
    public String url;//网站用户URL
    public String username;//用户名（openID）
    public String password;//密码
    public String nickname;//网站昵称
    public String platform;//平台（qq，weixin）
    public String photo;//头像
    public Boolean male;//性别（是否男性）
    public Boolean enabled;//是否可用
    public Integer userId;//用户ID

    public ThirdPartyQuery() {
    }

    public ThirdPartyQuery(Boolean enabled) {
        this.enabled = enabled;
    }

    public ThirdPartyQuery(String platform, Integer userId) {
        this.platform = platform;
        this.userId = userId;
    }

    public ThirdPartyQuery(String username, String platform) {
        this.username = username;
        this.platform = platform;
    }

    public ThirdPartyQuery(String username, String platform, Boolean enabled) {
        this.username = username;
        this.platform = platform;
        this.enabled = enabled;
    }

    public ThirdPartyQuery(Integer userId, String platform, Boolean enabled) {
        this.userId = userId;
        this.platform = platform;
        this.enabled = enabled;
    }

    public ThirdPartyQuery(Integer userId, String username, String platform, Boolean enabled) {
        this.userId = userId;
        this.username = username;
        this.platform = platform;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Boolean getMale() {
        return male;
    }

    public void setMale(Boolean male) {
        this.male = male;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
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
}
