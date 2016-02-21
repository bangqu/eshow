package cn.org.eshow.service;

import java.util.List;

import cn.org.eshow.bean.query.CategoryQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Category;
import cn.org.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface CategoryManager extends GenericManager<Category, Integer> {
	
	List<Category> list(CategoryQuery query);

	Page<Category> search(CategoryQuery query);
}