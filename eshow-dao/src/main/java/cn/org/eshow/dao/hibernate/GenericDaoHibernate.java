package cn.org.eshow.dao.hibernate;

import cn.org.eshow.common.dao.CriteriaQuery;
import cn.org.eshow.common.dao.DAOException;
import cn.org.eshow.common.dao.EnhancedRule;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.GenericDao;
import cn.org.eshow.dao.SearchException;
import com.sun.org.apache.regexp.internal.RE;
import com.sun.org.apache.regexp.internal.RESyntaxException;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.util.Version;
import org.hibernate.*;
import org.hibernate.criterion.*;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.orm.ObjectRetrievalFailureException;
import org.springframework.util.Assert;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * This class serves as the Base class for all other DAOs - namely to hold
 * common CRUD methods that they might all use. You should only need to extend
 * this class when your require custom CRUD logic.
 * <p>
 * To register this class in your Spring context file, use the following XML.
 * 
 * <pre>
 *      &lt;bean id=&quot;fooDao&quot; class=&quot;cn.org.eshow.dao.hibernate.GenericDaoHibernate&quot;&gt;
 *          &lt;constructor-arg value=&quot;cn.org.eshow.model.Foo&quot;/&gt;
 *          &lt;property name=&quot;sessionFactory&quot; ref=&quot;sessionFactory&quot;/&gt;
 *      &lt;/bean&gt;
 * </pre>
 * 
 * @param <T> a type variable
 * @param <PK> the primary key for that type
 */
public class GenericDaoHibernate<T, PK extends Serializable> implements GenericDao<T, PK> {

	/**
	 * 
	 */
	private static final int BATCH_SIZE = 20;
	/**
	 * Log variable for all child classes. Uses LogFactory.getLog(getClass())
	 * from Commons Logging
	 */
	protected final Log log = LogFactory.getLog(getClass());
	private Class<T> persistentClass;
	@Resource
	private SessionFactory sessionFactory;
	private Analyzer defaultAnalyzer;

	/**
	 * Constructor that takes in a class to see which type of entity to persist
	 * 
	 * @param persistentClass the class type you'd like to persist
	 */
	public GenericDaoHibernate(final Class<T> persistentClass) {
		this.persistentClass = persistentClass;
		defaultAnalyzer = new StandardAnalyzer();
	}

	/**
	 * Constructor that takes in a class and sessionFactory for easy creation of DAO.
	 * 
	 * @param persistentClass the class type you'd like to persist
	 * @param sessionFactory the pre-configured Hibernate SessionFactory
	 */
	public GenericDaoHibernate(final Class<T> persistentClass, SessionFactory sessionFactory) {
		this.persistentClass = persistentClass;
		this.sessionFactory = sessionFactory;
		defaultAnalyzer = new StandardAnalyzer();
	}

	public SessionFactory getSessionFactory() {
		return this.sessionFactory;
	}

	public Session getSession() throws HibernateException {
		Session sess = getSessionFactory().getCurrentSession();
		if (sess == null) {
			sess = getSessionFactory().openSession();
		}
		return sess;
	}

	@Autowired
	@Required
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/**
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public List<T> getAll() {
		Session sess = getSession();
		return sess.createCriteria(persistentClass).list();
	}

    /**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    public List<T> getAllDistinct() {
        Collection<T> result = new LinkedHashSet<T>(getAll());
        return new ArrayList<T>(result);
    }

	/**
	 * {@inheritDoc}
	 */
	public T get(PK id) {
		Session sess = getSession();
		IdentifierLoadAccess byId = sess.byId(persistentClass);
		T entity = (T) byId.load(id);

		if (entity == null) {
			log.warn("Uh oh, '" + this.persistentClass + "' object with id '" + id + "' not found...");
			throw new ObjectRetrievalFailureException(this.persistentClass, id);
		}

		return entity;
	}

	/**
	 * {@inheritDoc}
	 */
	public T getBy(String object, Object value) {
		EnhancedRule rule = new EnhancedRule();
		rule.add(Restrictions.eq(object, value));
		return uniqueResult(rule);
	}

