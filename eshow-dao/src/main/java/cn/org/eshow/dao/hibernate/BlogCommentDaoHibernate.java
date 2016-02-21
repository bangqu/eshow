package cn.org.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import cn.org.eshow.bean.query.BlogCommentQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.BlogCommentDao;
import cn.org.eshow.dao.hibernate.GenericDaoHibernate;
import cn.org.eshow.model.BlogComment;

@Repository("blogCommentDao")
public class BlogCommentDaoHibernate extends GenericDaoHibernate<BlogComment, Integer> implements
		BlogCommentDao {

	public BlogCommentDaoHibernate() {
		super(BlogComment.class);
	}

	public List<BlogComment> list(BlogCommentQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		return list(rule);
	}

	public Page<BlogComment> search(BlogCommentQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		if (query != null) {
			rule.setOffset(query.getOffset());
			rule.setPageSize(query.pagesize);
		}
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, BlogCommentQuery query) {
		if (query != null) {
			if (query.name != null) {
				rule.add(Restrictions.like("name", query.name, MatchMode.ANYWHERE));
			}
			if (query.content != null) {
				rule.add(Restrictions.like("content", query.content, MatchMode.ANYWHERE));
			}
			if (query.email != null) {
				rule.add(Restrictions.like("email", query.email, MatchMode.ANYWHERE));
			}
			if (query.im != null) {
				rule.add(Restrictions.like("im", query.im, MatchMode.ANYWHERE));
			}
			if (query.ip != null) {
				rule.add(Restrictions.like("ip", query.ip, MatchMode.ANYWHERE));
			}
			if (query.website != null) {
				rule.add(Restrictions.like("website", query.website, MatchMode.ANYWHERE));
			}
			if (query.userId != null) {
				rule.add(Restrictions.eq("user.id", query.userId));
			}
			if (query.blogId != null) {
				rule.add(Restrictions.eq("blog.id", query.blogId));
			}
			if (query.getOrder() != null) {
				rule.addOrder(query.getDesc() ? Order.desc(query.getOrder()) : Order.asc(query
						.getOrder()));
			}
		}
		return rule;
	}
}
