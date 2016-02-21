package cn.org.eshow.service.impl;

import cn.org.eshow.bean.query.CategoryQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.CategoryDao;
import cn.org.eshow.model.Category;
import cn.org.eshow.service.CategoryManager;
import cn.org.eshow.service.impl.GenericManagerImpl;

import java.util.List;
import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@WebService(serviceName = "CategoryService", endpointInterface = "cn.org.eshow.service.CategoryManager")
@Service
public class CategoryManagerImpl extends GenericManagerImpl<Category, Integer> implements CategoryManager {
	@Autowired
	CategoryDao categoryDao;

	@Autowired
	public CategoryManagerImpl(CategoryDao categoryDao) {
		super(categoryDao);
		this.categoryDao = categoryDao;
	}

    @Override
	public List<Category> list(CategoryQuery query) {
		return categoryDao.list(query);
	}

    @Override
	public Page<Category> search(CategoryQuery query) {
		return categoryDao.search(query);
	}

}