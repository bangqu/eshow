package cn.org.eshow.service.impl;

import cn.org.eshow.bean.query.ProductQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.ProductDao;
import cn.org.eshow.model.Product;
import cn.org.eshow.model.ProductCategory;
import cn.org.eshow.service.ProductManager;
import cn.org.eshow.service.impl.GenericManagerImpl;

import java.util.List;
import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@WebService(serviceName = "ProductService", endpointInterface = "cn.org.eshow.service.ProductManager")
@Service
public class ProductManagerImpl extends GenericManagerImpl<Product, Integer> implements ProductManager {

	@Autowired
	ProductDao productDao;

	@Autowired
	public ProductManagerImpl(ProductDao productDao) {
		super(productDao);
		this.productDao = productDao;
	}

    @Override
	public List<Product> list(ProductQuery query) {
		return productDao.list(query);
	}

    @Override
	public Page<Product> search(ProductQuery query) {
		return productDao.search(query);
	}

    @Override
    public Product check(ProductQuery query) {
        List<Product> list = productDao.list(query);
        if (!list.isEmpty()) {
            return list.get(0);
        }
        return null;
    }

	@Override
	public void update(List<Product> products, ProductCategory productCategory) {
		for (Product product : products) {
			product.setProductCategory(productCategory);// 循环每一条服务,后更改服务的ID为NULL
			productDao.save(product);
		}
	}

	@Override
	public void update(Integer productCategoryId) {
		ProductQuery query = new ProductQuery();
		query.setProductCategoryId(productCategoryId);
		List<Product> products = productDao.list(query);
		update(products, null);
	}

}