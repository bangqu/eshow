package cn.org.eshow.service.impl;

import cn.org.eshow.bean.query.TopicQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.TopicDao;
import cn.org.eshow.model.Topic;
import cn.org.eshow.service.TopicManager;
import cn.org.eshow.service.impl.GenericManagerImpl;

import java.util.List;
import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@WebService(serviceName = "TopicService", endpointInterface = "cn.org.eshow.service.TopicManager")
@Service
public class TopicManagerImpl extends GenericManagerImpl<Topic, Integer> implements TopicManager {

	@Autowired
	TopicDao topicDao;

	@Autowired
	public TopicManagerImpl(TopicDao topicDao) {
		super(topicDao);
		this.topicDao = topicDao;
	}

	public List<Topic> list(TopicQuery query) {
		return topicDao.list(query);
	}

	public Page<Topic> search(TopicQuery query) {
		return topicDao.search(query);
	}
	
}