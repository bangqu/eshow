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
 * 群组用户表
 */
@Entity
@Table(name = "user_group")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class UserGroup extends BaseObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;//群组用户表ID

    @Column(name = "add_time")
    private Date addTime = new Date();// 添加时间

    @Column(name = "type")
    private Integer type;// 类型（1管理员，2成员）

    @Column(name = "top")
    private Boolean top;// 是否置顶

    @Column(name = "disturb")
    private Boolean disturb;// 是否可打扰

    @Column(name = "nickname")
    private String nickName;// 本群的昵称

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "group_id")
    private Group group;// 群组ID

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;// 用户ID

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

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
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

        UserGroup pojo = (UserGroup) o;
        if (id != null ? !id.equals(pojo.id) : pojo.id != null)
            return false;
        if (addTime != null ? !addTime.equals(pojo.addTime) : pojo.addTime != null)
            return false;
        if (type != null ? !type.equals(pojo.type) : pojo.type != null)
            return false;
        if (nickName != null ? !nickName.equals(pojo.nickName) : pojo.nickName != null)
            return false;
        return true;
    }

    public int hashCode() {
        int result = 0;
        result = result + (id != null ? id.hashCode() : 0);
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (nickName != null ? nickName.hashCode() : 0);
        result = 31 * result + (group != null ? group.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        return result;
    }

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", this.id)
                .append("addTime", this.addTime)
                .append("type", this.type)
                .append("top", this.top)
                .append("disturb", this.disturb)
                .append("nickName", this.nickName)
                .append("group", this.group)
                .append("user", this.user)
                .toString();
    }
}
