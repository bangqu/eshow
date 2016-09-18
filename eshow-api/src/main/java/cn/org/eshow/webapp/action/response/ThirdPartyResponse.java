package cn.org.eshow.webapp.action.response;

/**
 * 第三方平台返回对象
 *
 * @author alicas
 */
public class ThirdPartyResponse {
    public Integer userId;
    public Boolean qq=false;
    public Boolean weixin=false;


    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Boolean getQq() {
        return qq;
    }

    public void setQq(Boolean qq) {
        this.qq = qq;
    }

    public Boolean getWeixin() {
        return weixin;
    }

    public void setWeixin(Boolean weixin) {
        this.weixin = weixin;
    }
}
