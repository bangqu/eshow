package cn.org.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import cn.org.eshow.bean.query.PhotoCommentQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.PhotoCommentDao;
import cn.org.eshow.dao.hibernate.GenericDaoHibernate;
import cn.org.eshow.model.PhotoComment;

@Repository("photoCommentDao")
public class PhotoCommentDaoHibernate extends GenericDaoHibernate<PhotoComment, Integer> implements
		PhotoCommentDao {

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
		}
		return rule;
	}
}
