package cn.org.eshow.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import java.io.Serializable;

/**
 * 主题表
 *
 * @author leida
 */
@Entity
@Table(name = "topic")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Topic extends BaseObject implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;//主题ID
	private User user;//用户
	private Board board;//板块
	private Date addTime;//添加时间
	private Date updateTime;//更新时间
	private String title;//标题
	private String content;//内容
	private Integer commentSize; // 回复次数
	private Integer count; // 浏览次数
	private Integer tip; //
	private Integer state; // 0未审核,1已通过,2未通过
    private String website;//网站
	private Boolean enabled;//是否可用

	private Set<TopicComment> topicComments = new HashSet<TopicComment>(0);

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "boardId")
	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
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

	@Column(name = "title", length = 200)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "content")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	@Column(name = "state")
	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Column(name = "tip")
	public Integer getTip() {
		return tip;
	}

	public void setTip(Integer tip) {
		this.tip = tip;
	}


    @Column(name = "website",length=20)
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


	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "topic")
	public Set<TopicComment> getTopicComments() {
		return topicComments;
	}

	public void setTopicComments(Set<TopicComment> topicComments) {
		this.topicComments = topicComments;
	}

	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		Topic pojo = (Topic) o;

		if (user != null ? !user.equals(pojo.user) : pojo.user != null)
			return false;
		if (addTime != null ? !addTime.equals(pojo.addTime)
				: pojo.addTime != null)
			return false;
		if (title != null ? !title.equals(pojo.title) : pojo.title != null)
			return false;
		if (content != null ? !content.equals(pojo.content)
				: pojo.content != null)
			return false;
		if (commentSize != null ? !commentSize.equals(pojo.commentSize)
				: pojo.commentSize != null)
			return false;
		if (count != null ? !count.equals(pojo.count) : pojo.count != null)
			return false;
		if (tip != null ? !tip.equals(pojo.tip) : pojo.tip != null)
			return false;
		if (website != null ? !website.equals(pojo.website) : pojo.website != null)
			return false;

		return true;
	}

	public int hashCode() {
		int result = 0;
		result = result + (user != null ? user.hashCode() : 0);
		result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
		result = 31 * result + (title != null ? title.hashCode() : 0);
		result = 31 * result + (content != null ? content.hashCode() : 0);
		result = 31 * result
				+ (commentSize != null ? commentSize.hashCode() : 0);
		result = 31 * result + (count != null ? count.hashCode() : 0);
		result = 31 * result + (tip != null ? tip.hashCode() : 0);
		result = 31 * result + (website != null ? website.hashCode() : 0);

		return result;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("user").append("='").append(getUser()).append("', ");
		sb.append("addTime").append("='").append(getAddTime()).append("', ");
		sb.append("title").append("='").append(getTitle()).append("', ");
		sb.append("content").append("='").append(getContent()).append("', ");
		sb.append("commentSize").append("='").append(getCommentSize()).append(
				"', ");
		sb.append("count").append("='").append(getCount()).append("', ");
		sb.append("tip").append("='").append(getTip()).append("', ");
		sb.append("website").append("='").append(getWebsite()).append("', ");

		sb.append("]");

		return sb.toString();
	}
}
