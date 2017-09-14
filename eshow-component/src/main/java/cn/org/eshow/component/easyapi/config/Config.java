package cn.org.eshow.component.easyapi.config;

/**
 * Created by alicasagile on 16/4/11.
 */
public class Config {

    public static String appKey = "7m43w82pnL9Y9C14";
    public static String appSecret = "4n1n58hhn406ya68";
    public static String url = "https://api.easyapi.com/";

    //短信模板
    public static String IDENTITY = "9EQzc1";//身份验证模板
    public static String SIGNUP = "y4VSX3";//注册模板
    public static String PASSWORD = "zJPS9";//变更模板
    public static String LOGIN = "V66Hz2";//登录模板

    public static String getTemplateName(String type) {
        if (type.equals("login")) {
            return LOGIN;
        } else if (type.equals("signup")) {
            return SIGNUP;
        } else if (type.equals("password")) {
            return PASSWORD;
        } else if (type.equals("identity")) {
            return IDENTITY;
        }
        return "";
    }

}
