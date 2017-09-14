package cn.org.eshow.dao.hibernate;

import cn.org.eshow.bean.query.AccessTokenQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.AccessTokenDao;
import cn.org.eshow.model.AccessToken;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("accessTokenDao")
public class AccessTokenDaoHibernate extends GenericDaoHibernate<AccessToken, Integer> implements AccessTokenDao {

    public AccessTokenDaoHibernate() {
        super(AccessToken.class);
    }

    @Override
    public Page<AccessToken> search(AccessTokenQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        if (query != null) {
            rule.setOffset(query.getOffset());
            rule.setPageSize(query.pagesize);
        }
        return page(rule);
    }

    @Override
    public List<AccessToken> list(AccessTokenQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return list(rule);
    }

    public EnhancedRule setRule(EnhancedRule rule, AccessTokenQuery query) {
        if (query != null) {
            if (query.startAddTime != null) {
                rule.add(Restrictions.eq("startAddTime", query.startAddTime));
            }
            if (query.endAddTime != null) {
                rule.add(Restrictions.eq("endAddTime", query.endAddTime));
            }
            if (query.updataTime != null) {
                rule.add(Restrictions.eq("updataTime", query.updataTime));
            }
            if (query.accessToken != null) {
                rule.add(Restrictions.eq("accessToken", query.accessToken));
            }
            if (query.expiresIn != null) {
                rule.add(Restrictions.eq("expiresIn", query.expiresIn));
            }
            if (query.refreshToken != null) {
                rule.add(Restrictions.eq("refreshToken", query.refreshToken));
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
