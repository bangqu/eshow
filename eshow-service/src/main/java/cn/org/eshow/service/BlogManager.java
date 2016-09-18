package cn.org.eshow.service;

import cn.org.eshow.bean.query.BlogQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Blog;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface BlogManager extends GenericManager<Blog, Integer> {

	/**
	 *
	 * @param query
	 * @return
     */
	List<Blog> list(BlogQuery query);

	/**
	 *
	 * @param query
	 * @return
     */
	Page<Blog> search(BlogQuery query);

}
