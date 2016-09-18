package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.OrderQuery;
import cn.org.eshow.model.Order;
import cn.org.eshow.model.User;
import cn.org.eshow.service.AccessTokenManager;
import cn.org.eshow.service.OrderManager;
import cn.org.eshow.util.OrderUtil;
import cn.org.eshow.webapp.util.Struts2Utils;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 接口
 */
@AllowedMethods({"search",  "delete", "view", "save", "update"})
public class OrderAction extends ApiBaseAction<Order> {

    private static final long serialVersionUID = 4663487175099570373L;

    @Autowired
    private AccessTokenManager accessTokenManager;
    @Autowired
    private OrderManager orderManager;

    private Order order = new Order();
    private OrderQuery query = new OrderQuery();
    private List<Order> orders = new ArrayList<Order>();

    public void save() {
        User old = isValid(accessToken, accessTokenManager);
        if (old == null) {
            expires();//用户信息过期
            return;
        }
        order.setAddTime(new Date());
        order.setNo(OrderUtil.getOrderNo());
        order.setState(0);
        order.setUser(old);
        order = orderManager.save(order);
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"订单保存成功\",\"no\":\"" + order.getNo() + "\"}");
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