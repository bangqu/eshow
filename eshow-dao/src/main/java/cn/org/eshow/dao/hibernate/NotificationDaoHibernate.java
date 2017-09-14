package cn.org.eshow.dao.hibernate;

import cn.org.eshow.bean.query.NotificationQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.NotificationDao;
import cn.org.eshow.model.Notification;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("notificationDao")
public class NotificationDaoHibernate extends GenericDaoHibernate<Notification, Integer> implements NotificationDao {

    public NotificationDaoHibernate() {
        super(Notification.class);
    }

    @Override
    public Page<Notification> search(NotificationQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        if (query != null) {
            rule.setOffset(query.getOffset());
            rule.setPageSize(query.pagesize);
        }
        return page(rule);
    }

    @Override
    public List<Notification> list(NotificationQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return list(rule);
    }

    @Override
    public Long count(NotificationQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return count(Notification.class, rule);
    }

    public EnhancedRule setRule(EnhancedRule rule, NotificationQuery query) {
        if (query != null) {
            if (query.startAddTime != null) {
                rule.add(Restrictions.ge("addTime", query.startAddTime));
            }
            if (query.endAddTime != null) {
                rule.add(Restrictions.le("addTime", query.endAddTime));
            }
            if (query.startUpdateTime != null) {
                rule.add(Restrictions.ge("updateTime", query.startUpdateTime));
            }
            if (query.endUpdateTime != null) {
                rule.add(Restrictions.le("updateTime", query.endUpdateTime));
            }
            if (!StringUtils.isEmpty(query.category)) {
                rule.add(Restrictions.eq("category", query.category));
            }
            if (!StringUtils.isEmpty(query.img)) {
                rule.add(Restrictions.eq("img", query.img));
            }
            if (!StringUtils.isEmpty(query.title)) {
                rule.add(Restrictions.like("title", query.title, MatchMode.ANYWHERE));
            }
            if (!StringUtils.isEmpty(query.content)) {
                rule.add(Restrictions.like("content", query.content, MatchMode.ANYWHERE));
            }
            if (!StringUtils.isEmpty(query.model)) {
                rule.add(Restrictions.eq("model", query.model));
            }
            if (!StringUtils.isEmpty(query.modelVal)) {
                rule.add(Restrictions.eq("modelVal", query.modelVal));
            }
            if (query.state != null) {
                rule.add(Restrictions.eq("state", query.state));
            }
            if (query.enabled != null) {
                rule.add(Restrictions.eq("enabled", query.enabled));
            }
            if (query.userId != null) {
                rule.add(Restrictions.eq("user.id", query.userId));
            }
            if (!StringUtils.isEmpty(query.getOrder())) {
                rule.addOrder(query.getDesc() ? Order.desc(query.getOrder()) : Order.asc(query.getOrder()));
            }
        }
        return rule;
    }
}
