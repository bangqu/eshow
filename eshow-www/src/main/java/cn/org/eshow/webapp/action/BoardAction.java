package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.BoardQuery;
import cn.org.eshow.bean.query.TopicQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Board;
import cn.org.eshow.model.Topic;
import cn.org.eshow.service.BoardManager;
import cn.org.eshow.service.TopicManager;
import cn.org.eshow.util.PageUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

/**
 *
 */
@Results({ @Result(name = "input", location = "add"),
		@Result(name = "list", type = "redirect", location = ""),
		@Result(name = "success", type = "redirect", location = "view/${id}"),
		@Result(name = "redirect", type = "redirect", location = "${redirect}") })
@AllowedMethods({"list", "search", "delete", "view", "update", "save"})
public class BoardAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	@Autowired
	private BoardManager boardManager;
	@Autowired
	private TopicManager topicManager;

	private List<Board> boards;
	private Board board;
	private BoardQuery query;

	/**
	 *
	 * @return
     */
	public String list() {
		boards = boardManager.list(query);
		return LIST;
	}

	/**
	 *
	 * @return
     */
	public String search() {
		Page<Board> page = boardManager.search(query);
		boards = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	/**
	 *
	 * @return
     */
	public String delete() {
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
			saveMessage("删除成功");
		}
		return LIST;
	}

	/**
	 *
	 * @return
     */
	public String view() {
		if (id != null) {
			board = boardManager.get(id);
		} else {
			return INDEX;
		}
		return NONE;
	}

	/**
	 *
	 * @return
	 * @throws Exception
     */
	public String update() throws Exception {
		Board old = boardManager.get(id);
		old.setName(board.getName());
		old.setDescription(board.getDescription());
		boardManager.save(old);
		saveMessage("修改成功");
		return LIST;
	}

	/**
	 *
	 * @return
	 * @throws Exception
     */
	public String save() throws Exception {
		board.setAddTime(new Date());
		boardManager.save(board);
		saveMessage("添加成功");
		return LIST;
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