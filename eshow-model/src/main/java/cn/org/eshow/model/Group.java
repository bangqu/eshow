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
 * 群组表
 */
@Entity
@Table(name = "group", catalog = "eshow")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Group extends BaseObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;//群组ID

    @Column(name = "add_time")
    private Date addTime = new Date();// 添加时间

    @Column(name = "update_time")
    private Date updateTime = new Date();// 更新时间

    @Column(name = "type")
    private String type;// 群组类型（company物业公司）

    @Column
    private String name;// 群组名称

    @Column
    private String description;// 群组描述

    @Column
    private String img;// 图片

    @Column
    private Integer number = 0;// 成员数

    @Column(name = "max_number")
    private Integer maxNumber = 100;// 成员上限

    @Column(name = "easemob_group_id")
    private String easemobGroupId;// 环信群组ID

    @Column
    private Boolean open = Boolean.TRUE;// 是否公开群

    @Column
    private Boolean enabled = Boolean.TRUE;// 是否可用

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

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getMaxNumber() {
        return maxNumber;
    }

    public void setMaxNumber(Integer maxNumber) {
        this.maxNumber = maxNumber;
    }

    public String getEasemobGroupId() {
        return easemobGroupId;
    }

    public void setEasemobGroupId(String easemobGroupId) {
        this.easemobGroupId = easemobGroupId;
    }

    public Boolean getOpen() {
        return open;
    }

    public void setOpen(Boolean open) {
        this.open = open;
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

        Group pojo = (Group) o;
        if (id != null ? !id.equals(pojo.id) : pojo.id != null)
            return false;
        if (addTime != null ? !addTime.equals(pojo.addTime) : pojo.addTime != null)
            return false;
        if (number != null ? !number.equals(pojo.number) : pojo.number != null)
            return false;
        if (name != null ? !name.equals(pojo.name) : pojo.name != null)
            return false;

        return true;
    }

    public int hashCode() {
        int result = 0;
        result = result + (id != null ? id.hashCode() : 0);
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (img != null ? img.hashCode() : 0);
        result = 31 * result + (number != null ? number.hashCode() : 0);
        result = 31 * result + (maxNumber != null ? maxNumber.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        return result;
    }

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", this.id)
                .append("addTime", this.addTime)
                .append("updateTime", this.updateTime)
                .append("type", this.type)
                .append("name", this.name)
                .append("img", this.img)
                .append("number", this.number)
                .append("maxNumber", this.maxNumber)
                .append("enabled", this.enabled)
                .append("user", this.user)
                .toString();
    }
}
