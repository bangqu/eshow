package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.PhotoQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Photo;
import cn.org.eshow.model.User;
import cn.org.eshow.service.AccessTokenManager;
import cn.org.eshow.service.PhotoManager;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * 接口
 */
@AllowedMethods({"search", "list", "delete", "view", "save", "update"})
public class PhotoAction extends BaseFileUploadAction<Photo> {

    private static final long serialVersionUID = 1L;
    @Autowired
    private PhotoManager photoManager;
    @Autowired
    private AccessTokenManager accessTokenManager;

    private Photo photo;
    private List<Photo> photos = new ArrayList<Photo>();
    private PhotoQuery query = new PhotoQuery();

    public void search() {
        Page<Photo> page = photoManager.search(query);
        photos = page.getDataList();
        page("photos", "获取成功", page, photos);
    }

    public void list() {
        photos = photoManager.list(query);
        list("albums", "获取成功", photos);
    }

    public void delete() {
        User old = isValid(accessToken, accessTokenManager);
        if (old == null) {
            expires();//用户信息过期
            return;
        }
        if (id != null) {
            Photo oldPhoto = photoManager.get(id);
            oldPhoto.setEnabled(false);
            photoManager.save(oldPhoto);
            success("删除成功");
        } else {
            failure("参数异常");
        }
    }

    public void view() {
        if (id != null) {
            photo = photoManager.get(id);
            success("获取成功", photo);
        } else {
            failure("参数异常");
        }
    }


    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }

    public List<Photo> getPhotos() {
        return photos;
    }

    public void setPhotos(List<Photo> photos) {
        this.photos = photos;
    }

    public PhotoQuery getQuery() {
        return query;
    }

    public void setQuery(PhotoQuery query) {
        this.query = query;
    }
}