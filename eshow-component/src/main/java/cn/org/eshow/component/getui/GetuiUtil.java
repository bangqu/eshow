package cn.org.eshow.component.getui;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gexin.rp.sdk.base.IPushResult;
import com.gexin.rp.sdk.base.impl.SingleMessage;
import com.gexin.rp.sdk.base.impl.Target;
import com.gexin.rp.sdk.base.payload.APNPayload;
import com.gexin.rp.sdk.exceptions.RequestException;
import com.gexin.rp.sdk.http.IGtPush;
import com.gexin.rp.sdk.template.APNTemplate;
import com.gexin.rp.sdk.template.NotificationTemplate;
import com.gexin.rp.sdk.template.TransmissionTemplate;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

/**
 * 个推工具类
 */
public class GetuiUtil {

    /**
     * 安卓设备推送消息
     *
     * @param clientId            设备号
     * @param title               标题
     * @param content             内容
     * @param transmissionContent 透传消息内容
     */
    public static void pushMessageToSingle(String clientId, String title, String content, String transmissionContent) {
        // https连接
        IGtPush push = new IGtPush(GetuiConfig.appKey, GetuiConfig.masterSecret, true);
        // 此处true为https域名，false为http，默认为false。Java语言推荐使用此方式
        // IGtPush push = new IGtPush(host, appkey, master);
        // host为域名，根据域名区分是http协议/https协议
        NotificationTemplate template = PushTemplate.notificationTemplate(title, content, transmissionContent);
        SingleMessage message = new SingleMessage();
        message.setOffline(true);
        // 离线有效时间，单位为毫秒，可选
        message.setOfflineExpireTime(24 * 3600 * 1000);
        message.setData(template);
        message.setPushNetWorkType(0); // 可选，判断是否客户端是否wifi环境下推送，1为在WIFI环境下，0为不限制网络环境。
        Target target = new Target();
        target.setAppId(GetuiConfig.appId);
        target.setClientId(clientId);
        // 用户别名推送，cid和用户别名只能2者选其一
        // String alias = "个";
        // target.setAlias(alias);
        IPushResult ret = null;
        try {
            ret = push.pushMessageToSingle(message, target);
        } catch (RequestException e) {
            e.printStackTrace();
            ret = push.pushMessageToSingle(message, target, e.getRequestId());
        }
        if (ret != null) {
            System.out.println(ret.getResponse().toString());
        } else {
            System.out.println("服务器响应异常");
        }
    }

    /**
     * iOS设备推送消息
     *
     * @param deviceToken 设备号
     * @param title       标题
     * @param content     内容
     */
    public static void pushAPNMessageToSingle(String deviceToken, String title, String content) {
        IGtPush push = new IGtPush(GetuiConfig.appKey, GetuiConfig.masterSecret);
        APNTemplate template = new APNTemplate();
        APNPayload apnpayload = new APNPayload();
        apnpayload.setSound("");
        //apn高级推送
        APNPayload.DictionaryAlertMsg alertMsg = new APNPayload.DictionaryAlertMsg();
        ////通知文本消息标题
        alertMsg.setTitle(title);
        //通知文本消息字符串
        alertMsg.setBody(content);
        //对于标题指定执行按钮所使用的Localizable.strings,仅支持IOS8.2以上版本
//        alertMsg.setTitleLocKey("ccccc");
        //指定执行按钮所使用的Localizable.strings
//        alertMsg.setActionLocKey("ddddd");
        apnpayload.setAlertMsg(alertMsg);
        template.setAPNInfo(apnpayload);
        SingleMessage singleMessage = new SingleMessage();
        singleMessage.setData(template);
        IPushResult ret0 = push.pushAPNMessageToSingle(GetuiConfig.appId, deviceToken, singleMessage);
        System.out.println(ret0.getResponse());
    }

    /**
     * 推送透传消息
     *
     * @param clientId 设备号
     * @param content  内容
     */
    public static void pushTransmissionMessageToSingle(String clientId, String title, String content, String transmissionContent) {
        // https连接
        IGtPush push = new IGtPush(GetuiConfig.appKey, GetuiConfig.masterSecret, true);
        // 此处true为https域名，false为http，默认为false。Java语言推荐使用此方式
        // IGtPush push = new IGtPush(host, appkey, master);
        // host为域名，根据域名区分是http协议/https协议
        TransmissionTemplate template = PushTemplate.transmissionTemplate(title, content, transmissionContent);
        SingleMessage message = new SingleMessage();
        message.setOffline(true);
        // 离线有效时间，单位为毫秒，可选
        message.setOfflineExpireTime(24 * 3600 * 1000);
        message.setData(template);
        message.setPushNetWorkType(0); // 可选，判断是否客户端是否wifi环境下推送，1为在WIFI环境下，0为不限制网络环境。
        Target target = new Target();
        target.setAppId(GetuiConfig.appId);
        target.setClientId(clientId);
        // 用户别名推送，cid和用户别名只能2者选其一
        // String alias = "个";
        // target.setAlias(alias);
        IPushResult ret = null;
        try {
            ret = push.pushMessageToSingle(message, target);
        } catch (RequestException e) {
            e.printStackTrace();
            ret = push.pushMessageToSingle(message, target, e.getRequestId());
        }
        if (ret != null) {
            System.out.println(ret.getResponse().toString());
        } else {
            System.out.println("服务器响应异常");
        }
    }


    /**
     * 推送消息
     *
     * @param clientId
     * @param title
     * @param description
     * @param model
     * @param modelVal
     */
    public static void pushMessage(String clientId, String title, String description, String model, String modelVal) {
        Map map = new HashMap();
        map.put("title", title);
        map.put("description", description);
        map.put("model", model);
        map.put("modelVal", modelVal);
        GetuiUtil.pushTransmissionMessageToSingle(clientId, title, description, toJson(map));
    }

    /**
     * 转JSON
     *
     * @param object
     * @return
     */
    public static String toJson(Object object) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
        try {
            return mapper.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            return "";
        }
    }


    public static void main(String[] args) {
        //d16fb980d6506e46615885ac41c926e3
        //c3c358d4167c35958d22cf84279109e49aa77276fae29123b5ec724218e16222
//        pushMessage("d16fb980d6506e46615885ac41c926e3", "", "测试", "内容", "{\n" +
//                "status: \"-9\",\n" +
//                "msg: \"用户信息过期，请重新登录\"\n" +
//                "}");
        //pushTransmissionMessageToSingle("", "", "", "");
        pushMessage("23f539f90e91ce61d04a2c75fc6c8a5c", "测试", "测试", "url", "http://www.baidu.com");
    }
}