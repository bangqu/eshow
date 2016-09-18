package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.AlbumQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Album;
import cn.org.eshow.model.Photo;
import cn.org.eshow.model.User;
import cn.org.eshow.service.AccessTokenManager;
import cn.org.eshow.service.AlbumManager;
import cn.org.eshow.service.PhotoManager;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 接口
 */
@AllowedMethods({"search", "list", "save"})
public class AlbumAction extends ApiBaseAction<Album> {

    private static final long serialVersionUID = 4663487175099570373L;

    @Autowired
    private AlbumManager albumManager;
    @Autowired
    private AccessTokenManager accessTokenManager;
    @Autowired
    private PhotoManager photoManager;

    private Album album = new Album();
    private List<Album> albums = new ArrayList<Album>();
    private AlbumQuery query = new AlbumQuery();
    private String[] photos;

    public void search() {
        Page<Album> page = albumManager.search(query);
        albums = page.getDataList();
        page("albums", "获取成功", page, albums);
    }

    public void list() {
        albums = albumManager.list(query);
        list("albums", "获取成功", albums);
    }

    public void save() {
        User old = isValid(accessToken, accessTokenManager);
        if (old == null) {
            expires();//用户信息过期
            return;
        }
        album.setAddTime(new Date());
        album.setEnabled(true);
        album.setUser(old);
        album = albumManager.save(album);
        if (photos != null && photos.length > 0) {
            for (int i = 0; i < photos.length; i++) {
                Photo photo = new Photo();
                photo.setAddTime(new Date());
                photo.setImg(photos[i]);
                photo.setEnabled(true);
                photo.setUser(old);
                photo.setAlbum(album);
                photoManager.save(photo);
            }
        }
        success("保存成功");
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public List<Album> getAlbums() {
        return albums;
    }

    public void setAlbums(List<Album> albums) {
        this.albums = albums;
    }

    public AlbumQuery getQuery() {
        return query;
    }

    public void setQuery(AlbumQuery query) {
        this.query = query;
    }

    public String[] getPhotos() {
        return photos;
    }

    public void setPhotos(String[] photos) {
        this.photos = photos;
    }
}