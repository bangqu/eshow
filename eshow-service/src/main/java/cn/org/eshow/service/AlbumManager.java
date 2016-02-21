package cn.org.eshow.service;

import java.util.List;

import cn.org.eshow.bean.query.AlbumQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Album;
import cn.org.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface AlbumManager extends GenericManager<Album, Integer> {

    /**
     *
     * @param query
     * @return
     */
	List<Album> list(AlbumQuery query);

    /**
     *
     * @param query
     * @return
     */
	Page<Album> search(AlbumQuery query);

}