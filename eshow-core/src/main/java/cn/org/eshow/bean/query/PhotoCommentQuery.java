package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * PhotoComment 查询Bean
 * 
 * @author leida
 * 
 */
public class PhotoCommentQuery extends BaseQuery{

	public Date addTime;//
	public String name;//
	public String content;//
	public Integer photoId;//
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getPhotoId() {
		return photoId;
	}

	public void setPhotoId(Integer photoId) {
		this.photoId = photoId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}