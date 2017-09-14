package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.BoardQuery;
import cn.org.eshow.bean.query.TopicQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Board;
import cn.org.eshow.model.Topic;
import cn.org.eshow.service.BoardManager;
import cn.org.eshow.service.TopicManager;
import cn.org.eshow.util.JacksonUtil;
import cn.org.eshow.webapp.action.response.BoardResponse;
import cn.org.eshow.webapp.util.RenderUtil;
import cn.org.eshow.webapp.util.Struts2Utils;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * 板块API接口
 */
@AllowedMethods({"search", "delete", "view", "save", "update"})
public class BoardAction extends ApiBaseAction<Board> {

    private static final long serialVersionUID = 1L;

    @Autowired
    private BoardManager boardManager;
    @Autowired
    private TopicManager topicManager;

    private List<Board> boards = new ArrayList<Board>();
    private Board board = new Board();
    private BoardQuery query = new BoardQuery();

    /**
     * 搜索板块列表
     */
    public void search() {
        Page<Board> page = boardManager.search(query);
        boards = page.getDataList();
        if (boards.isEmpty()) {
            RenderUtil.failure("暂无数据");
            return;
        }
        List<BoardResponse> responses = new ArrayList<BoardResponse>();
        for (Board obj : boards) {
            responses.add(new BoardResponse(obj));
        }
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "获取成功" + "\",\"" + "boards" + "\":" + JacksonUtil.toJson(responses) + "}");
    }


    /**
     * 获取板块信息
     */
    public void view() {
        board = boardManager.get(id);
        if (board == null) {
            RenderUtil.failure("非法参数");
            return;
        }
        RenderUtil.success("获取成功", "board", JacksonUtil.toJson(new BoardResponse(board)));
    }

    /**
     * 添加板块信息
     */
    public void save() {
        boardManager.save(board);
        RenderUtil.success("添加成功");
    }

    /**
     * 修改板块信息
     */
    public void update() {
        Board old = boardManager.get(id);
        if (old == null) {
            RenderUtil.failure("非法参数");
            return;
        }
        boardManager.updateBoard(old, board);
        RenderUtil.success("修改成功");
    }

    /**
     * 删除板块信息
     */
    public void delete() {
        Board board = boardManager.get(id);
        if (board == null) {
            RenderUtil.failure("非法参数");
            return;
        }
        List<Topic> topics = topicManager.list(new TopicQuery(board.getId()));
        for (Topic topic : topics) {
            topic.setBoard(null);
            topicManager.save(topic);
        }
        boardManager.updateEnabled(board);
        RenderUtil.success("删除成功");
    }

    public List<Board> getBoards() {
        return boards;
    }

    public void setBoards(List<Board> boards) {
        this.boards = boards;
    }

    public Board getBoard() {
        return board;
    }

    public void setBoard(Board board) {
        this.board = board;
    }

    public BoardQuery getQuery() {
        return query;
    }

    public void setQuery(BoardQuery query) {
        this.query = query;
    }

}