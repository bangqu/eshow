package cn.org.eshow.dao.hibernate;

import cn.org.eshow.bean.query.ProductQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.ProductDao;
import cn.org.eshow.model.Product;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("productDao")
public class ProductDaoHibernate extends GenericDaoHibernate<Product, Integer> implements ProductDao {

    public ProductDaoHibernate() {
        super(Product.class);
    }

    public List<Product> list(ProductQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return list(rule);
    }

    public Page<Product> search(ProductQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        if (query != null) {
            rule.setOffset(query.getOffset());
            rule.setPageSize(query.pagesize);
        }
        return page(rule);
    }

    public EnhancedRule setRule(EnhancedRule rule, ProductQuery query) {
        if (query != null) {
            if (query.startAddTime != null) {
                rule.add(Restrictions.ge("addTime", query.startAddTime));
            }
            if (query.endAddTime != null) {
                rule.add(Restrictions.le("addTime", query.endAddTime));
            }
            if (query.name != null) {
                rule.add(Restrictions.like("name", query.name, MatchMode.ANYWHERE));
            }
            if (query.content != null) {
                rule.add(Restrictions.eq("content", query.content));
            }
            if (query.productCategoryId != null) {
                rule.add(Restrictions.eq("productCategory.id", query.productCategoryId));
            }
            if (query.userId != null) {
                rule.add(Restrictions.eq("user.id", query.userId));
            }
            if (query.minPrice != null) {
                rule.add(Restrictions.ge("price", query.minPrice));
            }
            if (query.maxPrice != null) {
                rule.add(Restrictions.le("price", query.maxPrice));
            }
            if (query.code != null) {
                rule.add(Restrictions.like("code", query.code, MatchMode.ANYWHERE));
            }
            if (query.website != null) {
                rule.add(Restrictions.like("website", query.website, MatchMode.ANYWHERE));
            }
            if (query.enabled != null) {
                rule.add(Restrictions.eq("enabled", query.enabled));
            }
            if (query.getOrder() != null) {
                rule.addOrder(query.getDesc() ? Order.desc(query.getOrder()) : Order.asc(query.getOrder()));
            }
        }
        return rule;
    }
}
