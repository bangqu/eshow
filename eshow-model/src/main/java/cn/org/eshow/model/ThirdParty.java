package cn.org.eshow.model;


import com.fasterxml.jackson.annotation.JsonIgnore;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 第三方账号表
 */
@Entity
@Table(name = "third_party")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class ThirdParty extends BaseObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;//第三方账号ID

    @Column(name = "add_time")
    private Date addTime = new Date();// 绑定时间

    @Column(name = "update_time")
    private Date updateTime = new Date();// 更新时间

    @Column
    private String url;// 网站用户URL

    @Column
    private String username;// 用户名（openID）

    @Column
    private String password;// 密码

    @Column
    private String nickname;// 网站昵称

    @Column
    private String photo;//头像

    @Column
    private Boolean male;//性别（是否男性）

    @Column
    private String platform;//平台（qq，weixin）

    @Column
    private Boolean enabled = Boolean.TRUE;//是否可用

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;// 用户

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

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        final ThirdParty pojo = (ThirdParty) o;
        if (addTime != null ? !addTime.equals(pojo.addTime) : pojo.addTime != null)
            return false;
        if (updateTime != null ? !updateTime.equals(pojo.updateTime) : pojo.updateTime != null)
            return false;
        if (url != null ? !url.equals(pojo.url) : pojo.url != null)
            return false;
        if (username != null ? !username.equals(pojo.username) : pojo.username != null)
            return false;
        if (password != null ? !password.equals(pojo.password) : pojo.password != null)
            return false;
        if (nickname != null ? !nickname.equals(pojo.nickname) : pojo.nickname != null)
            return false;
        if (platform != null ? !platform.equals(pojo.platform) : pojo.platform != null)
            return false;
        if (user != null ? !user.equals(pojo.user) : pojo.user != null)
            return false;
        return true;
    }

    public int hashCode() {
        int result = 0;
        result = 31 * result + (id != null ? id.hashCode() : 0);
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (url != null ? url.hashCode() : 0);
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (nickname != null ? nickname.hashCode() : 0);
        result = 31 * result + (platform != null ? platform.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);

        return result;
    }

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", this.id)
                .append("add_time", this.addTime)
                .append("update_time", this.updateTime)
                .append("url", this.url)
                .append("username", this.username)
                .append("password", this.password)
                .append("nickname", this.nickname)
                .append("platform", this.platform)
                .append("user", this.user)
                .toString();
    }

}
