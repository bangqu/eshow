package cn.org.eshow.dao;

import java.util.List;

import cn.org.eshow.bean.query.ProductCategoryQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.GenericDao;
import cn.org.eshow.model.ProductCategory;

/**
 * An interface that provides a data management interface to the ProductCategory table.
 */
public interface ProductCategoryDao extends GenericDao<ProductCategory, Integer> {

	List<ProductCategory> list(ProductCategoryQuery query);

	Page<ProductCategory> search(ProductCategoryQuery query);
}