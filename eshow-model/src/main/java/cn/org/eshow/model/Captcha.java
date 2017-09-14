package cn.org.eshow.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 验证码表
 */
@Entity
@Table(name = "captcha")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Captcha extends BaseObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;//代码ID

    @Column(name = "add_time", nullable = false, length = 0)
    private Date addTime = new Date();// 添加时间

    @Column(length = 20)
    private String type;// 类型(register注册验证，login登录验证,change 变更验证,identity 身份验证）

    @Column(length = 50)
    private String code;// 16位编码

    @Column(length = 50)
    private String email;// 邮箱

    @Column
    private String mobile;// 手机号码

    @Column
    private Integer state = 0;// 状态（0未使用，1已使用）

    @Column
    private Boolean enabled = Boolean.TRUE;// 是否可用

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getAddTime() {
        return this.addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
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
        if (o == null || getClass() != o.getClass())
            return false;

        Captcha code = (Captcha) o;

        if (user != null ? !user.equals(code.user) : code.user != null)
            return false;
        if (addTime != null ? !addTime.equals(code.addTime) : code.addTime != null)
            return false;
        if (type != null ? !type.equals(code.type) : code.type != null)
            return false;
        if (email != null ? !email.equals(code.email) : code.email != null)
            return false;
        if (code != null ? !code.equals(code.code) : code.code != null)
            return false;
        return true;
    }

    public int hashCode() {
        int coded = 0;
        coded = 31 * coded + (user != null ? user.hashCode() : 0);
        coded = 31 * coded + (addTime != null ? addTime.hashCode() : 0);
        coded = 31 * coded + (type != null ? type.hashCode() : 0);
        coded = 31 * coded + (email != null ? email.hashCode() : 0);
        coded = 31 * coded + (code != null ? code.hashCode() : 0);
        coded = 31 * coded + (state != null ? state.hashCode() : 0);
        coded = 31 * coded + (enabled != null ? enabled.hashCode() : 0);
        coded = 31 * coded + (user != null ? user.hashCode() : 0);
        return coded;
    }

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", this.id)
                .append("addTime", this.addTime)
                .append("type", this.type)
                .append("email", this.email)
                .append("code", this.code)
                .append("state", this.state)
                .append("enabled", this.enabled)
                .append("user", this.user).toString();
    }

}
