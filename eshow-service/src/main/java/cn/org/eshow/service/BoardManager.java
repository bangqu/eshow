package cn.org.eshow.service;

import cn.org.eshow.bean.query.BoardQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Board;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface BoardManager extends GenericManager<Board, Integer> {

	/**
	 *
	 * @param query
	 * @return
     */
	List<Board> list(BoardQuery query);

	/**
	 *
	 * @param query
	 * @return
     */
	Page<Board> search(BoardQuery query);
}