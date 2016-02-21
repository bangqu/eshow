package cn.org.eshow.service.impl;

import java.util.List;

import cn.org.eshow.bean.query.BlogQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.BlogDao;
import cn.org.eshow.model.Blog;
import cn.org.eshow.service.BlogManager;
import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@WebService(serviceName = "BlogService", endpointInterface = "cn.org.eshow.service.BlogManager")
@Service
public class BlogManagerImpl extends GenericManagerImpl<Blog, Integer> implements BlogManager {

	@Autowired
	BlogDao blogDao;

	@Autowired
	public BlogManagerImpl(BlogDao blogDao) {
		super(blogDao);
		this.blogDao = blogDao;
	}

    @Override
	public List<Blog> list(BlogQuery query) {
		return blogDao.list(query);
	}

    @Override
	public Page<Blog> search(BlogQuery query) {
		return blogDao.search(query);
	}

}