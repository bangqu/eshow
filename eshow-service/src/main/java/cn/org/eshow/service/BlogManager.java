package cn.org.eshow.service;

import java.util.List;
import java.util.Set;

import cn.org.eshow.bean.query.BlogQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Blog;

import javax.jws.WebService;

@WebService
public interface BlogManager extends GenericManager<Blog, Integer> {
	
	List<Blog> list(BlogQuery query);
	
	Page<Blog> search(BlogQuery query);

}
