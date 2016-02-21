package cn.org.eshow.service;

import java.util.List;

import cn.org.eshow.bean.query.PhotoQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Photo;
import cn.org.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface PhotoManager extends GenericManager<Photo, Integer> {

    List<Photo> list(PhotoQuery query);

    Page<Photo> search(PhotoQuery query);
}