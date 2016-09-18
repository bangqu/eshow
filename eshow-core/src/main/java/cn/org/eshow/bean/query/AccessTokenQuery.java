package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * 访问令牌查询对象
 */
public class AccessTokenQuery extends BaseQuery {

    public Date startAddTime;//开始添加时间
    public Date endAddTime;//结束添加时间
    public Date updataTime;//更新时间
    public String accessToken;//访问令牌
    public Long expiresIn;//过期时间（毫秒数）
    public String refreshToken;//刷新令牌
    public Integer userId;//用户ID

    public AccessTokenQuery() {
        super();
    }

    public Date getStartAddTime() {
        return startAddTime;
    }

    public void setStartAddTime(Date startAddTime) {
        this.startAddTime = startAddTime;
    }

    public Date getEndAddTime() {
        return endAddTime;
    }

    public void setEndAddTime(Date endAddTime) {
        this.endAddTime = endAddTime;
    }

    public Date getUpdataTime() {
        return updataTime;
    }

    public void setUpdataTime(Date updataTime) {
        this.updataTime = updataTime;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public Long getExpiresIn() {
        return expiresIn;
    }

    public void setExpiresIn(Long expiresIn) {
        this.expiresIn = expiresIn;
    }

    public String getRefreshToken() {
        return refreshToken;
    }

    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
