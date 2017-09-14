package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.AlbumQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Album;
import cn.org.eshow.service.AlbumManager;
import cn.org.eshow.util.PageUtil;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * 相册Action类
 */
@Results({@Result(name = "input", location = "add"),
        @Result(name = "list", type = "redirect", location = ""),
        @Result(name = "success", type = "redirect", location = "view/${id}"),
        @Result(name = "redirect", type = "redirect", location = "${redirect}")})
@AllowedMethods({"list", "search", "delete", "view", "update", "save"})
public class AlbumAction extends BaseAction {

    private static final long serialVersionUID = 4663487175099570373L;

    @Autowired
    private AlbumManager albumManager;

    private List<Album> albums;
    private Album album;
    private AlbumQuery query;

    /**
     * 获取相册列表
     *
     * @return
     */
    public String list() {
        albums = albumManager.list(query);
        return LIST;
    }

    /**
     * 搜索相册列表
     *
     * @return
     */
    public String search() {
        Page<Album> page = albumManager.search(query);
        albums = page.getDataList();
        saveRequest("page", PageUtil.conversion(page));
        return LIST;
    }

    /**
     * 删除相册信息
     */
    public void delete() {
        album = albumManager.get(id);
        if (album == null) {
            RenderUtil.failure("非法参数");
            return;
        }
        if (!album.getUser().equals(getSessionUser())) {
            RenderUtil.failure("删除失败");
            return;
        }
        albumManager.enabled(album);
        RenderUtil.success("删除成功");
    }

    /**
     * 获取相册信息
     *
     * @return
     */
    public String view() {
        if (id != null) {
            album = albumManager.get(id);
        }
        return NONE;
    }

    /**
     * 修改相册信息
     *
     * @return
     * @throws Exception
     */
    public String update() throws Exception {
        Album old = albumManager.get(id);
        old.setName(album.getName() != null ? album.getName() : old.getName());
        old.setImg(album.getImg() != null ? album.getImg() : old.getImg());
        old.setDescription(album.getDescription() != null ? album.getDescription() : old.getDescription());
        albumManager.save(old);
        saveMessage("修改成功");
        return REDIRECT;
    }

    /**
     * 保存相册信息
     *
     * @return
     * @throws Exception
     */
    public String save() throws Exception {
        if (StringUtils.isEmpty(album.getName())) {
            album.setName(null);
        }
        if (StringUtils.isEmpty(album.getDescription())) {
            album.setDescription(null);
        }
        if (StringUtils.isEmpty(album.getImg())) {
            album.setImg(null);
        }
        album.setUser(getSessionUser());
        album = albumManager.save(album);
        saveMessage("添加成功");
        id = album.getId();
        return REDIRECT;
    }

    public List<Album> getAlbums() {
        return albums;
    }

    public void setAlbums(List<Album> albums) {
        this.albums = albums;
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public AlbumQuery getQuery() {
        return query;
    }

    public void setQuery(AlbumQuery query) {
        this.query = query;
    }

}