package cn.org.eshow.service;

import com.pingplusplus.model.Charge;

import javax.jws.WebService;

@WebService
public interface PingPayManager {

    /**
     *提交到ping++获取charge对象
     * @param charge
     * @param orderType
     * @return
     */
    Charge pay(Charge charge, String orderType);

    /**
     *
     * @param amount
     * @param description
     * @param orderType
     * @param ch_id
     */
    void refunds(String amount, String description, String orderType, String ch_id);

}
