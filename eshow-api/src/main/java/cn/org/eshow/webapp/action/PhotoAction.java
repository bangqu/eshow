package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.PhotoQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Photo;
import cn.org.eshow.model.User;
import cn.org.eshow.service.AccessTokenManager;
import cn.org.eshow.service.PhotoManager;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * 照片API接口
 */
@AllowedMethods({"search", "delete", "view", "save", "update"})
public class PhotoAction extends ApiBaseAction<Photo> {

    private static final long serialVersionUID = 1L;

    @Autowired
    private PhotoManager photoManager;

    private Photo photo;
    private List<Photo> photos = new ArrayList<Photo>();
    private PhotoQuery query = new PhotoQuery();

    /**
     * 搜索照片列表
     */
    public void search() {
        Page<Photo> page = photoManager.search(query);
        photos = page.getDataList();
        RenderUtil.page("获取成功", "photos", page, photos);
    }

    /**
     *
     */
    public void delete() {
        User user = accessTokenManager.isValid(accessToken);
        if (user == null) {
            RenderUtil.expires();//用户信息过期
            return;
        }
        if (id != null) {
            RenderUtil.failure("参数异常");
            return;
        }
        Photo old = photoManager.get(id);
        old.setEnabled(false);
        photoManager.save(old);
        RenderUtil.success("删除成功");
    }

    /**
     *
     */
    public void view() {
        photo = photoManager.get(id);
        if (id == null) {
            RenderUtil.failure("非法参数");
        }
        RenderUtil.success("获取成功", photo);
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