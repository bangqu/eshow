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
 * 图片表
 *
 * @author leida
 */
@Entity
@Table(name = "photo")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Photo extends BaseObject implements Serializable {

	private static final long serialVersionUID = 4417313563984109261L;

	private Integer id;//图片
	private User user;//用户
	private Album album;//相册
	private Date addTime;//添加时间
	private String name;//名称
	private String description;//描述
	private String img;//图片
	private Integer commentSize;//评论次数
	private String website;//网站
	private Boolean enabled;// 是否可用
	private Set<PhotoComment> photoComments = new HashSet<PhotoComment>(0);//图片评论

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

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
	@JoinColumn(name = "albumId")
	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	@Column(name = "addTime", length = 0)
	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	@Column(name = "name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "description", length = 400)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "img", length = 100)
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
	
	@Column(name = "enabled")
	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	
	@Column(name = "website",length=20)
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "photo")
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
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("album").append("='").append(getAlbum()).append("', ");
		sb.append("user").append("='").append(getUser()).append("', ");
		sb.append("addTime").append("='").append(getAddTime()).append("', ");
		sb.append("name").append("='").append(getName()).append("', ");
		sb.append("description").append("='").append(getDescription()).append(
				"', ");
		sb.append("photo").append("='").append(getImg()).append("', ");
		sb.append("website").append("='").append(getWebsite()).append("', ");
		sb.append("]");

		return sb.toString();
	}

}
