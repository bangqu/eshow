package cn.org.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import cn.org.eshow.bean.query.CategoryQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.CategoryDao;
import cn.org.eshow.dao.hibernate.GenericDaoHibernate;
import cn.org.eshow.model.Category;

@Repository("categoryDao")
public class CategoryDaoHibernate extends GenericDaoHibernate<Category, Integer> implements
		CategoryDao {

	public CategoryDaoHibernate() {
		super(Category.class);
	}

	public List<Category> list(CategoryQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		return list(rule);
	}

	public Page<Category> search(CategoryQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		if (query != null) {
			rule.setOffset(query.getOffset());
			rule.setPageSize(query.pagesize);
		}
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, CategoryQuery query) {
		if (query != null) {

			if (query.addTime != null) {
				rule.add(Restrictions.le("addTime", query.addTime));
			}
			if (query.updateTime != null) {
				rule.add(Restrictions.le("updateTime", query.updateTime));
			}
			if (query.name != null) {
				rule.add(Restrictions.eq("name", query.name));
			}
			if (query.remark != null) {
				rule.add(Restrictions.eq("remark", query.remark));
			}
            if (query.website != null) {
                rule.add(Restrictions.eq("website", query.website));
            }
			if (query.sequence != null) {
				rule.add(Restrictions.eq("sequence", query.sequence));
			}
			if (query.getOrder() != null) {
				rule.addOrder(query.getDesc() ? Order.desc(query.getOrder()) : Order.asc(query
						.getOrder()));
			}
		}
		return rule;
	}
}
