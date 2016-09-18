package cn.org.eshow.service.impl;

import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.dao.GenericDao;
import cn.org.eshow.service.GenericManager;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.Restrictions;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * This class serves as the Base class for all other Managers - namely to hold
 * common CRUD methods that they might all use. You should only need to extend
 * this class when your require custom CRUD logic.
 * <p/>
 * <p/>
 * To register this class in your Spring context file, use the following XML.
 * <p/>
 * <pre>
 *     &lt;bean id="userManager" class="cn.org.eshow.service.impl.GenericManagerImpl"&gt;
 *         &lt;constructor-arg&gt;
 *             &lt;bean class="cn.org.eshow.dao.hibernate.GenericDaoHibernate"&gt;
 *                 &lt;constructor-arg value="cn.org.eshow.model.User"/&gt;
 *                 &lt;property name="sessionFactory" ref="sessionFactory"/&gt;
 *             &lt;/bean&gt;
 *         &lt;/constructor-arg&gt;
 *     &lt;/bean&gt;
 * </pre>
 * <p/>
 * <p/>
 * If you're using iBATIS instead of Hibernate, use:
 * <p/>
 * <pre>
 *     &lt;bean id="userManager" class="cn.org.eshow.service.impl.GenericManagerImpl"&gt;
 *         &lt;constructor-arg&gt;
 *             &lt;bean class="cn.org.eshow.dao.ibatis.GenericDaoiBatis"&gt;
 *                 &lt;constructor-arg value="cn.org.eshow.model.User"/&gt;
 *                 &lt;property name="dataSource" ref="dataSource"/&gt;
 *                 &lt;property name="sqlMapClient" ref="sqlMapClient"/&gt;
 *             &lt;/bean&gt;
 *         &lt;/constructor-arg&gt;
 *     &lt;/bean&gt;
 * </pre>
 *
 * @param <T>  a type variable
 * @param <PK> the primary key for that type
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 */
public class GenericManagerImpl<T, PK extends Serializable> implements GenericManager<T, PK> {
    /**
     * Log variable for all child classes. Uses LogFactory.getLog(getClass())
     * from Commons Logging
     */
    protected final Log log = LogFactory.getLog(getClass());

    /**
     * GenericDao instance, set by constructor of this class
     */
    protected GenericDao<T, PK> dao;

    public GenericManagerImpl() {
    }

    /**
     * Public constructor for creating a new GenericManagerImpl.
     *
     * @param genericDao the GenericDao to use for persistence
     */
    public GenericManagerImpl(final GenericDao<T, PK> genericDao) {
        this.dao = genericDao;
    }

    /**
     * {@inheritDoc}
     */
    public T get(PK id) {
        return dao.get(id);
    }

    /**
     * {@inheritDoc}
     */
    public T getBy(String object, Object value) {
        EnhancedRule rule = new EnhancedRule();
        rule.add(Restrictions.eq(object, value));
        return dao.uniqueResult(rule);
    }

    /**
     * {@inheritDoc}
     */
    public boolean exists(PK id) {
        return dao.exists(id);
    }

    /**
     * {@inheritDoc}
     */
    public T save(T object) {
        return dao.save(object);
    }

    /**
     * {@inheritDoc}
     */
    public void remove(T object) {
        dao.remove(object);
    }

    /**
     * {@inheritDoc}
     */
    public void remove(PK id) {
        dao.remove(id);
    }

    public List<T> list(String order, int count) {
        return dao.list(order, count);
    }

    public T exists(String name) {
        EnhancedRule rule = new EnhancedRule();
        rule.add(Restrictions.eq("name", name));
        return dao.uniqueResult(rule);
    }

    /**
     * {@inheritDoc}
     * <p/>
     * Search implementation using Hibernate Search.
     */
    @SuppressWarnings("unchecked")
    public List<T> search(String q, Class clazz) {
        if (q == null || "".equals(q.trim())) {
            return list("addTime", 10);
        }

        return dao.search(q);
    }

    /**
     * {@inheritDoc}
     */
    public void reindex() {
        dao.reindex();
    }

    /**
     * {@inheritDoc}
     */
    public void reindexAll(boolean async) {
        dao.reindexAll(async);
    }

    @Override
    public List<T> findByNamedQuery(String queryName, Map<String, Object> queryParams) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void count(Class<T> clazz, String object, int size, Integer id) {
        dao.count(clazz, object, size, id);
    }

}
