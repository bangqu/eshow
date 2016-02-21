package cn.org.eshow.model;

import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import java.io.Serializable;

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

	private Integer id;
	private User user;// 作者
	private Category category;// 关联分类
	private Date addTime;// 添加时间
	private Date updateTime;// 更新时间
	private String title;// 标题
    private String keyword;//关键字
	private String content;// 正文
    private String img;//图片
	private Integer commentSize;// 回复数
	private Integer count;// 浏览次数
    private String website;// 网站
	private Boolean enabled;// 是否可用


	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
	@JoinColumn(name = "categoryId")
	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Column(name = "addTime", length = 0)
	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	@Column(name = "updateTime", length = 0)
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "title", length = 100)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

    @Column(name = "keyword", length = 100)
    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

	@Column(name = "content", length = 0, nullable = false)
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

    @Column(name = "commentSize")
	public Integer getCommentSize() {
		return commentSize;
	}

	public void setCommentSize(Integer commentSize) {
		this.commentSize = commentSize;
	}

	@Column(name = "count")
	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

    @Column(name = "website", length = 20)
    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

	@Column(name = "enabled")
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

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("user").append("='").append(getUser()).append("', ");
		sb.append("category").append("='").append(getCategory()).append("', ");
		sb.append("addTime").append("='").append(getAddTime()).append("', ");
		sb.append("title").append("='").append(getTitle()).append("', ");
        sb.append("keyword").append("='").append(getKeyword()).append("', ");
        sb.append("content").append("='").append(getContent()).append("', ");
        sb.append("img").append("='").append(getImg()).append("', ");
		sb.append("website").append("='").append(getWebsite()).append("', ");

		sb.append("]");

		return sb.toString();
	}

}
