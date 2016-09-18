package cn.org.eshow.service;

import cn.org.eshow.bean.query.AlbumQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Album;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface AlbumManager extends GenericManager<Album, Integer> {

    /**
     * @param query
     * @return
     */
    List<Album> list(AlbumQuery query);

    /**
     * @param query
     * @return
     */
    Page<Album> search(AlbumQuery query);

}