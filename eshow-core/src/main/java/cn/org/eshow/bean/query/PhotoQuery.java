package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * Photo 查询Bean
 * 
 * @author leida
 * 
 */
public class PhotoQuery extends BaseQuery{

	public Date addTime;//
	public String name;//
	public String content;//
	public Integer userId;//
	public Integer albumId;//
	public String albumIds;//

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
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

	public Integer getAlbumId() {
		return albumId;
	}

	public void setAlbumId(Integer albumId) {
		this.albumId = albumId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAlbumIds() {
		return albumIds;
	}

	public void setAlbumIds(String albumIds) {
		this.albumIds = albumIds;
	}

}