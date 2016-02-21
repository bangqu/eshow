package cn.org.eshow.component.xinge;

import cn.org.eshow.component.xinge.json.JSONObject;
import org.apache.commons.lang.StringUtils;

import java.util.HashMap;
import java.util.Map;

public class XingeUtil {

    static final long USER_ACCESSID = 1;
    static final String USER_SECRETKEY = "";
    public static final long ANDROID_ACCESSID = 2100033316; //Android用户版
    public static final String ANDROID_SECRETKEY = "e6d76044293039fbf1244d96213a05f6"; //Android用户版
    public static final long ANDROID_SHOP_ACCESSID = 2100033314; //Android商户版
    public static final String ANDROID_SHOP_SECRETKEY = "67169badec1498d7e3bc1f5e032424c2"; //Android商户版
    public static final long IOS_ACCESSID = 2200034314l; //IOS用户版
    public static final String IOS_SECRETKEY = "cf964814437e67aa1ebeb4eb7e1569ac"; //IOS用户版
    public static final long IOS_SHOP_ACCESSID = 2200034312l; //IOS商户版
    public static final String IOS_SHOP_SECRETKEY = "234f35b1ee95a7b8188b8892f92708aa"; //IOS商户版
    public static final long IOS_FIR_SHOP_ACCESSID = 2200037863l; //IOS企业商户版
    public static final String IOS_FIR_SHOP_SECRETKEY = "095e01678920b1550cafc6a4c0417b17"; //IOS企业商户版
    public static final long IOS_FIR_ACCESSID = 2200037863l; //IOS企业用户版
    public static final String IOS_FIR_SECRETKEY = "095e01678920b1550cafc6a4c0417b17"; //IOS企业用户版

    public static final String SAVE_ORDER_TITLE = "您有新的订单,请尽快处理！";   //新订单推送消息
    public static final String REMIND_ORDER_TITLE = "买家提醒发货，请尽快处理！";  //买家提醒发货
    public static final String CANCEL_ORDER_TITLE = "您的订单被取消了！";  //卖家取消订单
    public static final String SEND_ORDER_TITLE = "您的订单已配送！";  //订单已配送

    public static final String POST_TITLE = "您有新的小区公告";  //新的小区公告
    public static final String COMPANYSERVICE_TITLE = "您可以畅享新的物业增值服务";  //新的小区公告
    public static final String REPAIR_WORK__TITLE = "您的物业报修已派工";  //物业报修已派工
    public static final String REPAIR_VISIT_TITLE = "您的物业报修已回访";  //物业报修已回访
    public static final String REPAIR_CANCEL_TITLE = "您的物业报修已取消";  //物业报修已取消
    public static final String FEEDBACK_TITLE = "您的意见反馈已回复";  //意见反馈已回复
    public static final String CARD_SUCCESS_TITLE = "您的会员卡申请已审核通过";  //会员卡审核通过
    public static final String CARD_REJECT_TITLE = "您的会员卡申请已驳回";  //会员卡审核驳回
    public static final String CARD_RECHARGE_TITLE = "您的会员卡充值成功";  //物业公司会员卡充值成功

    //Android通知样式
    public static final Integer ANDROID_CANCEL_ORDER_BUILDER = 7;  //android卖家取消订单--通知用户
    public static final Integer ANDROID_SAVE_ORDER_BUILDER = 2;  //android买家下单--通知商家
    public static final Integer ANDROID_SEND_ORDER_BUILDER = 8;  //android卖家配送订单--通知用户
    public static final Integer ANDROID_RMIND_ORDER_BUILDER = 4;  //android买家提醒发货--通知商家
    public static final Integer ANDROID_POST_BUILDER = 5;//新小区公告推送


    //IOS通知声音
    public static final String IOS_SAVE_ORDER_SOUND = "save";  //iphone买家下单--通知商家
    public static final String IOS_CANCEL_ORDER_SOUND = "cancel";  //iphone卖家取消订单--通知用户
    public static final String IOS_SEND_ORDER_SOUND = "send";  //iphone卖家配送订单--通知用户
    public static final String IOS_RMIND_ORDER_SOUND = "remind";  //iphone买家提醒发货--通知商家
    public static final String IOS_POST_SOUND = "post";  //小区公告

