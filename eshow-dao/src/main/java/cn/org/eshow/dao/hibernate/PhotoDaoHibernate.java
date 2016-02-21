package cn.org.eshow.dao.hibernate;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import cn.org.eshow.bean.query.PhotoQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.PhotoDao;
import cn.org.eshow.dao.hibernate.GenericDaoHibernate;
import cn.org.eshow.model.Photo;

@Repository("photoDao")
public class PhotoDaoHibernate extends GenericDaoHibernate<Photo, Integer>
		implements PhotoDao {

	public PhotoDaoHibernate() {
		super(Photo.class);
	}

	public List<Photo> list(PhotoQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		return list(rule);
	}

	public Page<Photo> search(PhotoQuery query) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, query);
		if (query != null) {
			rule.setOffset(query.getOffset());
			rule.setPageSize(query.pagesize);
		}
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, PhotoQuery query) {
		if (query != null) {
			if (query.name != null) {
				rule.add(Restrictions.like("name", query.name,
						MatchMode.ANYWHERE));
			}
			if (query.content != null) {
				rule.add(Restrictions.like("content", query.content,
						MatchMode.ANYWHERE));
			}
			if (query.userId != null) {
				rule.add(Restrictions.eq("user.id", query.userId));
			}
			if (query.albumId != null) {
				rule.add(Restrictions.eq("album.id", query.albumId));
			}
			if (query.albumIds != null) {
				String[] albumIds = StringUtils.split(query.albumIds, ",");
				Integer[] bytes = new Integer[albumIds.length];
				for (int i = 0; i < albumIds.length; i++) {
					bytes[i] = Integer.valueOf(albumIds[i].trim());
				}
				rule.add(Restrictions.in("album.id", bytes));
			}
			if (query.getOrder() != null) {
				rule.addOrder(query.getDesc() ? Order.desc(query
						.getOrder()) : Order.asc(query.getOrder()));
			}
		}
		return rule;
	}
}
