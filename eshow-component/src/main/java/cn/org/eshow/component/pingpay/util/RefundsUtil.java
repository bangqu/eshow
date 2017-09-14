package cn.org.eshow.component.pingpay.util;

import com.pingplusplus.exception.*;
import com.pingplusplus.model.Charge;
import com.pingplusplus.model.Refund;

import java.util.Map;

/**
 * Created by alicas on 15/8/24.
 */
public class RefundsUtil {

    /**
     * 查询退款
     * 根据 Id 查询退款记录。需要传递 charge。
     * 参考文档：https://pingxx.com/document/api#api-r-inquiry
     *
     * @param id
     * @param charge
     */
    public static void retrieve(String id, Charge charge) {
        try {
            Refund refund = charge.getRefunds().retrieve(id);
            System.out.println(refund);
        } catch (AuthenticationException e) {
            e.printStackTrace();
        } catch (InvalidRequestException e) {
            e.printStackTrace();
        } catch (APIConnectionException e) {
            e.printStackTrace();
        } catch (APIException e) {
            e.printStackTrace();
        } catch (ChannelException e) {
            e.printStackTrace();
        } catch (RateLimitException e) {
            e.printStackTrace();
        }
    }

    /**
     * 退款
     * 创建退款，需要先获得 charge ,然后调用 charge.getRefunds().create();
     * 参数具体说明参考：https://pingxx.com/document/api#api-r-new
     * 可以一次退款，也可以分批退款。
     *
     * @param charge
     * @param refundMap
     * @return
     */
    public static Refund refund(Charge charge,Map<String, Object> refundMap) {
        Refund refund = null;
        try {
            refund = charge.getRefunds().create(refundMap);
        } catch (AuthenticationException e) {
            e.printStackTrace();
        } catch (InvalidRequestException e) {
            e.printStackTrace();
        } catch (APIConnectionException e) {
            e.printStackTrace();
        } catch (APIException e) {
            e.printStackTrace();
        } catch (ChannelException e) {
            e.printStackTrace();
        } catch (RateLimitException e) {
            e.printStackTrace();
        }
        return refund;
    }
}
