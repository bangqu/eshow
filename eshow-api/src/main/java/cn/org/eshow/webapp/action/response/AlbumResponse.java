package cn.org.eshow.webapp.action.response;

import cn.org.eshow.model.Album;

import java.util.Date;

/**
 * 相册返回对象
 *
 * @author leida
 */
public class AlbumResponse {

    private Integer id;// ID
    private UserResponse user;// 用户
    private String description;// 相册描述
    private Date addTime;//添加时间
    private Date updateTime;// 更新时间
    private String name;// 相册名称
    private String img;// 图片地址
    private Integer photoSize;// 照片的总数
    private Integer count;// 访问次数
    private String website;// 网站


    public AlbumResponse(Album album) {
        this.id = album.getId();
        this.user = new UserResponse(album.getUser());
        this.description = album.getDescription();
        this.addTime = album.getAddTime();
        this.updateTime = album.getUpdateTime();
        this.name = album.getName();
        this.img = album.getImg();
        this.photoSize = album.getPhotoSize();
        this.count = album.getCount();
        this.website = album.getWebsite();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public UserResponse getUser() {
        return user;
    }

    public void setUser(UserResponse user) {
        this.user = user;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getPhotoSize() {
        return photoSize;
    }

    public void setPhotoSize(Integer photoSize) {
        this.photoSize = photoSize;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }


}
