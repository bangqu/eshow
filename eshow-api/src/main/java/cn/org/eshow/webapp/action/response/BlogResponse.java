package cn.org.eshow.webapp.action.response;

import java.util.Date;

/**
 * 博文表
 *
 * @author leida
 */

public class BlogResponse {


    private Integer id;
    private UserResponse user;// 作者
    private CategoryResponse category;// 关联分类
    private Date addTime;// 添加时间
    private Date updateTime;// 更新时间
    private String title;// 标题
    private String keyword;//关键字
    private String content;// 正文
    private String img;//图片
    private Integer commentSize;// 回复数
    private Integer count;// 浏览次数
    private String website;// 网站


    public BlogResponse(Blog blog) {
        this.id = blog.getId();
        this.user = new UserResponse(blog.getUser());
        this.category = new CategoryResponse(blog.getCategory());
        this.addTime = blog.getAddTime();
        this.updateTime = blog.getUpdateTime();
        this.title = blog.getTitle();
        this.keyword = blog.getKeyword();
        this.content = blog.getContent();
        this.img = blog.getImg();
        this.commentSize = blog.getCommentSize();
        this.count = blog.getCount();
        this.website = blog.getWebsite();
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

    public CategoryResponse getCategory() {
        return category;
    }

    public void setCategory(CategoryResponse category) {
        this.category = category;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
