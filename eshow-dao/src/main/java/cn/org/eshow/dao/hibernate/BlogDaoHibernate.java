package cn.org.eshow.dao.hibernate;

import cn.org.eshow.bean.query.BlogQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.BlogDao;
import cn.org.eshow.model.Blog;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("blogDao")
public class BlogDaoHibernate extends GenericDaoHibernate<Blog, Integer> implements BlogDao {

    public BlogDaoHibernate() {
        super(Blog.class);
    }

    public Page<Blog> search(BlogQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        if (query != null) {
            rule.setOffset(query.getOffset());
            rule.setPageSize(query.pagesize);
        }
        return page(rule);
    }

    public List<Blog> list(BlogQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return list(rule);
    }

    public EnhancedRule setRule(EnhancedRule rule, BlogQuery query) {
        if (query != null) {
            if (query.title != null) {
                rule.add(Restrictions.like("title", query.title, MatchMode.ANYWHERE));
            }
            if (query.keyword != null) {
                rule.add(Restrictions.like("keyword", query.keyword, MatchMode.ANYWHERE));
            }
            if (query.hasKeyword != null) {
                if (query.hasKeyword) {
                    rule.add(Restrictions.isNotNull("keyword"));
                } else {
                    rule.add(Restrictions.isNull("keyword"));
                }
            }
            if (query.content != null) {
                rule.add(Restrictions.like("content", query.content, MatchMode.ANYWHERE));
            }

            if (query.img != null) {
                rule.add(Restrictions.like("img", query.img, MatchMode.ANYWHERE));
            }
            if (query.hasImg != null) {
                if (query.hasImg) {
                    rule.add(Restrictions.isNotNull("img"));
                } else {
                    rule.add(Restrictions.isNull("img"));
                }
            }
            if (query.count != null) {
                rule.add(Restrictions.eq("count", query.count));
            }
            if (query.enabled != null) {
                rule.add(Restrictions.eq("enabled", query.enabled));
            }
            if (query.categoryId != null) {
                rule.add(Restrictions.eq("category.id", query.categoryId));
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
