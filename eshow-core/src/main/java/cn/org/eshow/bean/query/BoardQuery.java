package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * Board 查询Bean
 * 
 * @author leida
 * 
 */
public class BoardQuery extends BaseQuery {

	public Date addTime;//
	public String name;//
	public String description;//
	public Integer sequence;//
	public String website;//

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getSequence() {
		return sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}
}