package cn.org.eshow.dao.hibernate;

import cn.org.eshow.bean.query.NotificationRemindQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.NotificationRemindDao;
import cn.org.eshow.model.NotificationRemind;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("notificationRemindDao")
public class NotificationRemindDaoHibernate extends GenericDaoHibernate<NotificationRemind, Integer> implements NotificationRemindDao {

    public NotificationRemindDaoHibernate() {
        super(NotificationRemind.class);
    }

    public List<NotificationRemind> list(NotificationRemindQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return list(rule);
    }

    public Page<NotificationRemind> search(NotificationRemindQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        if (query != null) {
            rule.setOffset(query.getOffset());
            rule.setPageSize(query.pagesize);
        }
        return page(rule);
    }

    @Override
    public Long count(NotificationRemindQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return count(NotificationRemind.class, rule);
    }

    public EnhancedRule setRule(EnhancedRule rule, NotificationRemindQuery query) {
        if (query != null) {
            if (query.startAddTime != null) {
                rule.add(Restrictions.ge("addTime", query.startAddTime));
            }
            if (query.endAddTime != null) {
                rule.add(Restrictions.le("addTime", query.endAddTime));
            }
            if (query.minFriendCount != null) {
                rule.add(Restrictions.ge("friendCount", query.minFriendCount));
            }
            if (query.maxFriendCount != null) {
                rule.add(Restrictions.le("friendCount", query.maxFriendCount));
            }
            if (query.minNotificationCount != null) {
                rule.add(Restrictions.ge("friendCount", query.minNotificationCount));
            }
            if (query.maxNotificationCount != null) {
                rule.add(Restrictions.le("notificationCount", query.maxNotificationCount));
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
