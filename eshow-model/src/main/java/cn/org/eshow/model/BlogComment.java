package cn.org.eshow.model;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 博文评论表
 *
 * @author leida
 */
@Entity
@Table(name = "blog_comment")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class BlogComment extends BaseObject implements Serializable {

    private static final long serialVersionUID = -5032303242094188729L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;// 博文评论ID

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;// 用户

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
    @JoinColumn(name = "blog_id")
    private Blog blog;// 博文

    @Column(name = "add_time", length = 0)
    private Date addTime;// 添加时间

    @Column(length = 400)
    private String content;// 内容

    @Column(length = 20)
    private String website;// 网站

    @Column
    private Boolean enabled = Boolean.TRUE;// 是否可用

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

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public Date getAddTime() {
        return this.addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getContent() {
        return this.content;
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

        BlogComment pojo = (BlogComment) o;

        if (user != null ? !user.equals(pojo.user) : pojo.user != null)
            return false;
        if (website != null ? !website.equals(pojo.website) : pojo.website != null)
            return false;
        if (addTime != null ? !addTime.equals(pojo.addTime) : pojo.addTime != null)
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
        StringBuffer sb = new StringBuffer(getClass().getSimpleName());

        sb.append(" [");
        sb.append("id").append("='").append(getId()).append("', ");
        sb.append("user").append("='").append(getUser()).append("', ");
        sb.append("addTime").append("='").append(getAddTime()).append("', ");
        sb.append("content").append("='").append(getContent()).append("', ");
        sb.append("website").append("='").append(getWebsite()).append("', ");
        sb.append("]");

        return sb.toString();
    }

}
