package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.BlogCommentQuery;
import cn.org.eshow.model.BlogComment;
import cn.org.eshow.service.BlogCommentManager;
import cn.org.eshow.service.BlogManager;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * 接口
 */
@AllowedMethods({"check", "login", "singup", "third", "mobile", "password", "update", "cancel", "view"})
public class BlogCommentAction extends ApiBaseAction<BlogComment> {

	private static final long serialVersionUID = 1L;

	@Autowired
	private BlogCommentManager blogCommentManager;
	@Autowired
	private BlogManager blogManager;

	private List<BlogComment> blogComments;
	private BlogComment blogComment;
	private BlogCommentQuery query;
	private Integer blogId;



	public List<BlogComment> getBlogComments() {
		return blogComments;
	}

	public void setBlogComments(List<BlogComment> blogComments) {
		this.blogComments = blogComments;
	}

	public BlogComment getBlogComment() {
		return blogComment;
	}

	public void setBlogComment(BlogComment blogComment) {
		this.blogComment = blogComment;
	}

	public BlogCommentQuery getQuery() {
		return query;
	}

	public void setQuery(BlogCommentQuery query) {
		this.query = query;
	}

	public Integer getBlogId() {
		return blogId;
	}

	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}

}