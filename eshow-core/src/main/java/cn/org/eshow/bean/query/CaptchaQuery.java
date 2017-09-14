package cn.org.eshow.bean.query;

/**
 * 验证码查询对象
 */
public class CaptchaQuery extends BaseQuery {

    public String type;//类型
    public Boolean enabled;//是否可用
    public String code;//编码
    public String mobile;//手机号码
    public String email;//邮箱地址
    public Integer state;//状态
    public Integer userId;

    public CaptchaQuery() {
        super();
    }

    public CaptchaQuery(String code, String mobile, Integer state) {
        this.code = code;
        this.mobile = mobile;
        this.state = state;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }


    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
