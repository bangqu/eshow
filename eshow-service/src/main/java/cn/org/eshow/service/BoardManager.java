package cn.org.eshow.service;

import java.util.List;

import cn.org.eshow.bean.query.BoardQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Board;
import cn.org.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface BoardManager extends GenericManager<Board, Integer> {
	
	List<Board> list(BoardQuery query);

	Page<Board> search(BoardQuery query);
}