package cn.org.eshow.model;

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
 * 信息页表
 * 
 * @author leida
 */
@Entity
@Table(name = "info")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Info extends BaseObject implements Serializable {

	private static final long serialVersionUID = 8595503517379467249L;

	private Integer id;// 信息ID
	private User user;// 用户ID
	private String type;// 类型
	private String title;// 标题
	private String url;// 链接
	private String content;// 内容
	private String remark;// 备注
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
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "type", length = 20)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "url", length = 50)
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(name = "title", length = 200)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "content")
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "remark", length = 400)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("type").append("='").append(getType()).append("', ");
		sb.append("url").append("='").append(getUrl()).append("', ");
		sb.append("title").append("='").append(getTitle()).append("', ");
		sb.append("content").append("='").append(getContent()).append("', ");
		sb.append("enabled").append("='").append(getEnabled()).append("', ");
		sb.append("website").append("='").append(getWebsite()).append("', ");
		sb.append("]");

		return sb.toString();
	}

}
