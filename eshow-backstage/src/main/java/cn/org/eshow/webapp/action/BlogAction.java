package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.BlogQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Blog;
import cn.org.eshow.model.Category;
import cn.org.eshow.service.BlogManager;
import cn.org.eshow.service.CategoryManager;
import cn.org.eshow.util.PageUtil;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Results({@Result(name = "input", location = "add"),
        @Result(name = "list", type = "redirect", location = ""),
        @Result(name = "success", type = "redirect", location = "view/${id}"),
        @Result(name = "redirect", type = "redirect", location = "${redirect}")})
@AllowedMethods({"list", "noRepeatedList", "search", "category", "delete", "view", "update", "save"})
public class BlogAction extends BaseAction {

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

    /**
     * @return
     */
    public String list() {
        blogs = blogManager.list(query);
        return LIST;
    }

    /**
     * @return
     */
    public String noRepeatedList() {
        blogs = blogManager.list(query);
        if (!blogs.isEmpty()) {
            for (Blog obj : blogs) {
                if (!keywordList.contains(obj.getKeyword())) {
                    keywordList.add(obj.getKeyword());
                }
            }
        }
        return LIST;
    }

    /**
     * @return
     */
    public String search() {
        Page<Blog> page = blogManager.search(query);
        blogs = page.getDataList();
        saveRequest("page", PageUtil.conversion(page));
        saveRequest("query", query);
        return LIST;
    }

    /**
     * @return
     */
    public String category() {
        Page<Blog> page = blogManager.search(query);
        blogs = page.getDataList();
        saveRequest("page", PageUtil.conversion(page));
        return LIST;
    }

    /**
     *
     */
    public void delete() {
        blog = blogManager.get(id);
        if (blog != null) {
            blog.setEnabled(Boolean.FALSE);
            blogManager.save(blog);
            RenderUtil.success("删除成功");
        } else {
            RenderUtil.failure("参数不正确");
        }
    }

    /**
     * @return
     */
    public String view() {
        if (id != null) {
            blog = blogManager.get(id);
            blog.setCount(blog.getCount() + CommonVar.STEP);
            blog = blogManager.save(blog);
        } else {
            blog = new Blog();
        }
        return REDIRECT;
    }

    /**
     * @return
     * @throws Exception
     */
    public String update() throws Exception {
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
        saveMessage("修改成功");
        return REDIRECT;

    }

    /**
     * @return
     * @throws Exception
     */
    public String save() throws Exception {
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
        blog.setUser(getSessionUser());
        blog.setEnabled(true);
        blog = blogManager.save(blog);
        saveMessage("添加成功");
        id = blog.getId();
        return REDIRECT;
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