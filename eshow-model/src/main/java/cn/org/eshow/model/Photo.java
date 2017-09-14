package cn.org.eshow.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 照片表
 *
 * @author leida
 */
@Entity
@Table(name = "photo")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Photo extends BaseObject implements Serializable {

    private static final long serialVersionUID = 4417313563984109261L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;//照片ID

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;//用户

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
    @JoinColumn(name = "album_id")
    private Album album;//相册

    @Column(name = "add_time", length = 0)
    private Date addTime = new Date();//添加时间

    @Column(length = 50)
    private String name;//名称

    @Column(length = 400)
    private String description;//描述

    @Column(length = 100)
    private String img;//图片

    @Column(name = "comment_size")
    private Integer commentSize = 0;//评论次数

    @Column(length = 20)
    private String website;//网站

    @Column
    private Boolean enabled = Boolean.TRUE;// 是否可用

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "photo")
    private Set<PhotoComment> photoComments = new HashSet<PhotoComment>(0);//照片评论

    public Photo(Album album) {
        this.album = album;
    }

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

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public Date getAddTime() {
        return this.addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getCommentSize() {
        return commentSize;
    }

    public void setCommentSize(Integer commentSize) {
        this.commentSize = commentSize;
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

    public Set<PhotoComment> getPhotoComments() {
        return photoComments;
    }

    public void setPhotoComments(Set<PhotoComment> photoComments) {
        this.photoComments = photoComments;
    }

    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;

        Photo pojo = (Photo) o;
        if (album != null ? !album.equals(pojo.album) : pojo.album != null)
            return false;
        if (user != null ? !user.equals(pojo.user) : pojo.user != null)
            return false;
        if (addTime != null ? !addTime.equals(pojo.addTime)
                : pojo.addTime != null)
            return false;
        if (name != null ? !name.equals(pojo.name) : pojo.name != null)
            return false;
        if (description != null ? !description.equals(pojo.description)
                : pojo.description != null)
            return false;
        if (img != null ? !img.equals(pojo.img) : pojo.img != null)
            return false;
        if (website != null ? !website.equals(pojo.website) : pojo.website != null)
            return false;
        return true;
    }

    public int hashCode() {
        int result = 0;
        result = (album != null ? album.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result
                + (description != null ? description.hashCode() : 0);
        result = 31 * result + (img != null ? img.hashCode() : 0);
        result = 31 * result + (website != null ? website.hashCode() : 0);
        return result;
    }

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", this.id)
                .append("album", this.album)
                .append("user", this.user)
                .append("addTime", this.addTime)
                .append("name", this.name)
                .append("description", this.description)
                .append("enabled", this.enabled)
                .append("user", this.user).toString();
    }

}
