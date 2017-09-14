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
 * 相册表
 *
 * @author leida
 */
@Entity
@Table(name = "album")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Album extends BaseObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;// 相册ID

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;// 用户

    @Column(name = "add_time", length = 0)
    private Date addTime = new Date();//添加时间

    @Column(name = "update_time", length = 0)
    private Date updateTime = new Date();// 更新时间

    @Column(length = 30)
    private String name;// 相册名称

    @Column(length = 400)
    private String description;// 相册描述

    @Column(length = 100)
    private String img;// 图片地址

    @Column(name = "photo_size")
    private Integer photoSize = 0;// 照片的总数

    @Column
    private Integer count = 0;// 访问次数

    @Column(length = 20)
    private String website;// 网站

    @Column
    private Boolean enabled = Boolean.TRUE;//是否可用

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getAddTime() {
        return this.addTime;
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

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getPhotoSize() {
        return photoSize;
    }

    public void setPhotoSize(Integer photoSize) {
        this.photoSize = photoSize;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;

        Album pojo = (Album) o;

        if (user != null ? !user.equals(pojo.user) : pojo.user != null)
            return false;
        if (addTime != null ? !addTime.equals(pojo.addTime) : pojo.addTime != null)
            return false;
        if (updateTime != null ? !updateTime.equals(pojo.updateTime) : pojo.updateTime != null)
            return false;
        if (name != null ? !name.equals(pojo.name) : pojo.name != null)
            return false;
        if (website != null ? !website.equals(pojo.website) : pojo.website != null)
            return false;
        if (img != null ? !img.equals(pojo.img) : pojo.img != null)
            return false;
        if (description != null ? !description.equals(pojo.description) : pojo.description != null)
            return false;

        return true;
    }

    public int hashCode() {
        int result = 0;
        result = result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (website != null ? website.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (img != null ? img.hashCode() : 0);

        return result;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", this.id)
                .append("user", this.addTime)
                .append("addTime", this.updateTime)
                .append("updateTime", this.updateTime)
                .append("website", this.website)
                .append("name", this.name)
                .append("user", this.user.toString())
                .toString();
    }

}
