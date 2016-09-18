package cn.org.eshow.dao.hibernate;

import cn.org.eshow.bean.query.UserGroupQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.UserGroupDao;
import cn.org.eshow.model.UserGroup;
import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository("userGroupDao")
public class UserGroupHibernate extends GenericDaoHibernate<UserGroup, Integer>
        implements UserGroupDao {

    public UserGroupHibernate() {
        super(UserGroup.class);
    }

    @Override
    public Page<UserGroup> search(UserGroupQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        if (query != null) {
            rule.setOffset(query.getOffset());
            rule.setPageSize(query.pagesize);
        }
        return page(rule);
    }

    @Override
    public List<UserGroup> list(UserGroupQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return list(rule);
    }

    @Override
    public Long count(UserGroupQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return count(UserGroup.class, rule);
    }

    public EnhancedRule setRule(EnhancedRule rule, UserGroupQuery query) {
        if (query != null) {
            if (query.startAddTime != null) {
                rule.add(Restrictions.ge("startAddTime", query.startAddTime));
            }
            if (query.endAddTime != null) {
                rule.add(Restrictions.le("endAddTime", query.endAddTime));
            }
            if (query.type != null) {
                rule.add(Restrictions.eq("type", query.type));
            }
            if (query.top != null) {
                rule.add(Restrictions.eq("top", query.top));
            }
            if (query.disturb != null) {
                rule.add(Restrictions.eq("disturb", query.disturb));
            }
            if (query.nickName != null) {
                rule.add(Restrictions.like("nickName", query.nickName, MatchMode.ANYWHERE));
            }
            if (query.groupId != null) {
                rule.add(Restrictions.eq("group.id", query.groupId));
            }
            if (query.userId != null) {
                rule.add(Restrictions.eq("user.id", query.userId));
            }
            if (!StringUtils.isEmpty(query.getOrder())) {
                rule.addOrder(query.getDesc() ? Order.desc(query
                        .getOrder()) : Order.asc(query.getOrder()));
            }
        }
        return rule;
    }
}
