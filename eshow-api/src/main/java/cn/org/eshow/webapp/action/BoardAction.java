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
import cn.org.eshow.webapp.util.Struts2Utils;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 接口
 */
@AllowedMethods({"search",  "delete", "view", "save", "update"})
public class BoardAction extends ApiBaseAction<Board> {

	private static final long serialVersionUID = 1L;

	@Autowired
	private BoardManager boardManager;
	@Autowired
	private TopicManager topicManager;

	private List<Board> boards;
	private Board board;
	private BoardQuery query;



	public void search() {
		Page<Board> page = boardManager.search(query);
		boards = page.getDataList();
		if (boards.isEmpty()) {
			failure("暂无数据");
			return;
		}
		List<BoardResponse> responses = new ArrayList<BoardResponse>();
		for (Board obj : boards) {
			BoardResponse response = new BoardResponse(obj);
			responses.add(response);
		}
		Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "获取成功" + "\",\"" + "boards" + "\":" + JacksonUtil.toJson(responses) + "}");
	}

	public void delete() {
		Board board = boardManager.get(id);
		if (board != null) {
			TopicQuery topicQuery = new TopicQuery();
			topicQuery.setBoardId(id);
			List<Topic> topics = topicManager.list(topicQuery);
			for (Topic topic : topics) {
				topic.setBoard(null);
				topicManager.save(topic);
			}
			boardManager.remove(id);
			success("删除成功");
			return;
		}
		failure("非法参数");
	}

	public void view() {
		if (id != null) {
			board = boardManager.get(id);
			Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "获取成功" + "\",\"" + "board" + "\":" + JacksonUtil.toJson(new BoardResponse(board)) + "}");
			return;
		}
		failure("非法参数");
	}

	public void update() throws Exception {
		Board old = boardManager.get(id);
		old.setName(board.getName());
		old.setDescription(board.getDescription());
		boardManager.save(old);
		success("修改成功");
	}

	public void save() throws Exception {
		board.setAddTime(new Date());
		boardManager.save(board);
		success("添加成功");
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