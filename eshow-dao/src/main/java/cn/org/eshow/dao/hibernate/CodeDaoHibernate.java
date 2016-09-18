package cn.org.eshow.dao.hibernate;

import cn.org.eshow.bean.query.CodeQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.CodeDao;
import cn.org.eshow.model.Code;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("codeDao")
public class CodeDaoHibernate extends GenericDaoHibernate<Code, Integer> implements CodeDao {

	public CodeDaoHibernate() {
		super(Code.class);
	}

	public Page<Code> search(CodeQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		if (query != null) {
			rule.setOffset(query.getOffset());
			rule.setPageSize(query.pagesize);
		}
		return page(rule);
	}

	public List<Code> list(CodeQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		return list(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, CodeQuery query) {
		if (query != null) {
			if (query.type != null) {
				rule.add(Restrictions.like("type", query.type,
                        MatchMode.ANYWHERE));
			}
            if (query.email != null) {
                rule.add(Restrictions.like("email", query.email,
                        MatchMode.ANYWHERE));
            }
			if (query.code != null) {
				rule.add(Restrictions.eq("code", query.code));
			}
			if (query.userId != null) {
				rule.add(Restrictions.eq("user.id", query.userId));
			}
            if (query.state != null) {
                rule.add(Restrictions.eq("state", query.state));
            }
			if (query.enabled != null) {
				rule.add(Restrictions.eq("enabled", query.enabled));
			}
			if (query.getOrder() != null) {
				rule.addOrder(query.getDesc() ? Order.desc(query.getOrder()) : Order.asc(query.getOrder()));
			}
		}
		return rule;
	}
}
