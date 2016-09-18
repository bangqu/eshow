package cn.org.eshow.webapp.action.response;

import cn.org.eshow.model.Category;

import java.util.Date;

/**
 * 博文分类返回对象
 *
 * @author leida
 */

public class CategoryResponse {


    private Integer id;// 分类ID
    private Date addTime;// 添加时间
    private Date updateTime;// 更新时间
    private String name;// 名称
    private String remark;// 注释
    private Integer sequence;// 序号
    private String website;// 网站


    public CategoryResponse(Category category) {
        this.id = category.getId();
        this.addTime = category.getAddTime();
        this.updateTime = category.getUpdateTime();
        this.name = category.getName();
        this.remark = category.getRemark();
        this.sequence = category.getSequence();
        this.website = category.getWebsite();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }
}
