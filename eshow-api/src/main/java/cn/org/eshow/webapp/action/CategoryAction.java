package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.CategoryQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Category;
import cn.org.eshow.service.CategoryManager;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * 博文分类API接口
 */
@AllowedMethods({"search", "delete", "view", "save", "update"})
public class CategoryAction extends ApiBaseAction<Category> {

    private static final long serialVersionUID = 1L;

    @Autowired
    private CategoryManager categoryManager;

    private List<Category> categories;
    private Category category;
    private CategoryQuery query = new CategoryQuery();

    /**
     *
     */
    public void search() {
        Page<Category> page = categoryManager.search(query);
        categories = page.getDataList();
        RenderUtil.search("获取成功", "categories", page);
    }

    /**
     *
     */
    public void view() {
        if (id == null) {
            RenderUtil.failure("非法参数");
            return;
        }
        category = categoryManager.get(id);
        RenderUtil.success("获取成功", category);
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