	/**
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public boolean exists(PK id) {
		Session sess = getSession();
		IdentifierLoadAccess byId = sess.byId(persistentClass);
		T entity = (T) byId.load(id);
		return entity != null;
	}

	/**
	 * {@inheritDoc}
	 */
	public T save(T object) {
		Session sess = getSession();
		return (T) sess.merge(object);
	}

	/**
	 * {@inheritDoc}
	 */
	public void save(List<T> objects) {
		Session sess = getSession();
		for (T object : objects) {
			sess.merge(object);
		}
	}

    /**
     * {@inheritDoc}
     */
    public void remove(T object) {
        Session sess = getSession();
        sess.delete(object);
    }

	/**
	 * {@inheritDoc}
	 */
	public void remove(PK id) {
		Session sess = getSession();
		IdentifierLoadAccess byId = sess.byId(persistentClass);
		T entity = (T) byId.load(id);
		sess.delete(entity);
	}

	public List<T> list(final EnhancedRule enhanceRule) {
		log.debug("Get list of object whose class name is:" + this.persistentClass.getName() + " by enhanced rule");
		if (enhanceRule == null) {
			return getAll();
		}
		return enhanceRule.getCriteria(this.persistentClass, getSession()).list();
	}

	public T uniqueResult(final EnhancedRule enhanceRule) {
		if (enhanceRule == null) {
			return null;
		}
		return (T) enhanceRule.getCriteria(this.persistentClass, getSession()).uniqueResult();
	}

	public long count(final Class<T> clazz, final EnhancedRule enhanceRule) {
		log.debug("Get the number of object whose class name is:" + clazz.getName() + " by enhanced rule");
		if (enhanceRule == null) {
			return countAll(clazz);
		}
		return getCount(enhanceRule.getCountCriteria(clazz, getSession()).uniqueResult());
	}

	public List<T> find(final CriteriaQuery criteria) {
		log.debug("find object by criteria query object");
		return criteria.getCriteria(getSession()).list();
	}

	public long countAll(Class<T> clazz) {
		List<T> list = list(" select count(*) from " + clazz.getName(), new Object[] {});
		log.debug("get the number of the objects:" + clazz.getName());
		return getCount(list.get(0));
	}

	public long deleteAll(Class<T> clazz) throws DAOException {
		return executeUpdate(" delete from " + clazz.getName(), new Object[] {});
	}

	public long getSequenceNumber() {

		// List<BigDecimal> list = executeSQLQuery (getSQLFromName
		// ("getSequenceNumber"), PreparedStamentCallback.emptyParameter,
		// new ResultSetCallback () {
		//
		// public Object compose(ResultSet rs) throws SQLException {
		//
		// BigDecimal value = rs.getBigDecimal (1);
		// return value;
		// }
		//
		// });
		// return list.isEmpty () ? 0 : list.get (0).longValueExact ();
		// TODO
		return 0;
	}

	/**
	 * delete object by Query object
	 * 
	 * @param scroll ScrollableResults object
	 * @return the number of object has been deleted
	 */
	private int delete(ScrollableResults scroll) {
		int count = 0;
		while (scroll.next()) {
			Object obj = scroll.get(0);
			remove((T) obj);
			if (++count % BATCH_SIZE == 0) {
				getSession().flush();
				getSession().clear();
			}
		}
		log.debug("Delete objects by Query object");
		return count;
	}

	/**
	 * @param queryName
	 * @return Query
	 */
	private Query getQueryByName(String queryName) {
		return getSession().getNamedQuery(queryName);
	}

	/**
	 * @param hql
	 * @return Query
	 */
	private Query getQueryByHQL(String hql) {
		return getSession().createQuery(hql);
	}