    public static final String SHOP_ICON = "push_bg.png";
    public static final String SHOP_ORDER_SAVE_ORDER_ACTIVITY = "HomeOrderManageActivity";

    //下发单个账号
    public static JSONObject pushSingleAccountAndroid(long accessId, String secretKey, String account, Integer builderId, String title, String content) {
        XingeApp xinge = new XingeApp(accessId, secretKey);
        Style style = new Style(builderId, 1, 0, 1, 0);
        ClickAction clickAction = new ClickAction();
        clickAction.setActionType(1);

        Message message = new Message();
        message.setTitle(title);
        message.setContent(content);
//        message.setExpireTime(86400);
        TimeInterval acceptTime1 = new TimeInterval(0, 0, 23, 59);
        message.addAcceptTime(acceptTime1);
        message.setType(Message.TYPE_NOTIFICATION);
        message.setMultiPkg(1);
        message.setStyle(style);
        message.setAction(clickAction);

        JSONObject ret = xinge.pushSingleAccount(3, account, message);
        return (ret);
    }


    //下发单个设备
    public static JSONObject pushSingleDeviceAndroid(long accessId, String secretKey, String token, Integer builderId, String title, String content) {
        XingeApp xinge = new XingeApp(accessId, secretKey);
        Style style = null;
        style = new Style(builderId, 1, 0, 1, 0);

        ClickAction clickAction = new ClickAction();
        clickAction.setActionType(1);

        Message message = new Message();
        message.setTitle(title);
        message.setContent(content);
//        message.setExpireTime(86400);
        TimeInterval acceptTime1 = new TimeInterval(0, 0, 23, 59);
        message.addAcceptTime(acceptTime1);
        message.setType(Message.TYPE_NOTIFICATION);
        message.setMultiPkg(1);
        message.setStyle(style);
        message.setAction(clickAction);

        JSONObject ret = xinge.pushSingleDevice(token, message);
        return (ret);
    }

    //下发单个设备
    public static JSONObject pushSingleDeviceAndroid(long accessId, String secretKey, String token, Integer builderId, String icon, String activity, String title, String content) {
        XingeApp xinge = new XingeApp(accessId, secretKey);
        Style style = null;
        if (!StringUtils.isEmpty(icon)) {
            style = new Style(builderId, 1, 0, 1, 0, 1, 0, 0);
            style.setIconRes(icon);
        } else {
            style = new Style(builderId, 1, 0, 1, 0);
        }

        ClickAction clickAction = new ClickAction();
        clickAction.setActionType(1);
        if (!StringUtils.isEmpty(activity)) {
            clickAction.setActivity(activity);
        }

        Message message = new Message();
        message.setTitle(title);
        message.setContent(content);
//        message.setExpireTime(86400);
        TimeInterval acceptTime1 = new TimeInterval(0, 0, 23, 59);
        message.addAcceptTime(acceptTime1);
        message.setType(Message.TYPE_NOTIFICATION);
        message.setMultiPkg(1);
        message.setStyle(style);
        message.setAction(clickAction);

        JSONObject ret = xinge.pushSingleDevice(token, message);
        return (ret);
    }

    //下发单个设备(包含key、value)
    public static JSONObject pushSingleDeviceAndroid(long accessId, String secretKey, String token, Integer builderId, String title, String content, String activity, String key, String value, String icon) {
        XingeApp xinge = new XingeApp(accessId, secretKey);
        Style style = new Style(builderId, 1, 0, 1, 0);
        if (!StringUtils.isEmpty(icon)) {
            style.setIconRes(icon);
            style.setSmallIcon(icon);
        }

        ClickAction clickAction = new ClickAction();
        clickAction.setActionType(1);
        if (!StringUtils.isEmpty(activity)) {
            clickAction.setActivity(activity);
        }

        Message message = new Message();
        message.setTitle(title);
        message.setContent(content);
//        message.setExpireTime(86400);
        TimeInterval acceptTime1 = new TimeInterval(0, 0, 23, 59);
        message.addAcceptTime(acceptTime1);
        message.setType(Message.TYPE_NOTIFICATION);
        message.setMultiPkg(1);
        message.setStyle(style);
        message.setAction(clickAction);

        Map map = new HashMap();
        map.put(key, value);
        message.setCustom(map);


        JSONObject ret = xinge.pushSingleDevice(token, message);
        return (ret);
    }

