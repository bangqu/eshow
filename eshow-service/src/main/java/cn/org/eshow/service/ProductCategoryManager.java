package cn.org.eshow.service;

import cn.org.eshow.bean.query.ProductCategoryQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.ProductCategory;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface ProductCategoryManager extends GenericManager<ProductCategory, Integer> {

	/**
	 *
	 * @param query
	 * @return
     */
	List<ProductCategory> list(ProductCategoryQuery query);

	/**
	 *
	 * @param query
	 * @return
     */
	Page<ProductCategory> search(ProductCategoryQuery query);
}