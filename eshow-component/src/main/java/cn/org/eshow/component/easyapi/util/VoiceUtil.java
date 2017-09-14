package cn.org.eshow.component.easyapi.util;

import cn.org.eshow.component.easyapi.Message;
import cn.org.eshow.component.easyapi.config.Config;

/**
 * 语音验证码工具类
 */
public class VoiceUtil {


    /**
     * 语音验证码播报
     *
     * @param mobile
     * @param name
     * @param code
     * @param channel
     * @return
     */
    public static Message send(String mobile, String name, String code, String channel) {
        String url = Config.url + "voice/send.json";
        String param = "appKey=" + Config.appKey + "&appSecret=" + Config.appSecret;
        param += "&mobile=" + mobile;
        param += "&voiceCode=" + code;
        param += "&channel=" + channel;
        Message message = Comm.comm(url, "", param);
        return message;
    }

}
