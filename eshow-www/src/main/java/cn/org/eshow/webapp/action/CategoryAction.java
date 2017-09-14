package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.CategoryQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Category;
import cn.org.eshow.service.CategoryManager;
import cn.org.eshow.util.PageUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Results({ @Result(name = "input", location = "add"),
		@Result(name = "list", type = "redirect", location = ""),
		@Result(name = "success", type = "redirect", location = "view/${id}"),
		@Result(name = "redirect", type = "redirect", location = "${redirect}") })
@AllowedMethods({"list", "search", "delete", "view", "update", "save"})
public class CategoryAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	@Autowired
	private CategoryManager categoryManager;

	private List<Category> categories;
	private Category category;
	private CategoryQuery query = new CategoryQuery();

	/**
	 *
	 * @return
     */
	public String list() {
		categories = categoryManager.list(query);
		return LIST;
	}

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

	public String view() {
		if (id != null) {
			category = categoryManager.get(id);
		}
		return NONE;
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