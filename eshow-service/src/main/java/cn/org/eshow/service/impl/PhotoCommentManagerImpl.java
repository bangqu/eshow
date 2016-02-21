package cn.org.eshow.service.impl;

import java.util.List;

import cn.org.eshow.bean.query.PhotoCommentQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.PhotoCommentDao;
import cn.org.eshow.model.PhotoComment;
import cn.org.eshow.service.PhotoCommentManager;
import cn.org.eshow.service.impl.GenericManagerImpl;

import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@WebService(serviceName = "PhotoCommentService", endpointInterface = "cn.org.eshow.service.PhotoCommentManager")
@Service
public class PhotoCommentManagerImpl extends GenericManagerImpl<PhotoComment, Integer> implements
		PhotoCommentManager {
	@Autowired
	PhotoCommentDao photoCommentDao;

	@Autowired
	public PhotoCommentManagerImpl(PhotoCommentDao photoCommentDao) {
		super(photoCommentDao);
		this.photoCommentDao = photoCommentDao;
	}

    @Override
	public List<PhotoComment> list(PhotoCommentQuery query) {
		return photoCommentDao.list(query);
	}

    @Override
	public Page<PhotoComment> search(PhotoCommentQuery query) {
		return photoCommentDao.search(query);
	}

}