package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * BlogComment 查询Bean
 * 
 * @author leida
 * 
 */
public class BlogCommentQuery extends BaseQuery {

	public Date addTime;//
	public String name;//
	public String content;//
	public String ip;//
	public String im;//
	public String email;//
	public String website;//
	public Integer blogId;//
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

	public Integer getBlogId() {
		return blogId;
	}

	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}