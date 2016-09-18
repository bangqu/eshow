package cn.org.eshow.service;

import cn.org.eshow.bean.query.OrderQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Order;
import com.pingplusplus.model.Charge;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface OrderManager extends GenericManager<Order, Integer> {

    /**
     * @param query
     * @return
     */
    List<Order> list(OrderQuery query);

    /**
     * @param query
     * @return
     */
    Page<Order> search(OrderQuery query);

    /**
     * 支付业务
     *
     * @param charge
     */
    void pay(Charge charge);

    /**
     * 退款业务
     *
     * @param charge
     */
    void refund(Charge charge);

}