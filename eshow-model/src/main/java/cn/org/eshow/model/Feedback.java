package cn.org.eshow.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import java.io.Serializable;

/**
 * 反馈表
 * 
 * @author leida
 */
@Entity
@Table(name = "feedback")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Feedback extends BaseObject implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;// 反馈ID
	private String username;// 作者
	private Date addTime;// 添加时间
	private String title;// 标题
	private String content;// 正文
	private String reply;// 回复
	private Integer state;// 状态
	private String phone;// 电话
	private String website;// 网站
	private Integer replyId;// 回复ID

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "addTime", length = 0)
	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	@Column(name = "title", length = 100)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "content", length = 400)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "username", length = 100)
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "reply", length = 100)
	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	@Column(name = "state", length = 100)
	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Column(name = "phone", length = 100)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "website", length = 100)
	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	@Column(name = "replyId", length = 100)
	public Integer getReplyId() {
		return replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		Feedback pojo = (Feedback) o;

		if (username != null ? !username.equals(pojo.username) : pojo.username != null)
			return false;
		if (addTime != null ? !addTime.equals(pojo.addTime) : pojo.addTime != null)
			return false;
		if (title != null ? !title.equals(pojo.title) : pojo.title != null)
			return false;
		if (website != null ? !website.equals(pojo.website) : pojo.website != null)
			return false;
		if (content != null ? !content.equals(pojo.content) : pojo.content != null)
			return false;

		return true;
	}

	public int hashCode() {
		int result = 0;
		result = result + (username != null ? username.hashCode() : 0);
		result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
		result = 31 * result + (title != null ? title.hashCode() : 0);
		result = 31 * result + (content != null ? content.hashCode() : 0);
		result = 31 * result + (website != null ? website.hashCode() : 0);

		return result;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("addTime").append("='").append(getAddTime()).append("', ");
		sb.append("title").append("='").append(getTitle()).append("', ");
		sb.append("content").append("='").append(getContent()).append("', ");
		sb.append("website").append("='").append(getWebsite()).append("', ");

		sb.append("]");

		return sb.toString();
	}

}
