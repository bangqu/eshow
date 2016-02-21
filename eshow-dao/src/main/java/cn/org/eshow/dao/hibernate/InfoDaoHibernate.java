package cn.org.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import cn.org.eshow.bean.query.InfoQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.InfoDao;
import cn.org.eshow.dao.hibernate.GenericDaoHibernate;
import cn.org.eshow.model.Info;

@Repository("infoDao")
public class InfoDaoHibernate extends GenericDaoHibernate<Info, Integer> implements InfoDao {

	public InfoDaoHibernate() {
		super(Info.class);
	}

	public List<Info> list(InfoQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		return list(rule);
	}

	public Page<Info> search(InfoQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		if (query != null) {
			rule.setOffset(query.getOffset());
			rule.setPageSize(query.pagesize);
		}
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, InfoQuery query) {
		if (query != null) {
			if (query.type != null) {
				rule.add(Restrictions.like("type", query.type, MatchMode.ANYWHERE));
			}
			if (query.url != null) {
				rule.add(Restrictions.like("url", query.url, MatchMode.ANYWHERE));
			}
			if (query.title != null) {
				rule.add(Restrictions.like("title", query.title, MatchMode.ANYWHERE));
			}
			
			if (query.content != null) {
				rule.add(Restrictions.like("content", query.content, MatchMode.ANYWHERE));
			}
			if (query.website != null) {
				rule.add(Restrictions.like("website", query.website,MatchMode.ANYWHERE));
			}
			if (query.enabled != null) {
				rule.add(Restrictions.eq("enabled", query.enabled));
			}

			if (query.getOrder() != null) {
				rule.addOrder(query.getDesc() ? Order.desc(query.getOrder()) : Order.asc(query
						.getOrder()));
			}
		}
		return rule;
	}

}
