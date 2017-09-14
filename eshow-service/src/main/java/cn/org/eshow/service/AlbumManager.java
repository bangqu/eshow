package cn.org.eshow.service;

import cn.org.eshow.bean.query.AlbumQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Album;
import cn.org.eshow.model.User;

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

    /**
     * 添加相册信息
     *
     * @param album  相册信息
     * @param photos 照片数组
     * @return Album
     */
    Album save(Album album, User user, String[] photos);

    /**
     * 更改相册是否可用
     *
     * @param album
     * @return Album
     */
    Album enabled(Album album);

}