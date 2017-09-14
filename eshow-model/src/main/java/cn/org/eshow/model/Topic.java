package cn.org.eshow.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 话题表
 *
 * @author leida
 */
@Entity
@Table(name = "topic")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Topic extends BaseObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;//话题ID

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;//用户

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
    @JoinColumn(name = "board_id")
    private Board board;//板块

    @Column(name = "add_time")
    private Date addTime = new Date();//添加时间

    @Column(name = "update_time")
    private Date updateTime = new Date();//更新时间

    @Column
    private String title;//标题

    @Column
    private String content;//内容

    @Column
    private Integer count = 0; // 浏览次数

    @Column(name = "comment_size")
    private Integer commentSize = 0; // 回复次数

    @Column(name = "recommend_size")
    private Integer recommendSize = 0; // 推荐次数

    @Column
    private Boolean top = Boolean.FALSE; //是否置顶

    @Column(length = 20)
    private String website;//网站

    @Column
    private Boolean enabled = Boolean.TRUE;//是否可用

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "topic")
    private Set<TopicComment> topicComments = new HashSet<TopicComment>(0);

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Board getBoard() {
        return board;
    }

    public void setBoard(Board board) {
        this.board = board;
    }

    public Date getAddTime() {
        return this.addTime;
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

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public Set<TopicComment> getTopicComments() {
        return topicComments;
    }

    public void setTopicComments(Set<TopicComment> topicComments) {
        this.topicComments = topicComments;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Topic topic = (Topic) o;

        if (id != null ? !id.equals(topic.id) : topic.id != null) return false;
        if (user != null ? !user.equals(topic.user) : topic.user != null) return false;
        if (board != null ? !board.equals(topic.board) : topic.board != null) return false;
        if (addTime != null ? !addTime.equals(topic.addTime) : topic.addTime != null) return false;
        if (updateTime != null ? !updateTime.equals(topic.updateTime) : topic.updateTime != null) return false;
        if (title != null ? !title.equals(topic.title) : topic.title != null) return false;
        if (content != null ? !content.equals(topic.content) : topic.content != null) return false;
        if (count != null ? !count.equals(topic.count) : topic.count != null) return false;
        if (commentSize != null ? !commentSize.equals(topic.commentSize) : topic.commentSize != null) return false;
        if (recommendSize != null ? !recommendSize.equals(topic.recommendSize) : topic.recommendSize != null)
            return false;
        if (top != null ? !top.equals(topic.top) : topic.top != null) return false;
        if (website != null ? !website.equals(topic.website) : topic.website != null) return false;
        if (enabled != null ? !enabled.equals(topic.enabled) : topic.enabled != null) return false;
        return topicComments != null ? topicComments.equals(topic.topicComments) : topic.topicComments == null;

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (board != null ? board.hashCode() : 0);
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (count != null ? count.hashCode() : 0);
        result = 31 * result + (commentSize != null ? commentSize.hashCode() : 0);
        result = 31 * result + (recommendSize != null ? recommendSize.hashCode() : 0);
        result = 31 * result + (top != null ? top.hashCode() : 0);
        result = 31 * result + (website != null ? website.hashCode() : 0);
        result = 31 * result + (enabled != null ? enabled.hashCode() : 0);
        result = 31 * result + (topicComments != null ? topicComments.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this)
                .append("id", id)
                .append("user", user)
                .append("board", board)
                .append("addTime", addTime)
                .append("updateTime", updateTime)
                .append("title", title)
                .append("content", content)
                .append("count", count)
                .append("commentSize", commentSize)
                .append("recommendSize", recommendSize)
                .append("top", top)
                .append("website", website)
                .append("enabled", enabled)
                .append("topicComments", topicComments)
                .toString();
    }
}
