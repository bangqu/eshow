package cn.org.eshow.dao;

import java.util.List;

import cn.org.eshow.bean.query.TopicQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.GenericDao;
import cn.org.eshow.model.Topic;

/**
 * An interface that provides a data management interface to the Topic table.
 */
public interface TopicDao extends GenericDao<Topic, Integer> {

	List<Topic> list(TopicQuery query);

	Page<Topic> search(TopicQuery query);
}