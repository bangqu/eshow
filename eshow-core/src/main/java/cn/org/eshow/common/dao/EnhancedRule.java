package cn.org.eshow.common.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 增强型的规则对象,主要是包装了简单的查询条件和排序规则,可以转化成SQL查询的where条件
 * <p>
 * 
 * @author leida
 */
public class EnhancedRule implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 偏移量
	 */
	private int offset;

	/**
	 * 页大小
	 */
	private int pageSize;

	/**
	 * 条件表达式
	 */
	private List<Criterion> criterionList = new ArrayList<Criterion>();

	/**
	 * 排序表达式
	 */
	private List<Order> orderList = new ArrayList<Order>();

	/**
	 * 
	 */
	public EnhancedRule() {
		clear();
	}

	/**
	 * Add a <tt>Criterion</tt> to constrain the results to be retrieved.
	 * 
	 * @param criterion
	 * @return EnhancedRule
	 */
	public EnhancedRule add(Criterion criterion) {
		criterionList.add(criterion);
		return this;
	}

	/**
	 * Add an <tt>Order</tt> to the result set.
	 * 
	 * @param order
	 * @return EnhancedRule
	 */
	public EnhancedRule addOrder(Order order) {
		orderList.add(order);
		return this;
	}

	/**
	 * Set a limit upon the number of objects to be retrieved.
	 * 
	 * @param pagesize the maximum number of results
	 * @return EnhancedRule
	 */
	public EnhancedRule setPageSize(int pagesize) {
		this.pageSize = pagesize;
		return this;
	}

	/**
	 * Set the first result to be retrieved.
	 * 
	 * @param offset
	 * @return EnhancedRule
	 */
	public EnhancedRule setOffset(int offset) {
		this.offset = offset;
		return this;
	}

	/**
	 * @return int
	 */
	public int getOffset() {
		return offset;
	}

	/**
	 * @return int
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 根据对象类型和Session对象取得Hibernate的Criteria对象
	 * 
	 * @param clazz
	 * @param session
	 * @return Criteria
	 */
	public Criteria getCriteria(Class<?> clazz, Session session) {
		Criteria criteria = session.createCriteria(clazz);
		for (int i = 0; i < criterionList.size(); i++) {
			Criterion criterion = criterionList.get(i);
			criteria.add(criterion);
		}
		for (int i = 0; i < orderList.size(); i++) {
			Order order = orderList.get(i);
			criteria.addOrder(order);
		}
		if (offset > 0) {
			criteria.setFirstResult(this.offset);
		}
		if (pageSize > 0) {
			criteria.setMaxResults(this.pageSize);
		}
		criteria.setCacheable(true);
		return criteria;
	}

	/**
	 * 根据对象类型和Session对象取得查询数量的Criteria对象
	 * 
	 * @param clazz
	 * @param session
	 * @return Criteria
	 */
	public Criteria getCountCriteria(Class<?> clazz, Session session) {
		Criteria criteria = session.createCriteria(clazz);
		for (int i = 0; i < criterionList.size(); i++) {
			Criterion criterion = criterionList.get(i);
			criteria.add(criterion);
		}
		criteria.setProjection(Projections.rowCount());
		return criteria;
	}

	/**
	 * 
	 */
	public void clear() {
		this.offset = 0;
		this.pageSize = -1;
		this.criterionList.clear();
		this.orderList.clear();
	}

	@Override
	public String toString() {
		String rule = null;
		for (int i = 0; i < criterionList.size(); i++) {
			Criterion criterion = criterionList.get(i);
			if (rule == null) {
				rule = criterion.toString();
			}
			else {
				rule += " and " + criterion.toString();
			}
		}
		for (int i = 0; i < orderList.size(); i++) {
			Order order = orderList.get(i);
			rule += " " + order.toString();
		}
		return rule;
	}

	/**
	 * 取得该EnhancedRule所包括的Criterion实例集合
	 * 
	 * @return List<Criterion>
	 */
	public List<Criterion> getCriterionList() {
		return this.criterionList;
	}

	/**
	 * @return List<Order>
	 */
	public List<Order> getOrderList() {
		return orderList;
	}
}
