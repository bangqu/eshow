package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * Blog 查询Bean
 *
 * @author leida
 */
public class BlogQuery extends BaseQuery {

    public Date addTime;//
    public Date updateTime;//
    public String title;//
    public String keyword;//
    public Boolean hasKeyword;//
    public Boolean hasImg;//
    public String content;//
    public String img;//
    public String website;//
    public Integer count;//
    public Boolean enabled;//
    public Integer userId;//
    public Integer categoryId;//

    public BlogQuery() {
    }


    public BlogQuery(Boolean enabled) {
        this.enabled = enabled;
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

    public Boolean getHasKeyword() {
        return hasKeyword;
    }

    public void setHasKeyword(Boolean hasKeyword) {
        this.hasKeyword = hasKeyword;
    }

    public Boolean getHasImg() {
        return hasImg;
    }

    public void setHasImg(Boolean hasImg) {
        this.hasImg = hasImg;
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

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }


}