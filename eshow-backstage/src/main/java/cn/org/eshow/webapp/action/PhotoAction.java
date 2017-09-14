package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.PhotoQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Album;
import cn.org.eshow.model.Photo;
import cn.org.eshow.model.User;
import cn.org.eshow.service.AlbumManager;
import cn.org.eshow.service.PhotoManager;
import cn.org.eshow.util.CommonUtil;
import cn.org.eshow.util.PageUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
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
    @Autowired
    private AlbumManager albumManager;

    private List<Photo> photos;
    private Photo photo;
    private PhotoQuery query = new PhotoQuery();
    private Integer albumId;


    /**
     * @return
     */
    public String search() {
        Page<Photo> page = photoManager.search(query);
        photos = page.getDataList();
        saveRequest("page", PageUtil.conversion(page));
        return LIST;
    }

    public String delete() {
        Photo photo = photoManager.get(id);
        if (photo.getUser().equals(getSessionUser())) {
            Album album = photo.getAlbum();
            album.setPhotoSize(album.getPhotoSize() - CommonVar.STEP);
            albumManager.save(album);
            photoManager.remove(id);
            saveMessage("删除成功");
        } else {
            saveMessage("无权删除");
        }
        return LIST;
    }

    public String view() {
        if (id != null) {
            photo = photoManager.get(id);
        }
        return NONE;
    }

    public String update() throws Exception {
        Photo old = photoManager.get(id);
        old.setName(photo.getName());
        old.setDescription(photo.getDescription());
        if (albumId != null) {
            old.setAlbum(albumManager.get(albumId));
        }
        photoManager.save(old);
        saveMessage("图片修改成功");
        return SUCCESS;

    }

    public String save() throws Exception {
        photo.setAddTime(new Date());
        Album album = albumManager.get(albumId);
        photo.setAlbum(album);
        photo.setCommentSize(CommonVar.DEFAULT);
        User user = getSessionUser();
        photo.setUser(user);

//			photo.setImg(UpYunUtil.upload(file));
        album.setPhotoSize(CommonUtil.count(album.getPhotoSize()));
        album.setUpdateTime(new Date());
        photo.setAlbum(album);

        photoManager.save(photo);
        saveMessage("新图片上传成功");
        id = photo.getId();
        return SUCCESS;
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