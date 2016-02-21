package cn.org.eshow.dao;

import java.util.List;

import cn.org.eshow.bean.query.BlogQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.GenericDao;
import cn.org.eshow.model.Blog;


/**
 * An interface that provides a data management interface to the Blog table.
 */
public interface BlogDao extends GenericDao<Blog, Integer> {
	
	List<Blog> list(BlogQuery query);
	
	Page<Blog> search(BlogQuery query );
}