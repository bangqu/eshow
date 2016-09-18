package cn.org.eshow.dao.hibernate;

import cn.org.eshow.bean.query.OrderQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.OrderDao;
import cn.org.eshow.model.Order;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("orderDao")
public class OrderDaoHibernate extends GenericDaoHibernate<Order, Integer> implements OrderDao {

    public OrderDaoHibernate() {
        super(Order.class);
    }

    public List<Order> list(OrderQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return list(rule);
    }

    public Page<Order> search(OrderQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        if (query != null) {
            rule.setOffset(query.getOffset());
            rule.setPageSize(query.pagesize);
        }
        return page(rule);
    }

    public EnhancedRule setRule(EnhancedRule rule, OrderQuery query) {
        if (query != null) {
            if (query.no != null) {
                rule.add(Restrictions.like("no", query.no, MatchMode.ANYWHERE));
            }
            if (query.channel != null) {
                rule.add(Restrictions.eq("channel", query.channel));
            }
            if (query.state != null) {
                rule.add(Restrictions.eq("state", query.state));
            }
            if (query.getOrder() != null) {
                rule.addOrder(query.getDesc() ? org.hibernate.criterion.Order.desc(query.getOrder()) : org.hibernate.criterion.Order.asc(query.getOrder()));
            }
        }
        return rule;

    }

}
