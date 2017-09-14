package cn.org.eshow.model;

import cn.org.eshow.common.CommonVar;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

/**
 * 用户表
 *
 * @author leida
 */
@Entity
@Table(name = "user", uniqueConstraints = {@UniqueConstraint(columnNames = "username")})
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class User extends BaseObject implements Serializable, UserDetails {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;// 用户ID

    @Version
    private Integer version;// 版本号

    @Column(name = "add_time", length = 0)
    private Date addTime = new Date();// 添加时间

    @Column(name = "update_time", length = 0)
    private Date updateTime = new Date();// 更新时间

    @Column
    private String username;// 用户名

    @Column
    private String nickname;// 昵称

    @Column
    private String password;// 密码

    @Transient
    private String confirmPassword;

    @Column
    private Integer age;// 年龄

    @Column
    private String photo = CommonVar.USER_DEFAULT_PHOTO;// 头像

    @Column
    private String realname;// 真实姓名

    @Column
    private String email;//电子邮箱

    @Column
    private Boolean male;// 性别

    @Temporal(TemporalType.DATE)
    @Column
    private Date birthday;// 生日

    @Column
    private Short constellation;// 星座

    @Column(name = "birth_attrib")
    private Short birthAttrib;//

    @Column(name = "blood_type")
    private Short bloodType;// 血型

    @Column
    private String hobby;// 爱好

    @Column
    private Short marital;// 婚姻状况

    @Column
    private String intro;// 自我介绍

    @Column
    private String website;// 网站

    @Column(name = "client_id")
    private String clientId;//个推ClientId

    @Column(name = "device_token")
    private String deviceToken;//设备推送Token

    @JsonIgnore
    @Column(name = "account_expired")
    private boolean accountExpired = Boolean.FALSE;// 帐号是否过期

    @JsonIgnore
    @Column(name = "account_locked")
    private boolean accountLocked = Boolean.FALSE;// 帐号是否锁住

    @JsonIgnore
    @Column(name = "credentials_expired")
    private boolean credentialsExpired = Boolean.FALSE;// 凭证是否过期

    @JsonIgnore
    @Column(name = "account_enabled")
    private boolean enabled = Boolean.TRUE;// 是否可用

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "user_role", joinColumns = {@JoinColumn(name = "user_id")}, inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles = new HashSet<Role>(0);// 角色列表

    /**
     * Default constructor - creates a new instance with no values set.
     */
    public User() {
    }

    /**
     * Create a new instance and set the username.
     *
     * @param username login name for user.
     */
    public User(final String username) {
        this.username = username;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getVersion() {
        return this.version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public Date getAddTime() {
        return this.addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Date getUpdateTime() {
        return this.updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNickname() {
        return this.nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public Integer getAge() {
        return this.age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhoto() {
        return this.photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getRealname() {
        return this.realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getMale() {
        return this.male;
    }

    public void setMale(Boolean male) {
        this.male = male;
    }

    public Date getBirthday() {
        return this.birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Short getConstellation() {
        return this.constellation;
    }

    public void setConstellation(Short constellation) {
        this.constellation = constellation;
    }

    public Short getBirthAttrib() {
        return this.birthAttrib;
    }

    public void setBirthAttrib(Short birthAttrib) {
        this.birthAttrib = birthAttrib;
    }

    public Short getMarital() {
        return this.marital;
    }

    public void setMarital(Short marital) {
        this.marital = marital;
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

    public String getIntro() {
        return this.intro;
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

    public boolean isAccountExpired() {
        return this.accountExpired;
    }

    public void setAccountExpired(boolean accountExpired) {
        this.accountExpired = accountExpired;
    }

    /**
     * @see org.springframework.security.core.userdetails.UserDetails#isAccountNonExpired()
     */
    @Transient
    public boolean isAccountNonExpired() {
        return !isAccountExpired();
    }

    public boolean isAccountLocked() {
        return this.accountLocked;
    }

    public void setAccountLocked(boolean accountLocked) {
        this.accountLocked = accountLocked;
    }

    /**
     * @see org.springframework.security.core.userdetails.UserDetails#isAccountNonLocked()
     */
    @Transient
    public boolean isAccountNonLocked() {
        return !isAccountLocked();
    }

    public boolean isCredentialsExpired() {
        return this.credentialsExpired;
    }

    public void setCredentialsExpired(boolean credentialsExpired) {
        this.credentialsExpired = credentialsExpired;
    }

    /**
     * @see org.springframework.security.core.userdetails.UserDetails#isCredentialsNonExpired()
     */
    @Transient
    public boolean isCredentialsNonExpired() {
        return !credentialsExpired;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    /**
     * Convert user roles to LabelValue objects for convenience.
     *
     * @return a list of LabelValue objects with role information
     */
    @Transient
    public List<LabelValue> getRoleList() {
        List<LabelValue> userRoles = new ArrayList<LabelValue>();

        if (this.roles != null) {
            for (Role role : roles) {
                // convert the user's roles to LabelValue Objects
                userRoles.add(new LabelValue(role.getName(), role.getName()));
            }
        }

        return userRoles;
    }

    /**
     * Adds a role for the user
     *
     * @param role the fully instantiated role
     */
    public void addRole(Role role) {
        getRoles().add(role);
    }

    /**
     * @return GrantedAuthority[] an array of roles.
     * @see org.springframework.security.core.userdetails.UserDetails#getAuthorities()
     */
    @Transient
    public Set<GrantedAuthority> getAuthorities() {
        Set<GrantedAuthority> authorities = new LinkedHashSet<GrantedAuthority>();
        authorities.addAll(roles);
        return authorities;
    }

    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;

        User pojo = (User) o;

        if (version != null ? !version.equals(pojo.version) : pojo.version != null)
            return false;
        if (addTime != null ? !addTime.equals(pojo.addTime) : pojo.addTime != null)
            return false;
        if (updateTime != null ? !updateTime.equals(pojo.updateTime) : pojo.updateTime != null)
            return false;
        if (username != null ? !username.equals(pojo.username) : pojo.username != null)
            return false;
        if (nickname != null ? !nickname.equals(pojo.nickname) : pojo.nickname != null)
            return false;
        if (password != null ? !password.equals(pojo.password) : pojo.password != null)
            return false;
        if (photo != null ? !photo.equals(pojo.photo) : pojo.photo != null)
            return false;
        if (realname != null ? !realname.equals(pojo.realname) : pojo.realname != null)
            return false;
        if (birthday != null ? !birthday.equals(pojo.birthday) : pojo.birthday != null)
            return false;
        if (constellation != null ? !constellation.equals(pojo.constellation)
                : pojo.constellation != null)
            return false;
        if (birthAttrib != null ? !birthAttrib.equals(pojo.birthAttrib) : pojo.birthAttrib != null)
            return false;
        if (marital != null ? !marital.equals(pojo.marital) : pojo.marital != null)
            return false;
        if (email != null ? !email.equals(pojo.email) : pojo.email != null)
            return false;
        if (intro != null ? !intro.equals(pojo.intro) : pojo.intro != null)
            return false;
        if (website != null ? !website.equals(pojo.website) : pojo.website != null)
            return false;

        return true;
    }

    public int hashCode() {
        int result = 0;
        result = (version != null ? version.hashCode() : 0);
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (nickname != null ? nickname.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (photo != null ? photo.hashCode() : 0);
        result = 31 * result + (realname != null ? realname.hashCode() : 0);
        result = 31 * result + (birthday != null ? birthday.hashCode() : 0);
        result = 31 * result + (constellation != null ? constellation.hashCode() : 0);
        result = 31 * result + (birthAttrib != null ? birthAttrib.hashCode() : 0);
        result = 31 * result + (marital != null ? marital.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (intro != null ? intro.hashCode() : 0);
        result = 31 * result + (website != null ? website.hashCode() : 0);
        return result;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer(getClass().getSimpleName());

        sb.append(" [");
        sb.append("id").append("='").append(getId()).append("', ");
        sb.append("version").append("='").append(getVersion()).append("', ");
        sb.append("addTime").append("='").append(getAddTime()).append("', ");
        sb.append("updateTime").append("='").append(getUpdateTime()).append("', ");
        sb.append("username").append("='").append(getUsername()).append("', ");
        sb.append("nickname").append("='").append(getNickname()).append("', ");
        sb.append("password").append("='").append(getPassword()).append("', ");
        sb.append("photo").append("='").append(getPhoto()).append("', ");
        sb.append("realname").append("='").append(getRealname()).append("', ");
        sb.append("male").append("='").append(getMale()).append("', ");
        sb.append("birthday").append("='").append(getBirthday()).append("', ");
        sb.append("constellation").append("='").append(getConstellation()).append("', ");
        sb.append("birthAttrib").append("='").append(getBirthAttrib()).append("', ");
        sb.append("marital").append("='").append(getMarital()).append("', ");
        sb.append("email").append("='").append(getEmail()).append("', ");
        sb.append("intro").append("='").append(getIntro()).append("', ");
        sb.append("website").append("='").append(getWebsite()).append("', ");
        sb.append("]");

        if (roles != null) {
            sb.append("Granted Authorities: ");

            int i = 0;
            for (Role role : roles) {
                if (i > 0) {
                    sb.append(", ");
                }
                sb.append(role.toString());
                i++;
            }
        } else {
            sb.append("No Granted Authorities");
        }
        return sb.toString();
    }

}
