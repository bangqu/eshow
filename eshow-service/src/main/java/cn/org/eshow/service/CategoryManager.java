package cn.org.eshow.service;

import cn.org.eshow.bean.query.CategoryQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Category;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface CategoryManager extends GenericManager<Category, Integer> {

	/**
	 *
	 * @param query
	 * @return
     */
	List<Category> list(CategoryQuery query);

	/**
	 *
	 * @param query
	 * @return
     */
	Page<Category> search(CategoryQuery query);
}