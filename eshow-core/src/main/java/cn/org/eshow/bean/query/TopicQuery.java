package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * Topic 查询Bean
 * 
 * @author leida
 */
public class TopicQuery extends BaseQuery{

	public Date addTime;//
	public Date updateTime;//
	public String title;//
	public String content;//
	public Integer tip;//
	public Integer state;//
	public Integer userId;//
	public Integer boardId;//

	public Date getAddTime() {
		return addTime;
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

	public Integer getTip() {
		return tip;
	}

	public void setTip(Integer tip) {
		this.tip = tip;
	}	

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getBoardId() {
		return boardId;
	}

	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	};

}