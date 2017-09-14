package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.PhotoQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Photo;
import cn.org.eshow.service.PhotoManager;
import cn.org.eshow.util.PageUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Results({@Result(name = "input", location = "add"),
        @Result(name = "list", type = "redirect", location = ""),
        @Result(name = "success", type = "redirect", location = "view/${id}"),
        @Result(name = "redirect", type = "redirect", location = "${redirect}")})
@AllowedMethods({"list", "search", "delete", "view", "update", "save"})
public class PhotoAction extends BaseAction {

    private static final long serialVersionUID = 1L;

    @Autowired
    private PhotoManager photoManager;

    private List<Photo> photos;
    private Photo photo;
    private PhotoQuery query = new PhotoQuery();
    private Integer albumId;

    /**
     *
     * @return
     */
    public String search() {
        Page<Photo> page = photoManager.search(query);
        photos = page.getDataList();
        saveRequest("page", PageUtil.conversion(page));
        return LIST;
    }

    /**
     *
     * @return
     */
    public String view() {
        if (id != null) {
            photo = photoManager.get(id);
        }
        return NONE;
    }

    public List<Photo> getPhotos() {
        return photos;
    }

    public void setPhotos(List<Photo> photos) {
        this.photos = photos;
    }

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }

    public PhotoQuery getQuery() {
        return query;
    }

    public void setQuery(PhotoQuery query) {
        this.query = query;
    }

    public Integer getAlbumId() {
        return albumId;
    }

    public void setAlbumId(Integer albumId) {
        this.albumId = albumId;
    }

}