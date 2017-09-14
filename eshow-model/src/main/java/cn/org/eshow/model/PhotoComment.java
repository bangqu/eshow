package cn.org.eshow.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 照片评论表
 *
 * @author leida
 */
@Entity
@Table(name = "photo_comment")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class PhotoComment extends BaseObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;// 照片评论ID

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;// 用户

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
    @JoinColumn(name = "photo_id")
    private Photo photo;// 图片

    @Column(name = "add_time", length = 0)
    private Date addTime;// 添加时间

    @Column(length = 400)
    private String content;// 内容

    @Column(length = 20)
    private String website;// 网站

    @Column
    private Boolean enabled;//是否可用


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;

        PhotoComment pojo = (PhotoComment) o;

        if (user != null ? !user.equals(pojo.user) : pojo.user != null)
            return false;
        if (addTime != null ? !addTime.equals(pojo.addTime) : pojo.addTime != null)
            return false;
        if (content != null ? !content.equals(pojo.content) : pojo.content != null)
            return false;
        if (website != null ? !website.equals(pojo.website) : pojo.website != null)
            return false;

        return true;
    }

    public int hashCode() {
        int result = 0;
        result = result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (website != null ? website.hashCode() : 0);

        return result;
    }

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", this.id)
                .append("user", this.getUser().toString())
                .append("addTime", this.addTime)
                .append("content", this.content)
                .append("website", this.website).toString();
    }

}
