package cn.org.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import cn.org.eshow.bean.query.ProductCategoryQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.ProductCategoryDao;
import cn.org.eshow.dao.hibernate.GenericDaoHibernate;
import cn.org.eshow.model.ProductCategory;

@Repository("productCategoryDao")
public class ProductCategoryDaoHibernate extends GenericDaoHibernate<ProductCategory, Integer>
		implements ProductCategoryDao {

	public ProductCategoryDaoHibernate() {
		super(ProductCategory.class);
	}

	public List<ProductCategory> list(ProductCategoryQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		return list(rule);
	}

	public Page<ProductCategory> search(ProductCategoryQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		if (query != null) {
			rule.setOffset(query.getOffset());
			rule.setPageSize(query.pagesize);
		}
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, ProductCategoryQuery query) {

		if (query != null) {
			if (query.name != null) {
				rule.add(Restrictions.like("name", query.name, MatchMode.ANYWHERE));
			}
			if (query.description != null) {
				rule.add(Restrictions.like("description", query.description, MatchMode.ANYWHERE));
			}
			if (query.sequence != null) {
				rule.add(Restrictions.eq("sequence", query.sequence));
			}
			if (query.website != null) {
				rule.add(Restrictions.eq("website", query.website));
			}
			if (query.getOrder() != null) {
				rule.addOrder(query.getDesc() ? Order.desc(query.getOrder()) : Order.asc(query
						.getOrder()));
			}
		}
		return rule;
	}
}
