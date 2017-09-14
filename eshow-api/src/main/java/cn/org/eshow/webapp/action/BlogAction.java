package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.BlogQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Blog;
import cn.org.eshow.service.BlogManager;
import cn.org.eshow.webapp.action.response.BlogResponse;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * 博文API接口
 */
@AllowedMethods({"search", "delete", "view", "save", "update"})
public class BlogAction extends ApiBaseAction<Blog> {

    private static final long serialVersionUID = 1L;

    @Autowired
    private BlogManager blogManager;

    private List<Blog> blogs = new ArrayList<Blog>();
    private Blog blog = new Blog();
    private BlogQuery query = new BlogQuery(Boolean.TRUE);

    /**
     * 搜索博文列表
     */
    public void search() {
        Page<Blog> page = blogManager.search(query);
        blogs = page.getDataList();
        if (blogs.isEmpty()) {
            RenderUtil.failure("暂无数据");
            return;
        }
        List<BlogResponse> responses = new ArrayList<BlogResponse>();
        for (Blog obj : blogs) {
            responses.add(new BlogResponse(obj));
        }
        RenderUtil.list("获取成功", "blogs", responses);
    }


    /**
     * 获取博文信息
     */
    public void view() {
        blog = blogManager.get(id);
        if (blog == null) {
            RenderUtil.failure("非法参数");
            return;
        }
        blog = blogManager.updateCount(blog);
        RenderUtil.success("获取成功", "blog", new BlogResponse(blog));
    }

    /**
     * 添加博文信息
     */
    public void save() {
        blog = blogManager.saveBlog(blog);
        RenderUtil.success("添加成功");
    }

    /**
     * 修改博文信息
     */
    public void update() throws Exception {
        Blog old = blogManager.get(id);
        if (old == null) {
            RenderUtil.failure("非法参数");
            return;
        }
        blogManager.updateBlog(old, blog);
        RenderUtil.success("修改成功");
    }

    /**
     * 删除博文信息
     */
    public void delete() {
        blog = blogManager.get(id);
        if (blog == null) {
            RenderUtil.failure("非法参数");
            return;
        }
        blogManager.updateEnabled(blog);
        RenderUtil.success("删除成功");
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

}