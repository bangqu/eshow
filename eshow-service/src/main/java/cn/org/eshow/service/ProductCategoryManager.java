package cn.org.eshow.service;

import java.util.List;

import cn.org.eshow.bean.query.ProductCategoryQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.ProductCategory;
import cn.org.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface ProductCategoryManager extends GenericManager<ProductCategory, Integer> {

	List<ProductCategory> list(ProductCategoryQuery query);

	Page<ProductCategory> search(ProductCategoryQuery query);
}