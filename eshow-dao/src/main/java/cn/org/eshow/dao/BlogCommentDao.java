package cn.org.eshow.dao;

import java.util.List;

import cn.org.eshow.bean.query.BlogCommentQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.GenericDao;
import cn.org.eshow.model.BlogComment;

/**
 * An interface that provides a data management interface to the BlogComment table.
 */
public interface BlogCommentDao extends GenericDao<BlogComment, Integer> {

	List<BlogComment> list(BlogCommentQuery query);

	Page<BlogComment> search(BlogCommentQuery query);
}