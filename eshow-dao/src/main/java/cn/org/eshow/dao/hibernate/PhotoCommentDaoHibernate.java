package cn.org.eshow.dao.hibernate;

import cn.org.eshow.bean.query.PhotoCommentQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.PhotoCommentDao;
import cn.org.eshow.model.PhotoComment;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("photoCommentDao")
public class PhotoCommentDaoHibernate extends GenericDaoHibernate<PhotoComment, Integer> implements PhotoCommentDao {

	public PhotoCommentDaoHibernate() {
		super(PhotoComment.class);
	}

	public List<PhotoComment> list(PhotoCommentQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		return list(rule);
	}

	public Page<PhotoComment> search(PhotoCommentQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		if (query != null) {
			rule.setOffset(query.getOffset());
			rule.setPageSize(query.pagesize);
		}
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, PhotoCommentQuery query) {
		if (query != null) {
			if (query.name != null) {
				rule.add(Restrictions.like("name", query.name, MatchMode.ANYWHERE));
			}
			if (query.content != null) {
				rule.add(Restrictions.like("content", query.content, MatchMode.ANYWHERE));
			}
			if (query.photoId != null) {
				rule.add(Restrictions.eq("photo.id", query.photoId));
			}
			if (query.userId != null) {
				rule.add(Restrictions.eq("user.id", query.userId));
			}
			if (query.getOrder() != null) {
				rule.addOrder(query.getDesc() ? Order.desc(query.getOrder()) : Order.asc(query.getOrder()));
			}
		}
		return rule;
	}
}
