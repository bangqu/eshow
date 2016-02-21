package cn.org.eshow.service.impl;

import cn.org.eshow.bean.query.ProductCategoryQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.ProductCategoryDao;
import cn.org.eshow.model.ProductCategory;
import cn.org.eshow.service.ProductCategoryManager;
import cn.org.eshow.service.impl.GenericManagerImpl;

import java.util.List;
import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@WebService(serviceName = "ProductCategoryService", endpointInterface = "cn.org.eshow.service.ProductCategoryManager")
@Service
public class ProductCategoryManagerImpl extends GenericManagerImpl<ProductCategory, Integer> implements ProductCategoryManager {

	@Autowired
	ProductCategoryDao productCategoryDao;

	@Autowired
	public ProductCategoryManagerImpl(ProductCategoryDao productCategoryDao) {
		super(productCategoryDao);
		this.productCategoryDao = productCategoryDao;
	}

    @Override
	public List<ProductCategory> list(ProductCategoryQuery query) {
		return productCategoryDao.list(query);
	}

    @Override
	public Page<ProductCategory> search(ProductCategoryQuery query) {
		return productCategoryDao.search(query);
	}

}