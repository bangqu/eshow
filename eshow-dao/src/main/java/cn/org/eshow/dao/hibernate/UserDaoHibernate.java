package cn.org.eshow.dao.hibernate;

import cn.org.eshow.bean.query.UserQuery;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.UserDao;
import cn.org.eshow.model.User;

import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate5.SessionFactoryUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import javax.persistence.Table;
import java.util.List;

/**
 * This class interacts with Hibernate session to save/delete and retrieve User objects.
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a> Modified by
 *         <a href="mailto:dan@getrolling.com">Dan Kibler</a> Extended to
 *         implement Acegi UserDetailsService interface by David Carter
 *         david@carter.net Modified by <a href="mailto:bwnoll@gmail.com">Bryan
 *         Noll</a> to work with the new BaseDaoHibernate implementation that
 *         uses generics. Modified by jgarcia (updated to hibernate 4)
 */
@Repository("userDao")
public class UserDaoHibernate extends GenericDaoHibernate<User, Integer> implements UserDao, UserDetailsService {

    /**
     * Constructor that sets the entity to User.class.
     */
    public UserDaoHibernate() {
        super(User.class);
    }



    public List<User> list(UserQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        return list(rule);
    }

    /**
     * {@inheritDoc}
     */
    public Page<User> search(UserQuery query) {
        EnhancedRule rule = new EnhancedRule();
        setRule(rule, query);
        if (query != null) {
            rule.setOffset(query.getOffset());
            rule.setPageSize(query.pagesize);
        }
        return page(rule);
    }

    public User saveUser(User user) {
        if (log.isDebugEnabled()) {
            log.debug("user's id: " + user.getId());
        }
        getSession().saveOrUpdate(user);
        // necessary to throw a DataIntegrityViolation and catch it in UserManager
        getSession().flush();
        return user;
    }

    /**
     * Overridden simply to call the saveUser method. This is happenening because saveUser flushes the session and saveObject of BaseDaoHibernate does not.
     *
     * @param user the user to save
     * @return the modified user (with a primary key set if they're new)
     */
    @Override
    public User save(User user) {
        return this.saveUser(user);
    }

    /**
     * {@inheritDoc}
     */
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<?> users = getSession().createCriteria(User.class)
                .add(Restrictions.eq("username", username)).list();
        if (users == null || users.isEmpty()) {
            throw new UsernameNotFoundException("user '" + username + "' not found...");
        } else {
            return (UserDetails) users.get(0);
        }
    }

    /**
     * {@inheritDoc}
     */
    public UserDetails loadUserByDomain(String domain) {
        List<?> users = getSession().createCriteria(User.class)
                .add(Restrictions.eq("domain", domain)).list();
        if (users == null || users.isEmpty()) {
            return null;
        } else {
            return (UserDetails) users.get(0);
        }
    }

    /**
     * {@inheritDoc}
     */
    public String getUserPassword(String username) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(SessionFactoryUtils.getDataSource(getSessionFactory()));
        Table table = AnnotationUtils.findAnnotation(User.class, Table.class);
        return jdbcTemplate.queryForObject("select password from " + table.name() + " where username=?", String.class, username);
    }


    public EnhancedRule setRule(EnhancedRule rule, UserQuery query) {
        if (query != null) {
            if (query.startAddTime != null) {
                rule.add(Restrictions.ge("addTime", query.startAddTime));
            }
            if (query.endAddTime != null) {
                rule.add(Restrictions.le("addTime", query.endAddTime));
            }
            if (query.startUpdateTime != null) {
                rule.add(Restrictions.ge("updateTime", query.startUpdateTime));
            }
            if (query.endUpdateTime != null) {
                rule.add(Restrictions.le("updateTime", query.endUpdateTime));
            }
            if (query.username != null) {
                rule.add(Restrictions.like("username", query.username, MatchMode.ANYWHERE));
            }
            if (query.email != null) {
                rule.add(Restrictions.like("email", query.email, MatchMode.ANYWHERE));
            }
            if (query.nickname != null) {
                rule.add(Restrictions.like("nickname", query.nickname, MatchMode.ANYWHERE));
            }
            if (query.realname != null) {
                rule.add(Restrictions.like("realname", query.realname, MatchMode.ANYWHERE));
            }
            if (query.website != null) {
                rule.add(Restrictions.like("website", query.website, MatchMode.ANYWHERE));
            }
            if (query.photo != null) {
                if (Boolean.TRUE.equals(query.photo)) {
                    rule.add(Restrictions.isNotNull("photo"));// 有头像
                } else if (Boolean.FALSE.equals(query.photo)) {
                    rule.add(Restrictions.isNull("photo"));// 无头像
                }
            }
            if (query.easemobId != null) {
                rule.add(Restrictions.like("easemobId", query.easemobId, MatchMode.ANYWHERE));
            }
            if (query.getOrder() != null) {
                rule.addOrder(query.getDesc() ? Order.desc(query.getOrder()) : Order.asc(query.getOrder()));
            }
        }
        return rule;
    }
}
