package cn.org.eshow.webapp.action;

import cn.org.eshow.service.AccessTokenManager;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * API接口工程基础Action
 */
public class ApiBaseAction<T> extends BaseAction {

    private static final long serialVersionUID = 1L;

    @Autowired
    protected AccessTokenManager accessTokenManager;

    /**
     * accessToken
     */
    protected String accessToken;

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

}
