package cn.org.eshow.component.msg;

import cn.org.eshow.component.http.HttpServletUitl;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import java.util.ArrayList;
import java.util.List;

/**
 * 发送短信
 */
public class EShowMsg {


    private String phone;//发送手机对象
    private String content;//发送内容
    private String result;//返回信息

    private static String username = "eshow"; //购买用户名 eshow

    private static String pwd = "4eed77ed25291b564dc4";//密码

    private static String url = "http://utf8.sms.webchinese.cn/";//合作网站

    public EShowMsg() {
    }

    public EShowMsg(String phone, String content) {
        this.phone = phone;
        this.content = content;
    }

    /**
     * @return 大于0：成功、-3：短信数量不足、-14：短信内容出现非法字符、-4：手机号格式不正确、-2：短信接口安全密钥不正确
     */
    public String send() {
        try {
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("Uid", username));
            params.add(new BasicNameValuePair("Key", pwd));
            params.add(new BasicNameValuePair("smsMob", phone));
            params.add(new BasicNameValuePair("smsText", content));
            result = HttpServletUitl.doPost(params, url);
        } catch (Exception e) {
            result = "-1";//出现异常定义少于0
        }
        return result;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
