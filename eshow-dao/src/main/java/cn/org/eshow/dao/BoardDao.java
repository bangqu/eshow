package cn.org.eshow.dao;

import java.util.List;

import cn.org.eshow.bean.query.BoardQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.GenericDao;
import cn.org.eshow.model.Board;

/**
 * An interface that provides a data management interface to the Board table.
 */
public interface BoardDao extends GenericDao<Board, Integer> {

	List<Board> list(BoardQuery query);

	Page<Board> search(BoardQuery query);
}