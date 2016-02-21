package cn.org.eshow.model;

import java.util.Date;
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
 * 相册表
 * 
 * @author leida
 */
@Entity
@Table(name = "album")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Album extends BaseObject implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;// ID
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId")
	private User user;// 用户

    @Column(name = "description", length = 400)
    private String description;// 相册描述

	@Column(name = "addTime", length = 0)
	private Date addTime;//添加时间
	
	@Column(name = "updateTime", length = 0)
	private Date updateTime;// 更新时间
	
	@Column(name = "name", length = 30)
	private String name;// 相册名称
	
	@Column(name = "img", length = 100)
	private String img;// 图片地址
	
	@Column
	private Integer photoSize;// 照片的总数
	
	@Column
	private Integer count;// 访问次数
	
	@Column(name = "website", length = 20)
	private String website;// 网站
	
	@Column
	private Boolean enabled;//是否可用 

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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getPhotoSize() {
		return photoSize;
	}

	public void setPhotoSize(Integer photoSize) {
		this.photoSize = photoSize;
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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		Album pojo = (Album) o;

		if (user != null ? !user.equals(pojo.user) : pojo.user != null)
			return false;
		if (addTime != null ? !addTime.equals(pojo.addTime) : pojo.addTime != null)
			return false;
		if (updateTime != null ? !updateTime.equals(pojo.updateTime) : pojo.updateTime != null)
			return false;
		if (name != null ? !name.equals(pojo.name) : pojo.name != null)
			return false;
		if (website != null ? !website.equals(pojo.website) : pojo.website != null)
			return false;
        if (img != null ? !img.equals(pojo.img) : pojo.img != null)
            return false;
		if (description != null ? !description.equals(pojo.description) : pojo.description != null)
			return false;

		return true;
	}

	public int hashCode() {
		int result = 0;
		result = result + (user != null ? user.hashCode() : 0);
		result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
		result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
		result = 31 * result + (website != null ? website.hashCode() : 0);
		result = 31 * result + (name != null ? name.hashCode() : 0);
		result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (img != null ? img.hashCode() : 0);

		return result;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("user").append("='").append(getUser()).append("', ");
		sb.append("addTime").append("='").append(getAddTime()).append("', ");
		sb.append("website").append("='").append(getWebsite()).append("', ");
		sb.append("updateTime").append("='").append(getUpdateTime()).append("', ");
		sb.append("name").append("='").append(getName()).append("', ");
		sb.append("website").append("='").append(getWebsite()).append("', ");
		sb.append("description").append("='").append(getDescription()).append("', ");
        sb.append("img").append("='").append(getImg()).append("', ");
		sb.append("]");

		return sb.toString();
	}

}
