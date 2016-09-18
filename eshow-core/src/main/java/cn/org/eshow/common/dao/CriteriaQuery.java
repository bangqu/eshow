package cn.org.eshow.common.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;

import java.io.Serializable;

/**
 * 一个直观的、可扩展的条件查询对象
 *
 * @author leida
 */
public class CriteriaQuery implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * 离线查询对象
     */
    private DetachedCriteria detachedCriteria;

    /**
     * 偏移量
     */
    private int firstResult = 0;

    /**
     * 页大小
     */
    private int maxResults = -1;

    /**
     * 通过实体名称构造
     *
     * @param entityName
     */
    public CriteriaQuery(String entityName) {

        detachedCriteria = DetachedCriteria.forEntityName(entityName);
    }

    /**
     * 通过实体名称和别名构造
     *
     * @param entityName
     * @param alias
     */
    public CriteriaQuery(String entityName, String alias) {

        detachedCriteria = DetachedCriteria.forEntityName(entityName, alias);
    }

    /**
     * 通过实体类构造
     *
     * @param clazz
     */
    public CriteriaQuery(Class<?> clazz) {

        detachedCriteria = DetachedCriteria.forClass(clazz);
    }

    /**
     * 通过实体类和别名构造
     *
     * @param clazz
     * @param alias
     */
    public CriteriaQuery(Class<?> clazz, String alias) {

        detachedCriteria = DetachedCriteria.forClass(clazz, alias);
    }

    /**
     * 添加查询条件
     *
     * @param criterion
     * @return CriteriaQuery
     */
    public CriteriaQuery add(Criterion criterion) {

        detachedCriteria.add(criterion);
        return this;
    }

    /**
     * 添加排序选项
     *
     * @param order
     * @return CriteriaQuery
     */
    public CriteriaQuery addOrder(Order order) {

        detachedCriteria.addOrder(order);
        return this;
    }

    /**
     * 创建别名
     *
     * @param associationPath
     * @param alias
     * @return CriteriaQuery
     */
    public CriteriaQuery createAlias(String associationPath, String alias) {

        detachedCriteria.createAlias(associationPath, alias);
        return this;
    }

    /**
     * 创建查询条件
     *
     * @param associationPath
     * @param alias
     * @return
     */
    public CriteriaQuery createCriteria(String associationPath, String alias) {

        detachedCriteria.createCriteria(associationPath, alias);
        return this;
    }

    /**
     * 创建查询条件
     *
     * @param associationPath
     * @return
     */
    public CriteriaQuery createCriteria(String associationPath) {

        detachedCriteria.createCriteria(associationPath);
        return this;
    }

    /**
     * 获得别名
     *
     * @return
     */
    public String getAlias() {

        return detachedCriteria.getAlias();
    }

    /**
     * 设置投影查询
     *
     * @param projection
     * @return
     */
    public CriteriaQuery setProjection(Projection projection) {

        detachedCriteria.setProjection(projection);
        return this;
    }

    /*
     * (non-Javadoc)
     *
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {

        return "Criteria(" + detachedCriteria.toString() + ')';
    }

    /**
     * Set a limit upon the number of objects to be retrieved.
     *
     * @param maxResults the maximum number of results
     * @return Criteria
     */
    public CriteriaQuery setMaxResults(int maxResults) {

        this.maxResults = maxResults;
        return this;
    }

    /**
     * Set the first result to be retrieved.
     *
     * @param firstResult the first result, numbered from <tt>0</tt>
     * @return Criteria
     */
    public CriteriaQuery setFirstResult(int firstResult) {

        this.firstResult = firstResult;
        return this;
    }

    /**
     * @return
     */
    public int getFirstResult() {

        return firstResult;
    }

    /**
     * @return
     */
    public int getMaxResults() {

        return maxResults;
    }

    /**
     * 根据DetachedCriteria对象和Session对象取得Hibernate的Criteria对象
     *
     * @param session
     * @return
     */
    public Criteria getCriteria(Session session) {

        Criteria criteria = this.detachedCriteria.getExecutableCriteria(session);
        if (firstResult > 0) {
            criteria.setFirstResult(this.firstResult);
        }
        if (maxResults > 0) {
            criteria.setMaxResults(this.maxResults);
        }
        return criteria;
    }

}
