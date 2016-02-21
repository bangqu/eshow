package cn.org.eshow.service.impl;

import java.util.List;

import cn.org.eshow.bean.query.AlbumQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.AlbumDao;
import cn.org.eshow.model.Album;
import cn.org.eshow.service.AlbumManager;
import cn.org.eshow.service.impl.GenericManagerImpl;

import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@WebService(serviceName = "AlbumService", endpointInterface = "cn.org.eshow.service.AlbumManager")
@Service
public class AlbumManagerImpl extends GenericManagerImpl<Album, Integer> implements AlbumManager {

	@Autowired
	AlbumDao albumDao;

	@Autowired
	public AlbumManagerImpl(AlbumDao albumDao) {
		super(albumDao);
		this.albumDao = albumDao;
	}

    @Override
	public List<Album> list(AlbumQuery query) {
		return albumDao.list(query);
	}

    @Override
	public Page<Album> search(AlbumQuery query) {
		return albumDao.search(query);
	}

}