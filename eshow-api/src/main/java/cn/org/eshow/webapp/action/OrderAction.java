package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.OrderQuery;
import cn.org.eshow.model.Order;
import cn.org.eshow.model.User;
import cn.org.eshow.service.OrderManager;
import cn.org.eshow.util.OrderUtil;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

/**
 * 订单API接口
 */
@AllowedMethods({"search", "delete", "view", "save", "update"})
public class OrderAction extends ApiBaseAction<Order> {

    private static final long serialVersionUID = 4663487175099570373L;

    @Autowired
    private OrderManager orderManager;

    private Order order = new Order();
    private OrderQuery query = new OrderQuery();
    private List<Order> orders = new ArrayList<Order>();

    /**
     * 提交订单
     */
    public void save() {
        User old = accessTokenManager.isValid(accessToken);
        if (old == null) {
            RenderUtil.expires();//用户信息过期
            return;
        }
        order.setAddTime(new Date());
        order.setNo(OrderUtil.getOrderNo());
        order.setState(0);
        order.setUser(old);
        order = orderManager.save(order);
        Map<String, String> map = new HashMap<String, String>();
        map.put("no", order.getNo());
        RenderUtil.result(1, "订单保存成功", map);
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public OrderQuery getQuery() {
        return query;
    }

    public void setQuery(OrderQuery query) {
        this.query = query;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }
}