package cn.org.eshow.dao;

import java.util.List;

import cn.org.eshow.bean.query.PhotoCommentQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.GenericDao;
import cn.org.eshow.model.PhotoComment;

/**
 * An interface that provides a data management interface to the PhotoComment table.
 */
public interface PhotoCommentDao extends GenericDao<PhotoComment, Integer> {

	List<PhotoComment> list(PhotoCommentQuery query);

	Page<PhotoComment> search(PhotoCommentQuery query);
}