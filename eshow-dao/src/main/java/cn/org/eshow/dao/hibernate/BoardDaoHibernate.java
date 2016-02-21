package cn.org.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import cn.org.eshow.bean.query.BoardQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.BoardDao;
import cn.org.eshow.dao.hibernate.GenericDaoHibernate;
import cn.org.eshow.model.Board;

@Repository("boardDao")
public class BoardDaoHibernate extends GenericDaoHibernate<Board, Integer> implements BoardDao {

	public BoardDaoHibernate() {
		super(Board.class);
	}

	public List<Board> list(BoardQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		return list(rule);
	}

	public Page<Board> search(BoardQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		if (query != null) {
			rule.setOffset(query.getOffset());
			rule.setPageSize(query.pagesize);
		}
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, BoardQuery query) {
		if (query != null) {
			if (query.addTime != null) {
				rule.add(Restrictions.eq("addTime", query.addTime));
			}
			if (query.name != null) {
				rule.add(Restrictions.eq("name", query.name));
			}
			if (query.description != null) {
				rule.add(Restrictions.eq("description", query.description));
			}
			if (query.sequence != null) {
				rule.add(Restrictions.eq("sequence", query.sequence));
			}
		}
		return rule;
	}
}
