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
 * 话题板块表
 * 
 * @author leida
 */
@Entity
@Table(name = "board")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Board extends BaseObject implements Serializable {

	private static final long serialVersionUID = 6191125134212611571L;

	private Integer id;// 版块ID
	private Date addTime;// 添加时间
	private String name;// 版块名称
	private String description;// 描述
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
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	@Column(name = "name", length = 100)
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

		Board pojo = (Board) o;

		if (addTime != null ? !addTime.equals(pojo.addTime) : pojo.addTime != null)
			return false;
		if (name != null ? !name.equals(pojo.name) : pojo.name != null)
			return false;
		if (website != null ? !website.equals(pojo.website) : pojo.website != null)
			return false;
		if (description != null ? !description.equals(pojo.description) : pojo.description != null)
			return false;

		return true;
	}

	public int hashCode() {
		int result = 0;
		result = result + (addTime != null ? addTime.hashCode() : 0);
		result = 31 * result + (name != null ? name.hashCode() : 0);
		result = 31 * result + (website != null ? website.hashCode() : 0);
		result = 31 * result + (description != null ? description.hashCode() : 0);
		return result;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("addTime").append("='").append(getAddTime()).append("', ");
		sb.append("name").append("='").append(getName()).append("', ");
		sb.append("website").append("='").append(getWebsite()).append("', ");
		sb.append("description").append("='").append(getDescription()).append("', ");

		sb.append("]");

		return sb.toString();
	}

}
