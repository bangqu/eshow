package cn.org.eshow.service.impl;

import cn.org.eshow.bean.query.AlbumQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.AlbumDao;
import cn.org.eshow.model.Album;
import cn.org.eshow.model.Photo;
import cn.org.eshow.model.User;
import cn.org.eshow.service.AlbumManager;
import cn.org.eshow.service.PhotoManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.WebService;
import java.util.List;

@WebService(serviceName = "AlbumService", endpointInterface = "cn.org.eshow.service.AlbumManager")
@Service
public class AlbumManagerImpl extends GenericManagerImpl<Album, Integer> implements AlbumManager {

    @Autowired
    AlbumDao albumDao;
    @Autowired
    PhotoManager photoManager;

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

    @Override
    public Album save(Album album, User user, String[] photos) {
        album.setUser(user);
        album = albumDao.save(album);
        if (photos != null && photos.length > 0) {
            for (int i = 0; i < photos.length; i++) {
                photoManager.save(new Photo(album), photos[i], user);
            }
        }
        return album;
    }


    @Override
    public Album enabled(Album album) {
        album.setEnabled(!album.getEnabled());//反向设置是否可用
        return albumDao.save(album);
    }

}