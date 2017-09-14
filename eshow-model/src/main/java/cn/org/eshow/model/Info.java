package cn.org.eshow.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 信息表
 *
 * @author leida
 */
@Entity
@Table(name = "info")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Info extends BaseObject implements Serializable {

    private static final long serialVersionUID = 8595503517379467249L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;// 信息ID

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;// 用户ID

    @Column(length = 20)
    private String type;// 类型

    @Column(length = 200)
    private String title;// 标题

    @Column(length = 50)
    private String url;// 链接

    @Column
    private String content;// 内容

    @Column(length = 400)
    private String remark;// 备注

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
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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

        Info pojo = (Info) o;

        if (type != null ? !type.equals(pojo.type) : pojo.type != null)
            return false;
        if (url != null ? !url.equals(pojo.url) : pojo.url != null)
            return false;
        if (title != null ? !title.equals(pojo.title) : pojo.title != null)
            return false;
        if (content != null ? !content.equals(pojo.content) : pojo.content != null)
            return false;
        if (enabled != null ? !enabled.equals(pojo.enabled) : pojo.enabled != null)
            return false;
        if (website != null ? !website.equals(pojo.website) : pojo.website != null)
            return false;

        return true;
    }

    public int hashCode() {
        int result = 0;
        result = result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (url != null ? url.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (enabled != null ? enabled.hashCode() : 0);
        result = 31 * result + (website != null ? website.hashCode() : 0);

        return result;
    }

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", this.id)
                .append("type", this.type)
                .append("url", this.url)
                .append("title", this.title)
                .append("enabled", this.enabled)
                .append("user", this.user).toString();
    }

}
