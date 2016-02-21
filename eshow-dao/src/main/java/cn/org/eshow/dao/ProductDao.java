package cn.org.eshow.dao;

import java.util.List;

import cn.org.eshow.bean.query.ProductQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.GenericDao;
import cn.org.eshow.model.Product;


/**
 * An interface that provides a data management interface to the Product table.
 */
public interface ProductDao extends GenericDao<Product, Integer> {
	
	List<Product> list(ProductQuery query);
	
	Page<Product> search(ProductQuery query);
}

