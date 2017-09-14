package cn.org.eshow.service.impl;

import cn.org.eshow.bean.query.OrderQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.OrderDao;
import cn.org.eshow.model.Order;
import cn.org.eshow.service.OrderManager;
import com.pingplusplus.model.Charge;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.WebService;
import java.util.Date;
import java.util.List;

@WebService(serviceName = "OrderService", endpointInterface = "cn.org.eshow.service.OrderManager")
@Service
public class OrderManagerImpl extends GenericManagerImpl<Order, Integer> implements OrderManager {

    @Autowired
    OrderDao orderDao;

    @Autowired
    public OrderManagerImpl(OrderDao orderDao) {
        super(orderDao);
        this.orderDao = orderDao;
    }

    @Override
    public List<Order> list(OrderQuery query) {
        return orderDao.list(query);
    }

    @Override
    public Page<Order> search(OrderQuery query) {
        return orderDao.search(query);
    }

    @Override
    public Order update(Order old, Order order) {
        old.setUpdateTime(new Date());
        old.setTitle(order.getTitle()!= null ? order.getTitle() : old.getTitle());
        old.setNo(order.getNo()!= null ? order.getNo() : old.getNo());
        old.setChannel(order.getChannel()!= null ? order.getChannel() : old.getChannel());
        old.setPrice(order.getPrice()!= null ? order.getPrice() : old.getPrice());
        old.setState(order.getState()!= null ? order.getState() : old.getState());
        old.setPingId(order.getPingId()!= null ? order.getPingId() : old.getPingId());
        return old;
    }

    @Override
    public void pay(Charge charge) {
        OrderQuery orderQuery = new OrderQuery();
        orderQuery.setNo(charge.getOrderNo().trim());
        orderQuery.setState("0");
        List<Order> orders = orderDao.list(orderQuery);
        if (orders.size() > 0) {
            Order old = orders.get(0);
            old.setUpdateTime(new Date());
            old.setState(1);
            old.setPingId(charge.getId());
            orderDao.save(old);
        }
    }

    @Override
    public void refund(Charge charge) {

    }

}