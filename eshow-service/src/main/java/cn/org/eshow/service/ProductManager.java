package cn.org.eshow.service;

import cn.org.eshow.bean.query.ProductQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Product;
import cn.org.eshow.model.ProductCategory;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface ProductManager extends GenericManager<Product, Integer> {

	/**
	 *
	 * @param query
	 * @return
     */
	List<Product> list(ProductQuery query);

	/**
	 *
	 * @param query
	 * @return
     */
	Page<Product> search(ProductQuery query);

	/**
	 *
	 * @param query
	 * @return
     */
    Product check(ProductQuery query);

	/**
	 * 修改产品列表的产品分类
	 * 
	 * @param products
	 * @param productCategory
	 */
	void update(List<Product> products, ProductCategory productCategory);

	/**
	 * 修改当前产品分类的产品列表的分类为NULL
	 * 
	 * @param productCategoryId
	 */
	void update(Integer productCategoryId);
}
