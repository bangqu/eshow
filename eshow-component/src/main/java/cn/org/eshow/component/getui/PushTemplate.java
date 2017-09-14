package cn.org.eshow.component.getui;

import com.gexin.rp.sdk.base.payload.APNPayload;
import com.gexin.rp.sdk.template.NotificationTemplate;
import com.gexin.rp.sdk.template.TransmissionTemplate;
import com.gexin.rp.sdk.template.style.Style0;

/**
 * 个推工具类
 */
public class PushTemplate {


    /**
     * 设置推送通知模板
     *
     * @param title
     * @param content
     * @param transmissionContent
     * @return
     */
    public static NotificationTemplate notificationTemplate(String title, String content, String transmissionContent) {
        NotificationTemplate template = new NotificationTemplate();
        // 设置APPID与APPKEY
        template.setAppId(GetuiConfig.appId);
        template.setAppkey(GetuiConfig.appKey);
        // 透传消息设置，1为强制启动应用，客户端接收到消息后就会立即启动应用；2为等待应用启动
        template.setTransmissionType(2);
        template.setTransmissionContent(transmissionContent);
        Style0 style = new Style0();
        // 设置通知栏标题与内容
        style.setTitle(title);
        style.setText(content);
        // 配置通知栏图标
        style.setLogo("icon.png");
        // 配置通知栏网络图标
        style.setLogoUrl("");
        // 设置通知是否响铃，震动，或者可清除
        style.setRing(false);
        style.setVibrate(true);
        style.setClearable(true);
        template.setStyle(style);
        return template;
    }

    /**
     * 设置推送透传消息模板
     *
     * @param content 透传消息内容
     * @return
     */
    public static TransmissionTemplate transmissionTemplate(String title, String content, String transmissionContent) {
        TransmissionTemplate template = new TransmissionTemplate();
        // 设置APPID与APPKEY
        template.setAppId(GetuiConfig.appId);
        template.setAppkey(GetuiConfig.appKey);
        // 透传消息设置，1为强制启动应用，客户端接收到消息后就会立即启动应用；2为等待应用启动
        template.setTransmissionType(2);
        template.setTransmissionContent(transmissionContent);
        APNPayload payload = new APNPayload();
        payload.setContentAvailable(1);
        payload.setSound("default");
        APNPayload.DictionaryAlertMsg alertMsg = new APNPayload.DictionaryAlertMsg();
        alertMsg.setTitle(title);
        alertMsg.setBody(content);
        payload.setAlertMsg(alertMsg);
        template.setAPNInfo(payload);
        return template;
    }

}