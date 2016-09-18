package cn.org.eshow.service;

import cn.org.eshow.bean.query.TopicQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Topic;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface TopicManager extends GenericManager<Topic, Integer> {

	/**
	 *
	 * @param query
	 * @return
     */
	List<Topic> list(TopicQuery query);

	/**
	 *
	 * @param query
	 * @return
     */
	Page<Topic> search(TopicQuery query);
}
