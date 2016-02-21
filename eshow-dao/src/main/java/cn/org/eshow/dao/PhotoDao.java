package cn.org.eshow.dao;


import java.util.List;
import cn.org.eshow.bean.query.PhotoQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.GenericDao;
import cn.org.eshow.model.Photo;


/**
 * An interface that provides a data management interface to the Photo table.
 */
public interface PhotoDao extends GenericDao<Photo, Integer> {
	
	List<Photo> list(PhotoQuery query);
	
	Page<Photo> search(PhotoQuery query);
}