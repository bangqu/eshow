package cn.org.eshow.service;

import java.util.List;

import cn.org.eshow.bean.query.TopicCommentQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.TopicComment;
import cn.org.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface TopicCommentManager extends GenericManager<TopicComment, Integer> {
	
	List<TopicComment> list(TopicCommentQuery query);
	
	Page<TopicComment> search(TopicCommentQuery query);
}