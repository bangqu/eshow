package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.BlogQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Blog;
import cn.org.eshow.model.Category;
import cn.org.eshow.service.BlogManager;
import cn.org.eshow.service.CategoryManager;
import cn.org.eshow.util.JacksonUtil;
import cn.org.eshow.webapp.action.response.BlogResponse;
import cn.org.eshow.webapp.util.Struts2Utils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 接口
 */
@AllowedMethods({"noRepeatedList", "search", "category", "delete", "view", "save", "update"})
public class BlogAction extends ApiBaseAction<Blog> {

    private static final long serialVersionUID = 1L;

    @Autowired
    private BlogManager blogManager;
    @Autowired
    private CategoryManager categoryManager;

    private List<Blog> blogs;
    private Blog blog;
    private BlogQuery query = new BlogQuery();
    private Integer categoryId;
    private List<String> keywordList = new ArrayList<String>();


    public void noRepeatedList() {
        blogs = blogManager.list(query);
        if (blogs.isEmpty()) {
            failure("暂无数据");
            return;
        }
        for (Blog obj : blogs) {
            if (!keywordList.contains(obj.getKeyword())) {
                keywordList.add(obj.getKeyword());
            }
        }
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "获取成功" + "\",\"" + "keywordList" + "\":" + JacksonUtil.toJson(keywordList) + "}");
    }

    public void search() {
        Page<Blog> page = blogManager.search(query);
        blogs = page.getDataList();
        if (blogs.isEmpty()) {
            failure("暂无数据");
            return;
        }
        List<BlogResponse> responses = new ArrayList<BlogResponse>();
        for (Blog obj : blogs) {
            BlogResponse response = new BlogResponse(obj);
            responses.add(response);
        }
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "获取成功" + "\",\"" + "blogs" + "\":" + JacksonUtil.toJson(responses) + "}");

    }

    public void category() {
        Page<Blog> page = blogManager.search(query);
        blogs = page.getDataList();
        if (blogs.isEmpty()) {
            failure("暂无数据");
            return;
        }
        List<BlogResponse> responses = new ArrayList<BlogResponse>();
        for (Blog obj : blogs) {
            BlogResponse response = new BlogResponse(obj);
            responses.add(response);
        }
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "获取成功" + "\",\"" + "blogs" + "\":" + JacksonUtil.toJson(responses) + "}");
    }

    public void delete() {
        blog = blogManager.get(id);
        if (blog != null) {
            blog.setEnabled(Boolean.FALSE);
            blogManager.save(blog);
            success("删除成功");
        } else {
            failure("参数不正确");
        }
    }

    public void view() {
        if (id == null) {
            failure("非法参数");
            return;
        }
        blog = blogManager.get(id);
        blog.setCount(blog.getCount() + CommonVar.STEP);
        blog = blogManager.save(blog);
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "获取成功" + "\",\"" + "blog" + "\":" + JacksonUtil.toJson(new BlogResponse(blog)) + "}");
    }

    public void update() throws Exception {
        if (id == null) {
            failure("非法参数");
            return;
        }
        Blog old = blogManager.get(id);
        old.setUpdateTime(new Date());
        old.setTitle(blog.getTitle() != null ? blog.getTitle() : old.getTitle());
        old.setKeyword(blog.getKeyword() != null ? blog.getKeyword() : old.getKeyword());
        old.setContent(blog.getContent() != null ? blog.getContent() : old.getContent());
        old.setImg(blog.getImg() != null ? blog.getImg() : old.getImg());
        if (categoryId != null) {
            old.setCategory(categoryManager.get(categoryId));
        }
        if (StringUtils.isEmpty(blog.getImg())) {
            blog.setImg(null);
        }
        blogManager.save(old);
        success("修改成功");

    }

    public void save() {
        blog.setAddTime(new Date());
        blog.setUpdateTime(new Date());
        blog.setCount(CommonVar.DEFAULT);
        blog.setCommentSize(0);
        if (categoryId != null) {
            Category category = categoryManager.get(categoryId);
            blog.setCategory(category);
        }
        if (StringUtils.isEmpty(blog.getImg())) {
            blog.setImg(null);
        }
        blog.setTitle(blog.getTitle());
        blog.setContent(blog.getContent());
        blog.setImg(blog.getImg());
        blog.setEnabled(true);
        blog = blogManager.save(blog);

        success("添加成功");
    }

    public List<Blog> getBlogs() {
        return blogs;
    }

    public void setBlogs(List<Blog> blogs) {
        this.blogs = blogs;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public BlogQuery getQuery() {
        return query;
    }

    public void setQuery(BlogQuery query) {
        this.query = query;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public List<String> getKeywordList() {
        return keywordList;
    }

    public void setKeywordList(List<String> keywordList) {
        this.keywordList = keywordList;
    }


}