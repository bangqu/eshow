package cn.org.eshow.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 博文表
 *
 * @author leida
 */
@Entity
@Table(name = "blog")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Blog extends BaseObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;// 用户

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
    @JoinColumn(name = "category_id")
    private Category category;// 分类

    @Column(name = "add_time", length = 0)
    private Date addTime = new Date();// 添加时间

    @Column(name = "update_time", length = 0)
    private Date updateTime = new Date();// 更新时间

    @Column(length = 100)
    private String title;// 标题

    @Column(length = 100)
    private String keyword;//关键字

    @Column(length = 0, nullable = false)
    private String content;// 正文

    @Column
    private String img;//图片

    @Column(name = "comment_size")
    private Integer commentSize = 0;// 回复数

    @Column
    private Integer count = 0;// 浏览次数

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

    public Category getCategory() {
        return this.category;
    }

    public void setCategory(Category category) {
        this.category = category;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
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


    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;

        Blog pojo = (Blog) o;

        if (user != null ? !user.equals(pojo.user) : pojo.user != null)
            return false;
        if (category != null ? !category.equals(pojo.category) : pojo.category != null)
            return false;
        if (addTime != null ? !addTime.equals(pojo.addTime) : pojo.addTime != null)
            return false;
        if (title != null ? !title.equals(pojo.title) : pojo.title != null)
            return false;
        if (website != null ? !website.equals(pojo.website) : pojo.website != null)
            return false;
        if (content != null ? !content.equals(pojo.content) : pojo.content != null)
            return false;
        if (img != null ? !img.equals(pojo.img) : pojo.img != null)
            return false;

        return true;
    }

    public int hashCode() {
        int result = 0;
        result = result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (category != null ? category.hashCode() : 0);
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (keyword != null ? keyword.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (img != null ? img.hashCode() : 0);
        result = 31 * result + (website != null ? website.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", this.id)
                .append("user", this.user.toString())
                .append("category", this.category)
                .append("addTime", this.addTime)
                .append("title", this.title)
                .append("keyword", this.keyword)
                .append("content", this.content)
                .toString();
    }

}