	/**
	 * set the JDBC parrten parameters to Query object (from Entity entity where entity.id=?)
	 * 
	 * @param query Query object
	 * @param params parameter
	 * @return Query object
	 */
	private Query setParameters(Query query, Object[] params) {
		if (params == null) {
			throw new RuntimeException("PARAMETER_IS_NULL");
		}
		for (int i = 0; i < params.length; i++) {
			if (params[i] == null) {
				throw new RuntimeException("PARAMETER_IS_NULL");
			}
			query.setParameter(i, params[i]);
		}
		log.debug("Set the JDBC parrten parameters to Query object");
		return query;
	}

	/**
	 * set the Hibernate parrten parameters to Query object (from Entity entity where entity.id=:id)
	 * 
	 * @param query Query object
	 * @param name parameter name
	 * @param params parameter value
	 * @return Query object
	 */
	private Query setParameters(Query query, String[] name, Object[] params) {
		if (name.length != params.length) {
			throw new RuntimeException("The length of parameter names and parameters are not equal!");
		}
		for (int i = 0; i < params.length; i++) {
			if (params[i] == null) {
				throw new RuntimeException("PARAMETER_IS_NULL");
			}
			if (params[i] instanceof Object[]) {
				if (((Object[]) params[i]).length == 0) {
					throw new RuntimeException("COLLECTION_IS_EMPTY");
				}
				query.setParameterList(name[i], (Object[]) params[i]);
			} else if (params[i] instanceof Collection) {
				if (((Collection) params[i]).size() == 0) {
					throw new RuntimeException("COLLECTION_IS_EMPTY");
				}
				query.setParameterList(name[i], (Collection) params[i]);
			} else {
				query.setParameter(name[i], params[i]);
			}
		}
		log.debug("Set the Hibernate parrten parameters to Query object");
		return query;
	}

