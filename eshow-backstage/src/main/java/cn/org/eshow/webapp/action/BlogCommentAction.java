package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.BlogCommentQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Blog;
import cn.org.eshow.model.BlogComment;
import cn.org.eshow.service.BlogCommentManager;
import cn.org.eshow.service.BlogManager;
import cn.org.eshow.util.CommonUtil;
import cn.org.eshow.util.PageUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

@Results({ @Result(name = "input", location = "add"),
		@Result(name = "list", type = "redirect", location = ""),
		@Result(name = "success", type = "redirect", location = "/blog/view/${id}"),
		@Result(name = "redirect", type = "redirect", location = "${redirect}") })
@AllowedMethods({"list","search","delete","view","update","save"})
public class BlogCommentAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	@Autowired
	private BlogCommentManager blogCommentManager;
	@Autowired
	private BlogManager blogManager;

	private List<BlogComment> blogComments;
	private BlogComment blogComment;
	private BlogCommentQuery query;
	private Integer blogId;

	/**
	 *
	 * @return
     */
	public String search() {
		Page<BlogComment> page = blogCommentManager.search(query);
		blogComments = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	/**
	 *
	 * @return
     */
	public String delete() {
		BlogComment blogComment = blogCommentManager.get(id);
		// 日志的主人可以删除回复，回复主人可以删除自己的回复
		if (blogComment != null) {
			if (blogComment.getBlog().getUser().equals(getSessionUser())
					|| blogComment.getUser().equals(getSessionUser())
					|| getSessionUser().getUsername().equals("service@fanbao.com")) {
				Blog blog = blogComment.getBlog();
				blog.setCommentSize(blog.getCommentSize() - CommonVar.STEP);
				blogManager.save(blog);
				blogCommentManager.remove(id);
				saveMessage("删除成功");
			} else {
				saveMessage("无权删除");
			}
		}
		return LIST;
	}

	public String save() throws Exception {
		blogComment.setAddTime(new Date());
		blogComment.setUser(getSessionUser());
		Blog blog = blogManager.get(blogId);
		blog.setCommentSize(CommonUtil.count(blog.getCommentSize()));
		blogComment.setBlog(blog);
		blogCommentManager.save(blogComment);
		id = blogId;
		saveMessage("添加成功");
		return SUCCESS;
	}

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