package cn.org.eshow.webapp.action.response;

import cn.org.eshow.model.Photo;

import java.util.Date;

/**
 * 图片返回对象
 */
public class PhotoResponse {

    private Integer id;//图片
    private UserResponse user;//用户
    private AlbumResponse album;//相册
    private Date addTime;//添加时间
    private String name;//名称
    private String description;//描述
    private String img;//图片
    private Integer commentSize;//评论次数
    private String website;//网站

    public PhotoResponse(Photo photo) {
        this.id = photo.getId();
        this.user = new UserResponse(photo.getUser());
        this.album = new AlbumResponse(photo.getAlbum());
        this.addTime = photo.getAddTime();
        this.name = photo.getName();
        this.description = photo.getDescription();
        this.img = photo.getImg();
        this.commentSize = photo.getCommentSize();
        this.website = photo.getWebsite();
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

    public AlbumResponse getAlbum() {
        return album;
    }

    public void setAlbum(AlbumResponse album) {
        this.album = album;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getCommentSize() {
        return commentSize;
    }

    public void setCommentSize(Integer commentSize) {
        this.commentSize = commentSize;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }
}
