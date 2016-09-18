package cn.org.eshow.dao.hibernate;

import cn.org.eshow.bean.query.TopicCommentQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.TopicCommentDao;
import cn.org.eshow.model.TopicComment;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("topicCommentDao")
public class TopicCommentDaoHibernate extends GenericDaoHibernate<TopicComment, Integer> implements TopicCommentDao {

    public TopicCommentDaoHibernate() {
        super(TopicComment.class);
    }

    public List<TopicComment> list(TopicCommentQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return list(rule);
    }

    public Page<TopicComment> search(TopicCommentQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        if (query != null) {
            rule.setOffset(query.getOffset());
            rule.setPageSize(query.pagesize);
        }
        return page(rule);
    }

    public EnhancedRule setRule(EnhancedRule rule, TopicCommentQuery query) {
        if (query != null) {
            if (query.addTime != null) {
                rule.add(Restrictions.eq("addTime", query.addTime));
            }
            if (query.name != null) {
                rule.add(Restrictions.eq("name", query.name));
            }
            if (query.content != null) {
                rule.add(Restrictions.eq("content", query.content));
            }
            if (query.ip != null) {
                rule.add(Restrictions.eq("ip", query.ip));
            }
            if (query.topicId != null) {
                rule.add(Restrictions.eq("topic.id", query.topicId));
            }
            if (query.userId != null) {
                rule.add(Restrictions.eq("user.id", query.userId));
            }
            if (query.boardId != null) {
                rule.add(Restrictions.eq("topic.board.id", query.boardId));
            }
            if (query.getOrder() != null) {
                rule.addOrder(query.getDesc() ? Order.desc(query.getOrder()) : Order.asc(query.getOrder()));
            }
        }
        return rule;
    }
}
