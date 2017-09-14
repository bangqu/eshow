package cn.org.eshow.dao.hibernate;

import cn.org.eshow.bean.query.ThirdPartyQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.ThirdPartyDao;
import cn.org.eshow.model.ThirdParty;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("thirdPartyDao")
public class ThirdPartyDaoHibernate extends GenericDaoHibernate<ThirdParty, Integer> implements ThirdPartyDao {

    public ThirdPartyDaoHibernate() {
        super(ThirdParty.class);
    }

    public List<ThirdParty> list(ThirdPartyQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return list(rule);
    }

    public Page<ThirdParty> search(ThirdPartyQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        if (query != null) {
            rule.setOffset(query.getOffset());
            rule.setPageSize(query.pagesize);
        }
        return page(rule);
    }

    public EnhancedRule setRule(EnhancedRule rule, ThirdPartyQuery query) {
        if (query != null) {
            if (query.startAddTime != null) {
                rule.add(Restrictions.ge("addTime", query.startAddTime));
            }
            if (query.endAddTime != null) {
                rule.add(Restrictions.le("addTime", query.endAddTime));
            }
            if (query.url != null) {
                rule.add(Restrictions.eq("url", query.url));
            }
            if (query.username != null) {
                rule.add(Restrictions.eq("username", query.username));
            }
            if (query.password != null) {
                rule.add(Restrictions.eq("password", query.password));
            }
            if (query.nickname != null) {
                rule.add(Restrictions.eq("nickname", query.nickname));
            }
            if (query.platform != null) {
                rule.add(Restrictions.eq("platform", query.platform));
            }
            if (query.photo != null) {
                rule.add(Restrictions.eq("photo", query.photo));
            }
            if (query.male != null) {
                rule.add(Restrictions.eq("male", query.male));
            }
            if (query.enabled != null) {
                rule.add(Restrictions.eq("enabled", query.enabled));
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
