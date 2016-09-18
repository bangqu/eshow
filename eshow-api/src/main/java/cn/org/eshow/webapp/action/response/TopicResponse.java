package cn.org.eshow.webapp.action.response;

import cn.org.eshow.model.Topic;

import java.util.Date;

/**
 * 主题返回对象
 *
 * @author leida
 */
public class TopicResponse {

    private Integer id;//主题ID
    private UserResponse user;//用户
    private BoardResponse board;//板块
    private Date addTime;//添加时间
    private Date updateTime;//更新时间
    private String title;//标题
    private String content;//内容
    private Integer count; // 浏览次数
    private Integer commentSize; // 回复次数
    private Integer recommendSize; // 推荐次数
    private Boolean top; //是否置顶
    private String website;//网站

    public TopicResponse(Topic topic) {
        this.id = topic.getId();
        if (topic.getUser() != null) {
            this.user = new UserResponse(topic.getUser());
        }
        if (topic.getBoard() != null) {
            this.board = new BoardResponse(topic.getBoard());
        }
        this.addTime = topic.getAddTime();
        this.updateTime = topic.getUpdateTime();
        this.title = topic.getTitle();
        this.content = topic.getContent();
        this.commentSize = topic.getCommentSize();
        this.count = topic.getCount();
        this.top = topic.getTop();
        this.website = topic.getWebsite();
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

    public BoardResponse getBoard() {
        return board;
    }

    public void setBoard(BoardResponse board) {
        this.board = board;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getCommentSize() {
        return commentSize;
    }

    public void setCommentSize(Integer commentSize) {
        this.commentSize = commentSize;
    }

    public Integer getRecommendSize() {
        return recommendSize;
    }

    public void setRecommendSize(Integer recommendSize) {
        this.recommendSize = recommendSize;
    }

    public Boolean getTop() {
        return top;
    }

    public void setTop(Boolean top) {
        this.top = top;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }
}
