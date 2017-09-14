package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * Topic 查询Bean
 *
 * @author leida
 */
public class TopicQuery extends BaseQuery {

    public Date startAddTime;//
    public Date endAddTime;
    public Date startUpdateTime;//
    public Date endUpdateTime;
    public String title;//
    public String content;//
    public Integer top;//
    public Integer userId;//
    public Integer boardId;//
    public String website;//

    public TopicQuery() {
    }

    public TopicQuery(Integer boardId) {
        this.boardId = boardId;
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

    public Integer getTop() {
        return top;
    }

    public void setTop(Integer top) {
        this.top = top;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getBoardId() {
        return boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }
}