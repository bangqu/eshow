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
 * 访问令牌表
 */
@Entity
@Table(name = "access_token")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class AccessToken extends BaseObject implements Serializable {

    private static final long serialVersionUID = 1L;

    public static final Long EXPIRES_IN = 1000 * 3600 * 24 * 30L;// 30天

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;//访问令牌ID

    @Column(name = "add_time", nullable = false, length = 0)
    @Temporal(TemporalType.TIMESTAMP)
    private Date addTime = new Date();// 添加时间

    @Column(name = "update_time", nullable = false, length = 0)
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateTime = new Date();// 修改时间

    @Column(length = 45, name = "access_token")
    private String accessToken;// 访问令牌

    @Column(name = "expires_in")
    private Long expiresIn;// 过期时间（毫秒数）

    @Column(length = 45, name = "refresh_token")
    private String refreshToken;// 刷新令牌

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;// 用户

    public AccessToken() {
    }

    public AccessToken(User user, String accessToken, Long expiresIn, String refreshToken) {
        super();
        this.user = user;
        this.accessToken = accessToken;
        this.expiresIn = expiresIn;
        this.refreshToken = refreshToken;
        this.addTime = new Date();
        this.updateTime = new Date();
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

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public Long getExpiresIn() {
        return expiresIn;
    }

    public void setExpiresIn(Long expiresIn) {
        this.expiresIn = expiresIn;
    }

    public String getRefreshToken() {
        return refreshToken;
    }

    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        AccessToken accessToken = (AccessToken) o;

        if (addTime != null ? !addTime.equals(accessToken.addTime) : accessToken.addTime != null)
            return false;
        if (updateTime != null ? !accessToken.equals(accessToken.updateTime) : accessToken.updateTime != null)
            return false;
        if (accessToken.accessToken != null ? !accessToken.equals(accessToken.accessToken)
                : accessToken.accessToken != null)
            return false;
        if (expiresIn != null ? !expiresIn.equals(accessToken.expiresIn) : accessToken.expiresIn != null)
            return false;
        if (refreshToken != null ? !refreshToken.equals(accessToken.refreshToken) : accessToken.refreshToken != null)
            return false;
        if (user != null ? !user.equals(accessToken.user) : accessToken.user != null)
            return false;
        return true;

    }

    @Override
    public int hashCode() {
        int result = 0;

        result = 31 * result + (id != null ? id.hashCode() : 0);
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (accessToken != null ? accessToken.hashCode() : 0);
        result = 31 * result + (expiresIn != null ? expiresIn.hashCode() : 0);
        result = 31 * result + (refreshToken != null ? refreshToken.hashCode() : 0);
        result = (user != null ? user.hashCode() : 0);
        return result;

    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", this.id)
                .append("addTime", this.addTime)
                .append("updateTime", this.updateTime)
                .append("accessToken", this.accessToken)
                .append("expiresIn", this.expiresIn)
                .append("refreshToken", this.refreshToken)
                .append("user", this.user)
                .toString();
    }

}