	/**
	 * initialize the domain object which was lazy loaded
	 * 
	 * @param obj domain object
	 */
	public void initialize(Object obj) {
		try {
			if (Hibernate.isInitialized(obj)) {
				return;
			}
			Hibernate.initialize(obj);
			log.debug("initialize object:" + obj.toString());
		} catch (HibernateException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * @param queryName
	 * @param params
	 * @return int
	 */
	public int deleteByNamedQuery(String queryName, Object[] params) {
		return delete(setParameters(getQueryByName(queryName), params).scroll());
	}

	/**
	 * @param hql
	 * @param params
	 * @return int
	 */
	public int delete(String hql, Object[] params) {
		return delete(setParameters(getQueryByHQL(hql), params).scroll());
	}

	/**
	 * @param queryName
	 * @param name
	 * @param params
	 * @return int
	 */
	public int deleteByNamedQuery(String queryName, String[] name, Object[] params) {
		return delete(setParameters(getQueryByName(queryName), name, params).scroll());
	}

	/**
	 * @param hql
	 * @param name
	 * @param params
	 * @return int
	 */
	public int delete(String hql, String[] name, Object[] params) {
		return delete(setParameters(getQueryByHQL(hql), name, params).scroll());
	}

	public List<T> listByNamedQuery(String queryName, Object[] params) {
		return setParameters(getQueryByName(queryName), params).list();
	}

	public List<T> list(String hql, Object[] params) {
		return setParameters(getQueryByHQL(hql), params).list();
	}

	public T uniqueResultByNamedQuery(String queryName, Object[] params) {
		return (T) setParameters(getQueryByName(queryName), params).uniqueResult();
	}

	public T uniqueResult(String hql, Object[] params) {
		return (T) setParameters(getQueryByHQL(hql), params).uniqueResult();
	}

	public int executeUpdateByNamedQuery(String updateQueryName, Object[] params) {
		return setParameters(getQueryByName(updateQueryName), params).executeUpdate();
	}

	public int executeUpdate(String hql, Object[] params) {
		return setParameters(getQueryByHQL(hql), params).executeUpdate();
	}

	public List<T> listByNamedQuery(String queryName, String[] name, Object[] params) {
		return setParameters(getQueryByName(queryName), name, params).list();
	}

	public List<T> list(String hql, String[] name, Object[] params) {
		return setParameters(getQueryByHQL(hql), name, params).list();
	}

	public List<T> list(String order, int count) {
		EnhancedRule rule = new EnhancedRule();
		rule.addOrder(Order.desc(order));
		rule.setOffset(0);
		rule.setPageSize(count);
		return list(rule);
	}

	public T uniqueResultByNamedQuery(String queryName, String[] name, Object[] params) {
		return (T) setParameters(getQueryByName(queryName), name, params).uniqueResult();
	}

	public T uniqueResult(String hql, String[] name, Object[] params) {
		return (T) setParameters(getQueryByHQL(hql), name, params).uniqueResult();
	}

	public int executeUpdateByNamedQuery(String updateQueryName, String[] name, Object[] params) {
		return setParameters(getQueryByName(updateQueryName), name, params).executeUpdate();
	}

	public int executeUpdate(String hql, String[] name, Object[] params) {
		return setParameters(getQueryByHQL(hql), name, params).executeUpdate();
	}

	public int delete(Class<T> clazz, EnhancedRule rule) throws DAOException {
		if (rule == null) {
			return (int) deleteAll(clazz);
		}
		return delete(rule.getCriteria(clazz, getSession()).scroll());
	}

	public Page<T> page(EnhancedRule rule) throws DAOException {
		Page<T> page = new Page<T>(rule.getOffset(), rule.getPageSize());
		List<T> list = list(rule);
		int total = (int) count(this.persistentClass, rule);
		page.setTotal(total);
		page.setDataList(list);
		return page;
	}

	public Page<T> page(String queryName, Object[] params, int offset, int pageSize) throws DAOException {
		Query query = setParameters(getQueryByName(queryName), params);
		query.setFirstResult(offset);
		query.setMaxResults(pageSize);
		List<T> list = query.list();
		int total = count(getQueryByName(queryName).getQueryString(), params);
		Page<T> page = new Page<T>(offset, pageSize);
		page.setTotal(total);
		page.setDataList(list);
		return page;
	}

	public Page<T> page(String queryName, String[] name, Object[] params, int offset, int pageSize) throws DAOException {
		Query query = setParameters(getQueryByName(queryName), name, params);
		query.setFirstResult(offset);
		query.setMaxResults(pageSize);
		List<T> list = query.list();
		int total = count(getQueryByName(queryName).getQueryString(), name, params);
		Page<T> page = new Page<T>(offset, pageSize);
		page.setTotal(total);
		page.setDataList(list);
		return page;
	}

	/**
	 * @param hql
	 * @param name
	 * @param params
	 * @return int
	 */
	private int count(String hql, String[] name, Object[] params) {
		return getCount(setParameters(getQueryByHQL(getCountHQL(hql)), name, params).uniqueResult());
	}

	/**
	 * @param hql
	 * @param params
	 * @return int
	 */
	private int count(String hql, Object[] params) {
		return getCount(setParameters(getQueryByHQL(getCountHQL(hql)), params).uniqueResult());
	}

	/**
	 * 
	 */
	static final String ORDER_BY_PATTERN = "ORDER\\s+BY\\s+([^\\s,\\)]+(\\s+ASC|\\s+DESC)?\\s*[,]?\\s*)+";

	/**
	 * 
	 */
	static final String ORDER_BY_SQL_PATTERN = "^(.+)[\\s|\\)]" + ORDER_BY_PATTERN + "(.*)$";

	/**
	 * @param query
	 * @return String
	 */
	private String getCountHQL(String query) {
		if (query == null)
			return query;
		String subQuery = subQuery(query);
		int idx1 = query.toUpperCase().indexOf("SELECT") + 6;
		int idx2 = query.indexOf(subQuery);
		String countStr = (idx1 < idx2) ? buildCountString(query.substring(idx1, idx2)) : buildCountString("");

		String result = "SELECT" + countStr + subQuery;

		Matcher sqlMatcher = Pattern.compile(ORDER_BY_SQL_PATTERN, Pattern.CASE_INSENSITIVE).matcher(query);
		if (sqlMatcher.matches()) {
			Matcher rplMatcher = Pattern.compile(ORDER_BY_PATTERN, Pattern.CASE_INSENSITIVE).matcher(result);
			return rplMatcher.replaceAll("");
		}

		return result;
	}

	/**
	 * @param query
	 * @return String
	 */
	private String subQuery(String query) {
		RE regexp;
		try {
			regexp = new RE("^(.*\\))?FROM\\(?", RE.MATCH_CASEINDEPENDENT);
		} catch (RESyntaxException e) {

			throw new RuntimeException(e);
		}
		String[] froms = regexp.grep(toStringArray(query, ' ', false));
		if (froms == null || froms.length == 0)
			return query;

		int index = 0;
		if (froms[0].length() == 4) {
			index = query.indexOf(froms[0]);
		} else if (froms[0].length() <= 6) {
			index = query.indexOf(froms[0]);
			index += froms[0].toUpperCase().indexOf("FROM");
		} else {
			index = query.indexOf(froms[0]);
			index += froms[0].toUpperCase().indexOf(")FROM") + 1;
		}
		return query.substring(index);
	}

	/**
	 * @param subQuery
	 * @return String
	 */
	private String buildCountString(String subQuery) {
		RE regexp;
		try {
			regexp = new RE("[\\s|\\(]DISTINCT[\\s|\\(]", RE.MATCH_CASEINDEPENDENT);
		} catch (RESyntaxException e) {

			throw new RuntimeException(e);
		}
		boolean distinct = regexp.match(subQuery);

		if (!distinct)
			return " COUNT(*) ";

		char[] chars = subQuery.toCharArray();
		char stopFlag = '\0';
		int startIdx = subQuery.toUpperCase().indexOf("DISTINCT") + 8;
		while (startIdx < chars.length) {
			if (chars[startIdx] == ' ') {
				startIdx++;
				while (chars[startIdx] == ' ')
					startIdx++;
				stopFlag = ' ';
				break;
			} else if (chars[startIdx] == '(') {
				startIdx++;
				stopFlag = ')';
				break;
			}
			startIdx = subQuery.substring(startIdx).toUpperCase().indexOf("DISTINCT") + 8;
		}
		StringBuffer countString = new StringBuffer(" COUNT(DISTINCT ");
		for (; startIdx < chars.length; startIdx++) {
			if (chars[startIdx] == stopFlag)
				break;
			countString.append(chars[startIdx]);
		}
		countString.append(") ");

		return countString.toString();
	}

	/**
	 */
	public static final String[] EMPTY_STRING_ARRAY = new String[0];

	/**
	 * Get the token array split from the input string.
	 * 
	 * @param src the string containing the token
	 * @param sep the token separator string (i.e.: "'", ":", etc)
	 * @param trim trim all the return tokens
	 * @return the token array split from the input string
	 */
	public String[] toStringArray(String src, char sep, boolean trim) {
		if (src == null)
			return null;
		int length = src.length();
		if (length == 0)
			return EMPTY_STRING_ARRAY;

		int count = countChar(src, sep);
		String[] array = new String[count + 1];
		int begin = 0;
		int end = 0;
		for (int i = 0; i <= count; i++) {
			end = src.indexOf(sep, begin);
			if (end == -1) {
				array[i] = begin == length ? "" : (trim ? src.substring(begin).trim() : src.substring(begin));
				break;
			} else {
				array[i] = trim ? src.substring(begin, end).trim() : src.substring(begin, end);
				begin = end + 1;
			}
		}
		return array;
	}

	/**
	 * Return the count of the char in the String if src == null return -1; if
	 * src.length() == 0 return 0;
	 * 
	 * @param src
	 * @param c
	 * @return int
	 */
	public int countChar(String src, char c) {
		if (src == null)
			return -1;
		int length = src.length();
		if (length == 0)
			return 0;

		int count = 0;
		int ch = 0;
		for (int i = 0; i < length; i++) {
			ch = src.charAt(i);
			if (ch == c)
				count++;
		}
		return count;
	}

	public Page<T> pageByHQL(String hql, Object[] params, int offset, int pageSize) throws DAOException {
		Query query = setParameters(getQueryByHQL(hql), params);
		query.setFirstResult(offset);
		query.setMaxResults(pageSize);
		List<T> list = query.list();
		int total = count(hql, params);
		Page<T> page = new Page<T>(offset, pageSize);
		page.setTotal(total);
		page.setDataList(list);
		return page;
	}

	public Page<T> pageByHQL(String hql, String[] name, Object[] params, int offset, int pageSize) throws DAOException {
		Query query = setParameters(getQueryByHQL(hql), name, params);
		query.setFirstResult(offset);
		query.setMaxResults(pageSize);
		List<T> list = query.list();
		int total = count(hql, name, params);
		Page<T> page = new Page<T>(offset, pageSize);
		page.setTotal(total);
		page.setDataList(list);
		return page;
	}

	/**
	 * 判断对象某列的值在数据库中不存在重复
	 * 
	 * @param entity
	 * @param names 在POJO里相对应的属性名,列组合时以逗号分割<br>如"name,loginid,password"
	 * @return boolean
	 */
	public boolean isNotUnique(Object entity, String names) {
		Assert.hasText(names);
		Criteria criteria = getSession().createCriteria(entity.getClass()).setProjection(Projections.rowCount());
		String[] nameList = names.split(",");
		try {
			for (String name : nameList) {
				criteria.add(Restrictions.eq(name, PropertyUtils.getProperty(entity, name)));
			}

			String keyName = getSessionFactory().getClassMetadata(entity.getClass()).getIdentifierPropertyName();
			if (keyName != null) {
				Object id = PropertyUtils.getProperty(entity, keyName);
				// 如果是update,排除自身
				if (id != null)
					criteria.add(Restrictions.not(Restrictions.eq(keyName, id)));
			}
		} catch (Exception e) {
			log.error(e.getMessage());
			return false;
		}
		return ((Integer) criteria.uniqueResult()) > 0;
	}

	/**
	 * @param obj
	 * @return int
	 */
	private int getCount(Object obj) {
		if (obj instanceof Long) {
			Long value = (Long) obj;
			return value.intValue();
		} else if (obj instanceof Integer) {
			Integer value = (Integer) obj;
			return value.intValue();
		}
		return 0;
	}

	@Override
	public List<T> search(String searchTerm) throws SearchException {
		Session sess = getSession();
		FullTextSession txtSession = Search.getFullTextSession(sess);

		org.apache.lucene.search.Query qry;
		try {
			qry = HibernateSearchTools.generateQuery(searchTerm, this.persistentClass, sess, defaultAnalyzer);
		} catch (ParseException ex) {
			throw new SearchException(ex);
		}
		org.hibernate.search.FullTextQuery hibQuery = txtSession.createFullTextQuery(qry,
				this.persistentClass);
		return hibQuery.list();
	}

	@Override
	public List<T> findByNamedQuery(String queryName, Map<String, Object> queryParams) {
		Session sess = getSession();
		Query namedQuery = sess.getNamedQuery(queryName);

		for (String s : queryParams.keySet()) {
			namedQuery.setParameter(s, queryParams.get(s));
		}

		return namedQuery.list();
	}

	@Override
	public void reindex() {
		HibernateSearchTools.reindex(persistentClass, getSessionFactory().getCurrentSession());
	}

	@Override
	public void reindexAll(boolean async) {
		HibernateSearchTools.reindexAll(async, getSessionFactory().getCurrentSession());
	}

	@Override
	public void count(Class<T> clazz, String object, int size,Integer id) {
		getQueryByHQL("update " + clazz.getSimpleName() + " as t set t." + object + "=t." + object + "+" + size+ " where id=" + id).executeUpdate();
	}

}
