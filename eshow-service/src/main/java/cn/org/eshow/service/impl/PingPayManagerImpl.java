package cn.org.eshow.service.impl;

import cn.org.eshow.component.pingpay.config.PingConfig;
import cn.org.eshow.component.pingpay.util.RefundsUtil;
import cn.org.eshow.service.PingPayManager;
import cn.org.eshow.util.TCPIPUtil;
import com.pingplusplus.Pingpp;
import com.pingplusplus.exception.*;
import com.pingplusplus.model.Charge;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.jws.WebService;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@WebService(serviceName = "PingPayService", endpointInterface = "cn.org.eshow.service.PingPayManager")
@Service
public class PingPayManagerImpl implements PingPayManager {

    public PingPayManagerImpl() {
    }

    @Override
    public Charge pay(Charge charge, String orderType) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();
        Pingpp.apiKey = PingConfig.APIKEY;
        Charge temp = null;

        Map<String, Object> chargeMap = new HashMap<String, Object>();
        chargeMap.put("amount", charge.getAmount());//金额
        chargeMap.put("currency", PingConfig.CURRENCY);//货币代码
        chargeMap.put("subject", charge.getSubject());//商品的标题
        chargeMap.put("body", charge.getBody());//商品的描述信息
        chargeMap.put("order_no", charge.getOrderNo());//商户订单号
        chargeMap.put("channel", charge.getChannel());//第三方支付渠道

        Map<String, String> initialMetadata = new HashMap<String, String>();
        initialMetadata.put("order_type", orderType);
        chargeMap.put("metadata", initialMetadata);

        String ip = TCPIPUtil.getIpAddr(request);
        chargeMap.put("client_ip", ip);//客户端ip

        //额外参数
        Map<String, String> extra = new HashMap<String, String>();
        if ("alipay_wap".equals(charge.getChannel())) {//支付宝wap
            extra.put("success_url", PingConfig.SUCCESS_URL);//成功后的跳转界面
            extra.put("cancel_url", PingConfig.CANCEL_URL);//失败后的跳转界面
        }
        chargeMap.put("extra", extra);

        Map<String, String> app = new HashMap<String, String>();
        app.put("id", PingConfig.APPID);//appid
        chargeMap.put("app", app);
        try {
            // 发起交易请求
            temp = Charge.create(chargeMap);
        } catch (PingppException e) {
            e.printStackTrace();
        }
        return temp;
    }

    /**
     * @param amount
     * @param description
     * @param orderType
     * @param chId
     */
    public void refunds(String amount, String description, String orderType, String chId) {
        Pingpp.apiKey = PingConfig.APIKEY;
        Charge ch = null;
        Map<String, Object> refundMap = new HashMap<String, Object>();
        refundMap.put("amount", amount);//退款金额
        refundMap.put("description", description);//退款描述
        Map<String, String> initialMetadata = new HashMap<String, String>();
        initialMetadata.put("order_type", orderType);//退款类型
        refundMap.put("metadata", initialMetadata);
        try {
            ch = Charge.retrieve(chId);
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
        RefundsUtil.refund(ch, refundMap);
    }

}
