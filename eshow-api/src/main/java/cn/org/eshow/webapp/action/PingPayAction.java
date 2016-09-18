package cn.org.eshow.webapp.action;

import cn.org.eshow.model.User;
import cn.org.eshow.service.OrderManager;
import cn.org.eshow.service.PingPayManager;
import cn.org.eshow.util.JacksonUtil;
import cn.org.eshow.webapp.util.Struts2Utils;
import com.pingplusplus.model.Charge;
import com.pingplusplus.model.Event;
import com.pingplusplus.model.Webhooks;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.BufferedReader;
import java.io.IOException;

/**
 * Ping++API接口
 */
@AllowedMethods({"pay", "webhooks", "refunds"})
public class PingPayAction extends ApiBaseAction<User> {

    @Autowired
    private PingPayManager pingPayManager;
    @Autowired
    private OrderManager orderManager;

    /**
     * 支付
     */
    public void pay() {
        Charge temp = new Charge();
        temp.setOrderNo(getRequest().getParameter("order_no"));//订单号
        temp.setAmount(Integer.valueOf(getRequest().getParameter("amount")));//订单金额
        temp.setChannel(getRequest().getParameter("channel"));//支付方式
        temp.setSubject(getRequest().getParameter("subject") == null ? "支持一下EShow框架" : getRequest().getParameter("subject"));//商品的标题
        temp.setBody(getRequest().getParameter("body") == null ? "支持一下EShow框架" : getRequest().getParameter("body"));//商品的描述信息
        Charge charge = pingPayManager.pay(temp, getRequest().getParameter("order_type"));
        if (charge != null) {
            Struts2Utils.renderText(JacksonUtil.toJson(charge));
        } else {
            Struts2Utils.renderText("{\"status\":\"0\",\"msg\":\"" + "失败" + "\"}");
        }
    }

    /**
     * 支付回调
     *
     * @throws IOException
     */
    public void webhooks() throws Exception {
        //获取浏览器头部签名
        String signature = getRequest().getHeader("x-pingplusplus-signature");

        //获取数据
        StringBuffer stringBuffer = new StringBuffer();
        try {
            BufferedReader bufferedReader = getRequest().getReader();
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                stringBuffer.append(line);
            }
            bufferedReader.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

//        //校验签名
//        byte[] bytes1 = stringBuffer.toString().getBytes();
//        byte[] bytes2 = Base64.decodeBase64(signature.getBytes());
//        String pubKeyPath = ServletActionContext.getServletContext().getRealPath("/") + "/WEB-INF/classes/my-server.pub";
//        boolean signatureResult;
//        try {
//            signatureResult = WebhooksUtil.verifyData(bytes1, bytes2, WebhooksUtil.getPubKey(pubKeyPath));
//        } catch (Exception e) {
//            signatureResult = false;
//        }
//        if (!signatureResult) {
//            return;
//        }

        // 解析异步通知数据
        Event event = Webhooks.eventParse(stringBuffer.toString());
        Object object = Webhooks.parseEvnet(stringBuffer.toString());

        if ("charge.succeeded".equals(event.getType())) {//支付成功
            if (object instanceof Charge) {
                Charge charge = (Charge) object;
                //支付订单业务
                if ("order".equals(charge.getMetadata().get("order_type"))) {
                    orderManager.pay(charge);
                    Struts2Utils.renderText("{\"status\":\"200\"}");
                }
            }
        } else if ("refund.succeeded".equals(event.getType())) {//退款成功
            if (object instanceof Charge) {
                Charge charge = (Charge) object;
                if ("order".equals(charge.getMetadata().get("order_type"))) {
                    // TODO: 16/3/10  退款业务方法
                    Struts2Utils.renderText("{\"status\":\"200\"}");
                }
            }
        } else {//其他
            Struts2Utils.renderText("{\"status\":\"500\"}");
        }
    }

    /**
     * 退款
     */
    public void refunds() {
        pingPayManager.refunds(getRequest().getParameter("amount"), getRequest().getParameter("description"), getRequest().getParameter("order_type"), getRequest().getParameter("ch_id"));
    }

}
