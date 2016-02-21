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
 * 博文分类表
 * 
 * @author leida
 */
@Entity
@Table(name = "category")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Category extends BaseObject implements Serializable {

	private static final long serialVersionUID = -8900865569034536533L;

	private Integer id;// 分类ID
	private Date addTime;// 添加时间
	private Date updateTime;// 更新时间
	private String name;// 名称
	private String remark;// 注释
	private Integer sequence;// 序号
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

	@Column(name = "addTime", length = 0)
	public Date getAddTime() {
		return addTime;
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

	@Column(name = "name", length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "remark", length = 200)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "sequence")
	public Integer getSequence() {
		return sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
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

		Category pojo = (Category) o;

		if (name != null ? !name.equals(pojo.name) : pojo.name != null)
			return false;
		if (website != null ? !website.equals(pojo.website) : pojo.website != null)
			return false;
		if (remark != null ? !remark.equals(pojo.remark) : pojo.remark != null)
			return false;

		return true;
	}

	public int hashCode() {
		int result = 0;
		result = result + (name != null ? name.hashCode() : 0);
		result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
		result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
		result = 31 * result + (remark != null ? remark.hashCode() : 0);
		result = 31 * result + (website != null ? website.hashCode() : 0);

		return result;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("addTime").append("='").append(getAddTime()).append("', ");
		sb.append("updateTime").append("='").append(getUpdateTime()).append("', ");
		sb.append("name").append("='").append(getName()).append("', ");
		sb.append("remark").append("='").append(getRemark()).append("', ");
		sb.append("website").append("='").append(getWebsite()).append("', ");
		sb.append("]");

		return sb.toString();
	}

}
