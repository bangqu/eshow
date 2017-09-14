package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * 通知信息查询对象
 */
public class NotificationQuery extends BaseQuery {

    public Date startAddTime;//开始添加时间
    public Date endAddTime;//结束添加时间
    public Date startUpdateTime;//开始修改时间
    public Date endUpdateTime;//结束修改时间
    public String category;//分类（系统消息，平台公告）
    public String img;//图片
    public String title;//标题
    public String content;//内容
    public String model;//模型
    public String modelVal;//模型值
    public Short state;//状态（1已读，0未读）
    public Boolean enabled;//是否可用
    public Integer userId;//用户ID

    public NotificationQuery() {
    }

    public NotificationQuery(Boolean enabled) {
        this.enabled = enabled;
    }

    public Date getStartAddTime() {
        return startAddTime;
    }

    public void setStartAddTime(Date startAddTime) {
        this.startAddTime = startAddTime;
    }

    public Date getEndAddTime() {
        return endAddTime;
    }

    public void setEndAddTime(Date endAddTime) {
        this.endAddTime = endAddTime;
    }

    public Date getStartUpdateTime() {
        return startUpdateTime;
    }

    public void setStartUpdateTime(Date startUpdateTime) {
        this.startUpdateTime = startUpdateTime;
    }

    public Date getEndUpdateTime() {
        return endUpdateTime;
    }

    public void setEndUpdateTime(Date endUpdateTime) {
        this.endUpdateTime = endUpdateTime;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getModelVal() {
        return modelVal;
    }

    public void setModelVal(String modelVal) {
        this.modelVal = modelVal;
    }

    public Short getState() {
        return state;
    }

    public void setState(Short state) {
        this.state = state;
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
}