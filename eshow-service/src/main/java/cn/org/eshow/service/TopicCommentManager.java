package cn.org.eshow.service;

import cn.org.eshow.bean.query.TopicCommentQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.TopicComment;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface TopicCommentManager extends GenericManager<TopicComment, Integer> {

	/**
	 *
	 * @param query
	 * @return
     */
	List<TopicComment> list(TopicCommentQuery query);

	/**
	 *
	 * @param query
	 * @return
     */
	Page<TopicComment> search(TopicCommentQuery query);
}