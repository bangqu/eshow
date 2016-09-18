package cn.org.eshow.service;

import cn.org.eshow.bean.query.PhotoQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Photo;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface PhotoManager extends GenericManager<Photo, Integer> {

    /**
     *
     * @param query
     * @return
     */
    List<Photo> list(PhotoQuery query);

    /**
     *
     * @param query
     * @return
     */
    Page<Photo> search(PhotoQuery query);
}