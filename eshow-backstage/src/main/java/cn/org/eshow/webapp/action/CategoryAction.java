package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.BlogQuery;
import cn.org.eshow.bean.query.CategoryQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Blog;
import cn.org.eshow.model.Category;
import cn.org.eshow.service.BlogManager;
import cn.org.eshow.service.CategoryManager;
import cn.org.eshow.util.PageUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

@Results({@Result(name = "input", location = "add"),
        @Result(name = "list", type = "redirect", location = ""),
        @Result(name = "success", type = "redirect", location = "view/${id}"),
        @Result(name = "redirect", type = "redirect", location = "${redirect}")})
@AllowedMethods({"list","search","delete","view","update","save","page"})
public class CategoryAction extends BaseAction {

    private static final long serialVersionUID = 1L;

    @Autowired
    private CategoryManager categoryManager;
    @Autowired
    private BlogManager blogManager;

    private List<Category> categories;
    private Category category;
    private CategoryQuery query = new CategoryQuery();


    /**
     *
     * @return
     */
    public String search() {
        Page<Category> page = categoryManager.search(query);
        categories = page.getDataList();
        saveRequest("page", PageUtil.conversion(page));
        return LIST;
    }

    /**
     *
     * @return
     */
    public String delete() {
        Category category = categoryManager.get(id);
        if (category != null) {
            // 查询当前分类下的日志
            BlogQuery blogQuery = new BlogQuery();
            blogQuery.setCategoryId(id);
            List<Blog> blogs = blogManager.list(blogQuery);
            for (Blog blog : blogs) {
                blog.setCategory(null);
                blogManager.save(blog);
            }
            category.setEnabled(Boolean.FALSE);
            categoryManager.save(category);
            saveMessage("删除成功");

        }
        return NONE;
    }

    /**
     *
     * @return
     */
    public String view() {
        if (id != null) {
            category = categoryManager.get(id);
        }
        return NONE;
    }

    /**
     *
     * @return
     * @throws Exception
     */
    public String update() throws Exception {
        Category old = categoryManager.get(id);
        old.setName(category.getName() != null ? category.getName() : old.getName());
        old.setRemark(category.getRemark() != null ? category.getRemark() : old.getRemark());
        old.setWebsite(category.getWebsite() != null ? category.getWebsite() : old.getWebsite());
        categoryManager.save(old);
        saveMessage("修改成功");
        return REDIRECT;
    }

    /**
     *
     * @return
     * @throws Exception
     */
    public String save() throws Exception {
        category.setAddTime(new Date());
        category.setEnabled(Boolean.TRUE);
        categoryManager.save(category);
        saveMessage("添加成功");
        return REDIRECT;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public CategoryQuery getQuery() {
        return query;
    }

    public void setQuery(CategoryQuery query) {
        this.query = query;
    }

}