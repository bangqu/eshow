package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.OrderQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Order;
import cn.org.eshow.service.OrderManager;
import cn.org.eshow.util.PageUtil;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Results({@Result(name = "input", location = "add"),
        @Result(name = "list", type = "redirect", location = ""),
        @Result(name = "success", type = "redirect", location = "view/${id}"),
        @Result(name = "redirect", type = "redirect", location = "${redirect}")})
@AllowedMethods({"list", "search", "delete", "view", "update", "save"})
public class OrderAction extends BaseAction {

    private static final long serialVersionUID = 1L;

    @Autowired
    private OrderManager orderManager;

    private List<Order> orders;
    private Order order;
    private OrderQuery query = new OrderQuery();
    private Integer orderCategoryId;

    /**
     * @return
     */
    public String search() {
        Page<Order> page = orderManager.search(query);
        orders = page.getDataList();
        saveRequest("page", PageUtil.conversion(page));
        return LIST;
    }

    /**
     *
     */
    public void delete() {
        order = orderManager.get(id);
        orderManager.save(order);
        RenderUtil.success("删除成功");
    }

    /**
     * @return
     */
    public String view() {
        if (id != null) {
            order = orderManager.get(id);
        }
        return NONE;
    }

    /**
     * @return
     * @throws Exception
     */
    public String update() throws Exception {
        Order old = orderManager.get(id);
        orderManager.update(old, order);
        saveMessage("修改成功");
        return REDIRECT;
    }

    /**
     * @return
     * @throws Exception
     */
    public String save() throws Exception {
        order.setUser(getSessionUser());
        order = orderManager.save(order);
        saveMessage("添加成功");
        id = order.getId();
        return REDIRECT;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public Integer getOrderCategoryId() {
        return orderCategoryId;
    }

    public void setOrderCategoryId(Integer orderCategoryId) {
        this.orderCategoryId = orderCategoryId;
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

}