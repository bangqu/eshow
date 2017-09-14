package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.TopicQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Topic;
import cn.org.eshow.model.User;
import cn.org.eshow.service.BoardManager;
import cn.org.eshow.service.TopicManager;
import cn.org.eshow.util.JacksonUtil;
import cn.org.eshow.webapp.action.response.TopicResponse;
import cn.org.eshow.webapp.util.RenderUtil;
import cn.org.eshow.webapp.util.Struts2Utils;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 话题API接口
 */
@AllowedMethods({"search", "delete", "view", "update", "save"})
public class TopicAction extends ApiBaseAction<Topic> {

    private static final long serialVersionUID = 1L;

    @Autowired
    private TopicManager topicManager;
    @Autowired
    private BoardManager boardManager;

    private List<Topic> topics;
    private Topic topic;
    private TopicQuery query;
    private Integer boardId;

    /**
     *
     */
    public void search() {
        Page<Topic> page = topicManager.search(query);
        topics = page.getDataList();
        if (topics.isEmpty()) {
            RenderUtil.failure("暂无数据");
            return;
        }
        List<TopicResponse> responses = new ArrayList<TopicResponse>();
        for (Topic obj : topics) {
            TopicResponse response = new TopicResponse(obj);
            responses.add(response);
        }
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "获取成功" + "\",\"" + "topics" + "\":" + JacksonUtil.toJson(responses) + "}");
    }

    /**
     *
     */
    public void delete() {
        User user = accessTokenManager.isValid(accessToken);//获取当前用户
        Topic old = topicManager.get(id);
        if (old == null) {
            RenderUtil.failure("非法参数");
            return;
        }
        if (!old.getUser().getId().equals(user.getId())) {
            RenderUtil.failure("无权删除");
            return;
        }
        if (old.getCommentSize() == 0) {
            topicManager.remove(id);
            RenderUtil.success("删除成功");
        }
    }

    /**
     *
     */
    public void view() {
        if (id == null) {
            RenderUtil.failure("非法参数");
            return;
        }
        topic = topicManager.get(id);
        topic.setCount(topic.getCount() + CommonVar.STEP);
        topic = topicManager.save(topic);
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "获取成功" + "\",\"" + "topic" + "\":" + JacksonUtil.toJson(new TopicResponse(topic)) + "}");
    }

    /**
     * @throws Exception
     */
    public void update() throws Exception {
        Topic old = topicManager.get(id);
        old.setUpdateTime(new Date());
        old.setTitle(topic.getTitle());
        old.setContent(topic.getContent());
        if (boardId != null) {
            old.setBoard(boardManager.get(boardId));
        }
        topicManager.save(old);
        RenderUtil.success("修改成功");
    }

    /**
     * @throws Exception
     */
    public void save() throws Exception {
        User user = accessTokenManager.isValid(accessToken);//获取当前用户
        if (boardId != null) {
            topic.setBoard(boardManager.get(boardId));
        }
        topic.setUser(user);
        topic = topicManager.save(topic);
        RenderUtil.success("添加成功");
    }

    public List<Topic> getTopics() {
        return topics;
    }

    public void setTopics(List<Topic> topics) {
        this.topics = topics;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public TopicQuery getQuery() {
        return query;
    }

    public void setQuery(TopicQuery query) {
        this.query = query;
    }

    public Integer getBoardId() {
        return boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

}