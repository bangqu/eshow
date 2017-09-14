package cn.org.eshow.webapp.action;

import cn.org.eshow.webapp.action.BaseAction;
import cn.org.eshow.bean.query.BaseQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.component.search.SearchManager;
import cn.org.eshow.model.Blog;
import cn.org.eshow.model.BlogComment;
import cn.org.eshow.model.Topic;
import cn.org.eshow.model.User;
import cn.org.eshow.util.PageUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Results({ @Result(name = "blog", location = "/search/"),
		@Result(name = "user", location = "/search/user"),
		@Result(name = "service", location = "/search/service"),
		@Result(name = "topic", location = "/search/topic") })
public class SearchAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	public static final String BLOG = "blog";
	public static final String USER = "user";
	public static final String TOPIC = "topic";

	@Autowired
	private SearchManager searchManager;

	private String keyword = "";
	private List<Blog> blogs;
	private List<User> users;
	private List<Topic> topics;

	private List<BlogComment> blogComments;
	private BaseQuery query = new BaseQuery();

	public String blog() throws Exception {
		if (StringUtils.isNotEmpty(keyword)) {
			Page<Blog> page = searchManager.search(Blog.class, keyword, query.getOffset(), query.pagesize, "title", "content");
			blogs = page.getDataList();
			saveRequest("page", PageUtil.conversion(page));
		}
		return BLOG;
	}

	public String user() throws Exception {
		if (StringUtils.isNotEmpty(keyword)) {
			Page<User> page = searchManager.search(User.class, keyword, query.getOffset(), query.pagesize, "username", "realname", "domain", "intro", "city", "province");
			users = page.getDataList();
			saveRequest("page", PageUtil.conversion(page));
		}
		return USER;
	}

	public String topic() throws Exception {
		if (StringUtils.isNotEmpty(keyword)) {
			Page<Topic> page = searchManager.search(Topic.class, keyword, query.getOffset(), query.pagesize, "title", "content");
			topics = page.getDataList();
			saveRequest("page", PageUtil.conversion(page));
		}
		return TOPIC;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public List<Blog> getBlogs() {
		return blogs;
	}

	public void setBlogs(List<Blog> blogs) {
		this.blogs = blogs;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<Topic> getTopics() {
		return topics;
	}

	public void setTopics(List<Topic> topics) {
		this.topics = topics;
	}

	public List<BlogComment> getBlogComments() {
		return blogComments;
	}

	public void setBlogComments(List<BlogComment> blogComments) {
		this.blogComments = blogComments;
	}

	public BaseQuery getQuery() {
		return query;
	}

	public void setQuery(BaseQuery query) {
		this.query = query;
	}

}
