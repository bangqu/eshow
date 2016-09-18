package cn.org.eshow.dao.hibernate;

import cn.org.eshow.bean.query.TopicQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.TopicDao;
import cn.org.eshow.model.Topic;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("topicDao")
public class TopicDaoHibernate extends GenericDaoHibernate<Topic, Integer> implements TopicDao {

    public TopicDaoHibernate() {
        super(Topic.class);
    }

    public List<Topic> list(TopicQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return list(rule);
    }

    public Page<Topic> search(TopicQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        if (query != null) {
            rule.setOffset(query.getOffset());
            rule.setPageSize(query.pagesize);
        }
        return page(rule);
    }

    public EnhancedRule setRule(EnhancedRule rule, TopicQuery query) {
        if (query != null) {
            if (query.startAddTime != null) {
                rule.add(Restrictions.ge("addTime", query.startAddTime));
            }
            if (query.endAddTime != null) {
                rule.add(Restrictions.le("addTime", query.endAddTime));
            }
            if (query.startUpdateTime != null) {
                rule.add(Restrictions.ge("updateTme", query.startUpdateTime));
            }
            if (query.endUpdateTime != null) {
                rule.add(Restrictions.le("updateTme", query.endUpdateTime));
            }
            if (query.title != null) {
                rule.add(Restrictions.like("title", query.title, MatchMode.ANYWHERE));
            }
            if (query.content != null) {
                rule.add(Restrictions.eq("content", query.content));
            }
            if (query.top != null) {
                rule.add(Restrictions.eq("top", query.top));
            }
            if (query.boardId != null) {
                rule.add(Restrictions.eq("board.id", query.boardId));
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
