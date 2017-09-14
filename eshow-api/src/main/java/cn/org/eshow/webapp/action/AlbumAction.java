package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.AlbumQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Album;
import cn.org.eshow.model.User;
import cn.org.eshow.service.AlbumManager;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * 相册API接口
 */
@AllowedMethods({"search", "list", "save"})
public class AlbumAction extends ApiBaseAction<Album> {

    private static final long serialVersionUID = 4663487175099570373L;

    @Autowired
    private AlbumManager albumManager;


    private Album album = new Album();
    private List<Album> albums = new ArrayList<Album>();
    private AlbumQuery query = new AlbumQuery();
    private String[] photos;

    /**
     * 搜索相册列表
     */
    public void list() {
        albums = albumManager.list(query);
        RenderUtil.list("获取成功", "albums", albums);
    }

    /**
     * 搜索相册列表
     */
    public void search() {
        Page<Album> page = albumManager.search(query);
        albums = page.getDataList();
        RenderUtil.page("获取成功", "albums", page, albums);
    }

    /**
     * 添加相册信息
     */
    public void save() {
        User old = accessTokenManager.isValid(accessToken);
        if (old == null) {
            RenderUtil.expires();//用户信息过期
            return;
        }
        album = albumManager.save(album, old, photos);
        RenderUtil.success("保存成功");
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