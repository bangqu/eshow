package cn.org.eshow.service.impl;

import cn.org.eshow.bean.query.TopicCommentQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.TopicCommentDao;
import cn.org.eshow.model.TopicComment;
import cn.org.eshow.service.TopicCommentManager;
import cn.org.eshow.service.impl.GenericManagerImpl;

import java.util.List;
import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@WebService(serviceName = "TopicCommentService", endpointInterface = "cn.org.eshow.service.TopicCommentManager")
@Service
public class TopicCommentManagerImpl extends GenericManagerImpl<TopicComment, Integer> implements TopicCommentManager {

	@Autowired
	TopicCommentDao topicCommentDao;

	@Autowired
	public TopicCommentManagerImpl(TopicCommentDao topicCommentDao) {
		super(topicCommentDao);
		this.topicCommentDao = topicCommentDao;
	}

	public List<TopicComment> list(TopicCommentQuery query) {
		return topicCommentDao.list(query);
	}

	public Page<TopicComment> search(TopicCommentQuery query) {
		return topicCommentDao.search(query);
	}

}