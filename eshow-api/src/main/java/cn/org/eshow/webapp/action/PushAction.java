package cn.org.eshow.webapp.action;

import org.apache.struts2.convention.annotation.AllowedMethods;

/**
 * 推送API接口
 */
@AllowedMethods({"notification", "message"})
public class PushAction extends ApiBaseAction<String> {

    private String deviceToken;//设备号
    private String platform;//平台(android,ios)

    /**
     * 推送消息通知
     */
    public void notification() {
        if (platform.equals("android")) {
            //XingeUtil.pushSingleDeviceAndroid(XingeVar.ANDROID_ACCESSID, XingeVar.ANDROID_SECRETKEY, deviceToken, 1, XingeVar.NOTIFICATION_TITLE, "EShow为您演示如何进行信鸽消息推送.");
        } //else
        // XingeUtil.pushSingleDeviceIOS(XingeVar.IOS_ACCESSID, XingeVar.IOS_SECRETKEY, deviceToken, "", "EShow为您演示如何进行信鸽消息推送.");
    }

    /**
     * 推送透传消息
     */
    public void message() {
        //推送信鸽透传消息到旧设备上
        // XingeUtil.pushSingleDeviceMessage(XingeVar.ANDROID_ACCESSID, XingeVar.ANDROID_SECRETKEY, deviceToken, "new-message", RandomCodeUtil.numberCode(2).toString());
    }

    public String getDeviceToken() {
        return deviceToken;
    }

    public void setDeviceToken(String deviceToken) {
        this.deviceToken = deviceToken;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }
}
