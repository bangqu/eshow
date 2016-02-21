package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * Post 查询Bean
 * 
 * @author leida
 * 
 */
public class PostQuery extends BaseQuery {

	public Date addTime;//
	public String title;//
	public String content;//
	public Integer userId;//

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}