    //下发单个设备(包含key、value的map)
    public static JSONObject pushSingleDeviceAndroid(long accessId, String secretKey, String token, Integer builderId, String title, String content, String activity,Map map, String icon) {
        XingeApp xinge = new XingeApp(accessId, secretKey);
        Style style = new Style(builderId, 1, 0, 1, 0);
        if (!StringUtils.isEmpty(icon)) {
            style.setIconRes(icon);
            style.setSmallIcon(icon);
        }

        ClickAction clickAction = new ClickAction();
        clickAction.setActionType(1);
        if (!StringUtils.isEmpty(activity)) {
            clickAction.setActivity(activity);
        }

        Message message = new Message();
        message.setTitle(title);
        message.setContent(content);
//        message.setExpireTime(86400);
        TimeInterval acceptTime1 = new TimeInterval(0, 0, 23, 59);
        message.addAcceptTime(acceptTime1);
        message.setType(Message.TYPE_NOTIFICATION);
        message.setMultiPkg(1);
        message.setStyle(style);
        message.setAction(clickAction);

        message.setCustom(map);


        JSONObject ret = xinge.pushSingleDevice(token, message);
        return (ret);
    }

    //给用户推送消息命令
    public static JSONObject pushSingleDevice(String token, String key, String value, String content) {
        XingeApp xingeAndroid = new XingeApp(ANDROID_ACCESSID, ANDROID_SECRETKEY);
        Message message = new Message();
        message.setType(Message.TYPE_MESSAGE);
        message.setMultiPkg(1);
        message.setTitle(key);
        message.setContent(value);
        Map mapA = new HashMap();
        mapA.put(key, value);
        message.setCustom(mapA);
        xingeAndroid.pushSingleDevice(token, message);

        XingeApp xingeIos = new XingeApp(IOS_ACCESSID, IOS_SECRETKEY);
        MessageIOS messageIos = new MessageIOS();
        messageIos.setAlert(content);
        messageIos.setBadge(1);
        messageIos.setSound("sound");
        TimeInterval acceptTime = new TimeInterval(0, 0, 23, 59);
        messageIos.addAcceptTime(acceptTime);
        Map map = new HashMap();
        map.put(key, value);
        messageIos.setCustom(map);

        JSONObject ret = xingeIos.pushSingleDevice(token, messageIos, XingeApp.IOSENV_DEV);
        return (ret);
    }

    //下发IOS单个设备
    public static JSONObject sendIOS(String token, String content, String key, String value) {
        XingeApp xingeIos = new XingeApp(IOS_ACCESSID, IOS_SECRETKEY);
        MessageIOS messageIos = new MessageIOS();
        messageIos.setAlert(content);
        messageIos.setBadge(1);
        messageIos.setSound("sound");
        TimeInterval acceptTime = new TimeInterval(0, 0, 23, 59);
        messageIos.addAcceptTime(acceptTime);
        Map map = new HashMap();
        map.put(key, value);
        messageIos.setCustom(map);

        JSONObject ret = xingeIos.pushSingleDevice(token, messageIos, XingeApp.IOSENV_DEV);
        return (ret);
    }

    //下发IOS单个设备
    public static JSONObject pushSingleDeviceIOS(long accessId, String secretKey, String deviceToken, String sound, String content) {
        XingeApp xinge = new XingeApp(accessId, secretKey);
        ClickAction clickAction = new ClickAction();
        clickAction.setActionType(1);

        MessageIOS message = new MessageIOS();
//        message.setExpireTime(86400);
        message.setAlert(content);
        message.setBadge(1);
        message.setSound(sound);
        TimeInterval acceptTime = new TimeInterval(0, 0, 23, 59);
        message.addAcceptTime(acceptTime);

        JSONObject ret = xinge.pushSingleDevice(deviceToken, message, XingeApp.IOSENV_PROD);
        return (ret);
    }

