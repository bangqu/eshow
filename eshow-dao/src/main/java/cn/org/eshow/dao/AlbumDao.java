package cn.org.eshow.dao;

import java.util.List;

import cn.org.eshow.bean.query.AlbumQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.GenericDao;
import cn.org.eshow.model.Album;

/**
 * An interface that provides a data management interface to the Album table.
 */
public interface AlbumDao extends GenericDao<Album, Integer> {

	List<Album> list(AlbumQuery query);

	Page<Album> search(AlbumQuery query);
}