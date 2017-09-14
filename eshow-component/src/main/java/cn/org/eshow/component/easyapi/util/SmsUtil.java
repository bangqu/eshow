package cn.org.eshow.component.easyapi.util;

import cn.org.eshow.component.easyapi.Message;
import cn.org.eshow.component.easyapi.config.Config;

/**
 * 短信工具类
 */
public class SmsUtil {

    /**
     * 短信模板保存
     *
     * @param title
     * @param signature
     * @param content
     * @param channel
     * @return
     */
    public static Message save(String title, String signature, String content, String channel) {
        String url = Config.url + "sms/save.json?appKey=" + Config.appKey + "&appSecret=" + Config.appSecret;
        url += "&smsTemplate.title=" + title;
        url += "&smsTemplate.signature=" + signature;
        url += "&smsTemplate.content=" + content;
        url += "&channel=" + channel;
        Message message = Comm.comm(url, "smsTemplate");
        return message;
    }

    /**
     * 短信模板查询
     *
     * @param channel
     * @return
     */
    public static Message list(String channel) {
        String url = Config.url + "sms/list.json?appKey=" + Config.appKey + "&appSecret=" + Config.appSecret;
        url += "&channel=" + channel;
        Message message = Comm.comm(url, "smsTemplates");
        return message;
    }

    /**
     * 短信模板删除
     *
     * @param templateCode
     * @param channel
     * @return
     */
    public static Message delete(String templateCode, String channel) {
        String url = Config.url + "sms/delete.json?appKey=" + Config.appKey + "&appSecret=" + Config.appSecret;
        url += "&templateCode=" + templateCode;
        url += "&channel=" + channel;
        Message message = Comm.comm(url, "");
        return message;
    }

    /**
     * 短信发送
     *
     * @param mobile
     * @param templateCode
     * @param name
     * @param code
     * @param channel
     * @return
     */
    public static Message send(String mobile, String templateCode, String name, String code, String channel) {
        String url = Config.url + "sms/send.json";
        String param = "appKey=" + Config.appKey + "&appSecret=" + Config.appSecret;
        param += "&mobile=" + mobile;
        param += "&templateCode=" + templateCode;
        param += "&vars={\"name\": \"" + name + "\", \"code\": \"" + code + "\"}";
        param += "&channel=" + channel;
        Message message = Comm.comm(url, "", param);
        return message;
    }


    public static void main(String[] args) {
        System.out.println(SmsUtil.save("Eshow身份验证模板", "【Eshow身份验证】", "@var(name)，您好，您的验证码：@var(code)，感谢您的支持。", "code"));
        System.out.println(SmsUtil.save("Eshow登录验证模板", "【Eshow登录验证】", "@var(name)，您好，您的验证码：@var(code)，感谢您的支持。", "code"));
        System.out.println(SmsUtil.save("Eshow注册模板", "【Eshow注册验证】", "@var(name)，您好，您的验证码：@var(code)，感谢您的支持。", "code"));
        System.out.println(SmsUtil.save("Eshow变更模板", "【Eshow变更验证】", "@var(name)，您好，您的验证码：@var(code)，感谢您的支持。", "code"));
//        List<Map<String, String>> list=SmsUtil.list("code").getData();
//        for(int i=0;i<list.size();i++){
//            Map<String, String> da=list.get(i);
//            SmsUtil.delete(String.valueOf(da.get("templateCode")),"code");
//        }
//        System.out.println(SmsUtil.list("code").getData());
//        System.out.println(SmsUtil.send("13815129971", Config.REGISTER, "张凌辉", "123456", "code").getStatus());
    }

}
