package cn.org.eshow.service;

import java.util.List;

import cn.org.eshow.bean.query.TopicQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Topic;
import cn.org.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface TopicManager extends GenericManager<Topic, Integer> {
	
	List<Topic> list(TopicQuery query);
	
	Page<Topic> search(TopicQuery query);
}
