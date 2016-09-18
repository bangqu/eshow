package cn.org.eshow.dao.hibernate;

import cn.org.eshow.bean.query.AlbumQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.AlbumDao;
import cn.org.eshow.model.Album;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("albumDao")
public class AlbumDaoHibernate extends GenericDaoHibernate<Album, Integer> implements AlbumDao {

    public AlbumDaoHibernate() {
        super(Album.class);
    }

    public List<Album> list(AlbumQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return list(rule);
    }

    public Page<Album> search(AlbumQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        if (query != null) {
            rule.setOffset(query.getOffset());
            rule.setPageSize(query.pagesize);
        }
        return page(rule);
    }

    public EnhancedRule setRule(EnhancedRule rule, AlbumQuery query) {
        if (query != null) {
            if (query.name != null) {
                rule.add(Restrictions.like("name", query.name, MatchMode.ANYWHERE));
            }
            if (query.description != null) {
                rule.add(Restrictions.like("description", query.description, MatchMode.ANYWHERE));
            }
            if (query.img != null) {
                rule.add(Restrictions.like("img", query.img, MatchMode.ANYWHERE));
            }
            if (query.photoSize != null) {
                rule.add(Restrictions.eq("photoSize", query.photoSize));
            }
            if (query.enabled != null) {
                rule.add(Restrictions.eq("enabled", query.enabled));
            }
            if (query.count != null) {
                rule.add(Restrictions.eq("count", query.count));
            }
            if (query.website != null) {
                rule.add(Restrictions.like("website", query.website, MatchMode.ANYWHERE));
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
