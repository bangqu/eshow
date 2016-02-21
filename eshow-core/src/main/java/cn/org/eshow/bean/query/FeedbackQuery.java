package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * Feedback 查询Bean
 * 
 * @author leida
 * 
 */
public class FeedbackQuery extends BaseQuery {

	public Date addTime;//
	public String title;//
	public String content;//
	public String reply;//
	public Integer state;//
	public String username;//
	public String ip;//
	public String im;//
	public String phone;//
	public String email;//
	public String website;//
	public Integer replyId;//

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

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getIm() {
		return im;
	}

	public void setIm(String im) {
		this.im = im;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public Integer getReplyId() {
		return replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}



}