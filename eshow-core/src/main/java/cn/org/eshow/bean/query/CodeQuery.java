package cn.org.eshow.bean.query;


/**
 * 编码代码查询对象
 */
public class CodeQuery extends BaseQuery {

    public String type;//类型（找回密码，邮箱验证）
    public String code;//编码
    public String email;//邮箱
    public Integer state;//状态
    public Boolean enabled = Boolean.TRUE;//是否可用
    public Integer userId;//用户ID

    public CodeQuery() {
        super();
    }

    public CodeQuery(Boolean enabled) {
        this.enabled = enabled;
    }

    public CodeQuery(String code, Integer state) {
        this.code = code;
        this.state = state;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

}
