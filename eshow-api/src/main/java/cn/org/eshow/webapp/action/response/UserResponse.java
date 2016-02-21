package cn.org.eshow.webapp.action.response;

import java.util.*;

/**
 * 用户表
 *
 * @author leida
 */

public class UserResponse {


    private Integer id;// 用户ID
    private Integer version;// 版本号
    private Date addTime;// 添加时间
    private Date updateTime;// 更新时间
    private String username;// 用户名
    private String nickname;// 昵称
    private Integer age;// 年龄
    private String photo;// 头像
    private String realname;// 真实姓名
    private Boolean male;// 性别
    private Date birthday;// 生日
    private Short constellation;// 星座
    private Short birthAttrib;//
    private Short bloodType;// 血型
    private String hobby;// 爱好
    private Short marital;// 婚姻状况
    private String intro;// 自我介绍
    private String website;// 网站
    private boolean accountExpired;// 帐号是否过期
    private boolean accountLocked;// 帐号是否锁住
    private boolean credentialsExpired;// 凭证是否过期


    public UserResponse(User user) {
        this.id = user.getId();
        this.version = user.getVersion();
        this.addTime = user.getAddTime();
        this.updateTime = user.getUpdateTime();
        this.username = user.getUsername();
        this.nickname = user.getNickName() == null ? "" : user.getNickName();
        this.age = user.getAge() == null ? 0 : user.getAge();
        this.photo = user.getPhoto() == null ? "" : user.getPhoto();
        this.realname = user.getRealname() == null ? "" : user.getRealname();
        this.male = user.getMale();
        this.birthday = user.getBirthday();
        this.constellation = user.getConstellation() == null ? 0 : user.getConstellation();
        this.birthAttrib = user.getBirthAttrib() == null ? 0 : getBirthAttrib();
        this.bloodType = user.getBloodType() == null ? 0 : user.getBloodType();
        this.marital = user.getMarital() == null ? 0 : user.getMarital();
        this.intro = user.getIntro();
        this.website = user.getWebsite();
        this.accountExpired = user.getAccountExpired();
        this.accountLocked = user.getAccountLocked();
        this.credentialsExpired = user.getCredentialsExpired();
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

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Short getConstellation() {
        return constellation;
    }

    public void setConstellation(Short constellation) {
        this.constellation = constellation;
    }

    public Short getBirthAttrib() {
        return birthAttrib;
    }

    public void setBirthAttrib(Short birthAttrib) {
        this.birthAttrib = birthAttrib;
    }

    public Short getBloodType() {
        return bloodType;
    }

    public void setBloodType(Short bloodType) {
        this.bloodType = bloodType;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public Short getMarital() {
        return marital;
    }

    public void setMarital(Short marital) {
        this.marital = marital;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public boolean isAccountExpired() {
        return accountExpired;
    }

    public void setAccountExpired(boolean accountExpired) {
        this.accountExpired = accountExpired;
    }

    public boolean isAccountLocked() {
        return accountLocked;
    }

    public void setAccountLocked(boolean accountLocked) {
        this.accountLocked = accountLocked;
    }

    public boolean isCredentialsExpired() {
        return credentialsExpired;
    }

    public void setCredentialsExpired(boolean credentialsExpired) {
        this.credentialsExpired = credentialsExpired;
    }
}
