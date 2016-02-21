package cn.org.eshow.service;

import java.util.List;

import cn.org.eshow.bean.query.BlogCommentQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.BlogComment;

import javax.jws.WebService;

@WebService
public interface BlogCommentManager extends GenericManager<BlogComment, Integer> {

	List<BlogComment> list(BlogCommentQuery query);

	Page<BlogComment> search(BlogCommentQuery query);
}