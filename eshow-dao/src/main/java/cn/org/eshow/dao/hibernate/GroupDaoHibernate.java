package cn.org.eshow.dao.hibernate;

import cn.org.eshow.bean.query.GroupQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.GroupDao;
import cn.org.eshow.model.Group;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("groupDao")
public class GroupDaoHibernate extends GenericDaoHibernate<Group, Integer> implements GroupDao {

    public GroupDaoHibernate() {
        super(Group.class);
    }

    @Override
    public Page<Group> search(GroupQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        if (query != null) {
            rule.setOffset(query.getOffset());
            rule.setPageSize(query.pagesize);
        }
        return page(rule);
    }

    @Override
    public List<Group> list(GroupQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return list(rule);
    }

    @Override
    public Long count(GroupQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return count(Group.class, rule);
    }

    public EnhancedRule setRule(EnhancedRule rule, GroupQuery query) {
        if (query != null) {
            if (query.startAddTime != null) {
                rule.add(Restrictions.ge("startAddTime", query.startAddTime));
            }
            if (query.endAddTime != null) {
                rule.add(Restrictions.le("endAddTime", query.endAddTime));
            }
            if (query.startUpdateTime != null) {
                rule.add(Restrictions.ge("startUpdateTime", query.startUpdateTime));
            }
            if (query.endUpdateTime != null) {
                rule.add(Restrictions.le("endUpdateTime", query.endUpdateTime));
            }
            if (query.type != null) {
                rule.add(Restrictions.eq("type", query.type));
            }
            if (query.name != null) {
                rule.add(Restrictions.like("name", query.name, MatchMode.ANYWHERE));
            }
            if (query.fullname != null) {
                rule.add(Restrictions.eq("name", query.fullname));
            }
            if (query.number != null) {
                rule.add(Restrictions.eq("number", query.number));
            }
            if (query.maxNumber != null) {
                rule.add(Restrictions.eq("maxNumber", query.maxNumber));
            }
            if (query.maxNumber != null) {
                rule.add(Restrictions.eq("maxNumber", query.maxNumber));
            }
            if (query.easemobGroupId != null) {
                rule.add(Restrictions.like("easemobGroupId", query.easemobGroupId, MatchMode.ANYWHERE));
            }
            if (query.easemobGroupIds != null) {
                rule.add(Restrictions.in("easemobGroupId", query.easemobGroupIds));
            }
            if (query.open != null) {
                rule.add(Restrictions.eq("open", query.open));
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