    //下发IOS单个账号
    public static JSONObject pushSingleAccountIOS(long accessId, String secretKey, String account, String content) {
        XingeApp xinge = new XingeApp(accessId, secretKey);
        ClickAction clickAction = new ClickAction();
        clickAction.setActionType(1);

        MessageIOS message = new MessageIOS();
//        message.setExpireTime(86400);
        message.setAlert(content);
        message.setBadge(1);
        message.setSound("beep.wav");
        TimeInterval acceptTime = new TimeInterval(0, 0, 23, 59);
        message.addAcceptTime(acceptTime);

        JSONObject ret = xinge.pushSingleAccount(4, account, message, XingeApp.IOSENV_DEV);
        return (ret);
    }


    //下发IOS单个设备（包含map）
    public static JSONObject pushSingleDeviceIOS(long accessId, String secretKey, String deviceToken, String sound, String content,Map map) {
        XingeApp xinge = new XingeApp(accessId, secretKey);
        ClickAction clickAction = new ClickAction();
        clickAction.setActionType(1);

        MessageIOS message = new MessageIOS();
//        message.setExpireTime(86400);
        message.setAlert(content);
        message.setBadge(1);
        message.setSound(sound);
        message.setCustom(map);
        TimeInterval acceptTime = new TimeInterval(0, 0, 23, 59);
        message.addAcceptTime(acceptTime);

        JSONObject ret = xinge.pushSingleDevice(deviceToken, message, XingeApp.IOSENV_PROD);
        return (ret);
    }

    public static void main(String[] args) {
//        XingeApp xinge = new XingeApp(IOS_ACCESSID, IOS_SECRETKEY);
//        ClickAction clickAction = new ClickAction();
//        clickAction.setActionType(1);
//
//        MessageIOS message = new MessageIOS();
////        message.setExpireTime(86400);
//        message.setAlert("有新赞");
//        message.setBadge(1);
//        message.setSound("sound");
//        TimeInterval acceptTime = new TimeInterval(0, 0, 23, 59);
//        message.addAcceptTime(acceptTime);
//        Map map = new HashMap();
//        map.put("topicDetail", "12");
//        message.setCustom(map);
//
//        JSONObject ret = xinge.pushSingleDevice("0e85058fc00f99643ea517447c57336623a015f8757a01028dc0e5cf37b597e0", message, XingeApp.IOSENV_DEV);
//        System.out.print(ret);

//        XingeApp xingeAndroid = new XingeApp(ANDROID_ACCESSID, ANDROID_SECRETKEY);
//        Message message = new Message();
//        message.setType(Message.TYPE_MESSAGE);
//        message.setMultiPkg(1);
//        message.setTitle("new-post");
//        message.setContent("true");
//        Map mapA = new HashMap();
//        mapA.put("new-post", "true");
//        message.setCustom(mapA);
//        JSONObject ret = xingeAndroid.pushSingleDevice("069753c86d4f6d9a4440972af9678d6321469acd", message);
//        System.out.print(ret);
//        JSONObject ret =pushSingleDeviceIOS(IOS_ACCESSID,IOS_SECRETKEY,"5e9738eb83e1a047ac1e0de713a53ea40b784f2fe454f8525f2bbbd4ee28b18b",IOS_SAVE_ORDER_SOUND,"新订单");
//        JSONObject ret =pushSingleDeviceAndroid(ANDROID_ACCESSID, ANDROID_SECRETKEY, "7eabf8e00e2ea1f54d9abc9dad8e3f99b7594d88", 2, "新公告","新公告",null,"type","post",null);
        JSONObject ret = pushSingleDeviceAndroid(ANDROID_SHOP_ACCESSID, ANDROID_SHOP_SECRETKEY, "5fe27fc95b70c44a4dbdab0314c1cb10ec138f42", 2, XingeUtil.SHOP_ICON, XingeUtil.SHOP_ORDER_SAVE_ORDER_ACTIVITY, "新订单", "新订单");
        System.out.println(ret);
    }

}
