package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * App 查询Bean
 * 
 * @author leida
 * 
 */
public class AppQuery extends BaseQuery {

	public Date addTime;//
	public String name;//
	public String description;//
	public Integer userId;//

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

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}