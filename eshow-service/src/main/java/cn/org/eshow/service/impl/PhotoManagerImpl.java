package cn.org.eshow.service.impl;

import java.util.List;

import cn.org.eshow.bean.query.PhotoQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.PhotoDao;
import cn.org.eshow.model.Photo;
import cn.org.eshow.model.User;
import cn.org.eshow.service.PhotoManager;
import cn.org.eshow.service.impl.GenericManagerImpl;

import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@WebService(serviceName = "PhotoService", endpointInterface = "cn.org.eshow.service.PhotoManager")
@Service
public class PhotoManagerImpl extends GenericManagerImpl<Photo, Integer> implements PhotoManager {

    @Autowired
    PhotoDao photoDao;

    @Autowired
    public PhotoManagerImpl(PhotoDao photoDao) {
        super(photoDao);
        this.photoDao = photoDao;
    }

    @Override
    public List<Photo> list(PhotoQuery query) {
        return photoDao.list(query);
    }

    @Override
    public Page<Photo> search(PhotoQuery query) {
        return photoDao.search(query);
    }

    @Override
    public Photo save(Photo photo, String img, User user) {
        photo.setImg(img);
        photo.setUser(user);
        return photoDao.save(photo);
    }
}