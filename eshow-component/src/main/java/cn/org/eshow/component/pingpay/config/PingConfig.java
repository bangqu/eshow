package cn.org.eshow.component.pingpay.config;

/**
 * Created by alicas on 15/8/18.
 */
public class PingConfig {
    public static String APPID = "app_PWv90Ofb5yr1ynbD";
    public static String APIKEY = "sk_live_KOi1yT8uXXL4TGWzH4XnT8CC";
    public static String CURRENCY = "cny";

    //Extra参数
    public static String SUCCESS_URL = "http://api.eshow.org.cn/pingpay/success.jsp";//支付成功
    public static String CANCEL_URL = "http://api.eshow.org.cn/pingpay/cancel.jsp";//支付取消
    public static String FAIL_URL = "http://api.eshow.org.cn/pingpay/fail.jsp";//支付失败


}
