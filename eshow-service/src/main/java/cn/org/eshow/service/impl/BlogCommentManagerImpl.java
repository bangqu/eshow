package cn.org.eshow.service.impl;

import java.util.List;

import cn.org.eshow.bean.query.BlogCommentQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.BlogCommentDao;
import cn.org.eshow.model.BlogComment;
import cn.org.eshow.service.BlogCommentManager;

import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@WebService(serviceName = "BlogCommentService", endpointInterface = "cn.org.eshow.service.BlogCommentManager")
@Service
public class BlogCommentManagerImpl extends GenericManagerImpl<BlogComment, Integer> implements BlogCommentManager {

	@Autowired
	BlogCommentDao blogCommentDao;
	
	@Autowired
	public BlogCommentManagerImpl(BlogCommentDao blogCommentDao) {
		super(blogCommentDao);
		this.blogCommentDao = blogCommentDao;
	}

    @Override
	public List<BlogComment> list(BlogCommentQuery query) {
		return blogCommentDao.list(query);
	}

    @Override
	public Page<BlogComment> search(BlogCommentQuery query) {
		return blogCommentDao.search(query);
	}

}