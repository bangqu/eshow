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
 * 图片评论表
 *
 * @author leida
 */
@Entity
@Table(name = "photo_comment")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class PhotoComment extends BaseObject implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;// 图片评论ID
	private User user;// 用户
	private Photo photo;// 图片
	private Date addTime;// 添加时间
	private String content;// 内容
	private String website;// 网站
	private Boolean enabled;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "enabled")
	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
	@JoinColumn(name = "photoId")
	public Photo getPhoto() {
		return this.photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

	@Column(name = "addTime", length = 0)
	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	@Column(name = "content", length = 400)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "website", length = 20)
	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
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
