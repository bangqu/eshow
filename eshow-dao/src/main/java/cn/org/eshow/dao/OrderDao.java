package cn.org.eshow.dao;

import cn.org.eshow.bean.query.OrderQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Order;

import java.util.List;

/**
 * An interface that provides a data management interface to the Order table.
 */
public interface OrderDao extends GenericDao<Order, Integer> {

	List<Order> list(OrderQuery query);

	Page<Order> search(OrderQuery query);
}