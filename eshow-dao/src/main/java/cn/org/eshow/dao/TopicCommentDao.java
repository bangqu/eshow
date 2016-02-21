package cn.org.eshow.dao;

import java.util.List;

import cn.org.eshow.bean.query.TopicCommentQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.GenericDao;
import cn.org.eshow.model.TopicComment;

/**
 * An interface that provides a data management interface to the TopicComment table.
 */
public interface TopicCommentDao extends GenericDao<TopicComment, Integer> {

	List<TopicComment> list(TopicCommentQuery query);

	Page<TopicComment> search(TopicCommentQuery query);
}