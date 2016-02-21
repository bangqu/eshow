package cn.org.eshow.dao;

import java.util.List;

import cn.org.eshow.bean.query.CategoryQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.GenericDao;
import cn.org.eshow.model.Category;

/**
 * An interface that provides a data management interface to the Category table.
 */
public interface CategoryDao extends GenericDao<Category, Integer> {

	List<Category> list(CategoryQuery query);

	Page<Category> search(CategoryQuery query);
}