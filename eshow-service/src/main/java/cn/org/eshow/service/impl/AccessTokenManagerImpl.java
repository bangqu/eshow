package cn.org.eshow.service.impl;

import cn.org.eshow.bean.query.AccessTokenQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.AccessTokenDao;
import cn.org.eshow.model.AccessToken;
import cn.org.eshow.model.User;
import cn.org.eshow.service.AccessTokenManager;
import cn.org.eshow.util.DateUtil;
import org.apache.amber.oauth2.as.issuer.MD5Generator;
import org.apache.amber.oauth2.as.issuer.OAuthIssuer;
import org.apache.amber.oauth2.as.issuer.OAuthIssuerImpl;
import org.apache.amber.oauth2.common.exception.OAuthSystemException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.WebService;
import java.util.Date;
import java.util.List;

@WebService(serviceName = "AccessTokenService", endpointInterface = "cn.org.eshow.service.AccessTokenManager")
@Service("accessTokenManager")
public class AccessTokenManagerImpl extends GenericManagerImpl<AccessToken, Integer> implements AccessTokenManager {

	@Autowired
    AccessTokenDao accessTokenDao;

	public AccessTokenManagerImpl() {
	}

	@Autowired
	public AccessTokenManagerImpl(AccessTokenDao accessTokenDao) {
		super(accessTokenDao);
		this.accessTokenDao = accessTokenDao;
	}

	@Override
	public List<AccessToken> list(AccessTokenQuery query) {
		return accessTokenDao.list(query);
	}

	@Override
	public Page<AccessToken> search(AccessTokenQuery query) {
		return accessTokenDao.search(query);
	}

    @Override
    public AccessToken refresh(User user) throws OAuthSystemException {
        // 获得AccessToken信息
        AccessTokenQuery accessTokenQuery = new AccessTokenQuery();
        accessTokenQuery.setUserId(user.getId());
        List<AccessToken> accessTokens =list(accessTokenQuery);

        AccessToken at =null;
        if (!accessTokens.isEmpty()){
             at = accessTokens.get(0);
        }
        // 更换表中token信息
        OAuthIssuer oauthIssuerImpl = new OAuthIssuerImpl(new MD5Generator());
        String accessToken = oauthIssuerImpl.accessToken();
        String refreshToken = oauthIssuerImpl.refreshToken();
        if(at == null)
        {
            at = new AccessToken(user, accessToken, AccessToken.EXPIRES_IN, refreshToken);
            at = accessTokenDao.save(at);
        }
        else
        {
            //判断accessToken是否还有1天过期
            long timeNow = DateUtil.dateToLong(new Date());// 当前时间
            long timeEnd = DateUtil.dateToLong(at.getUpdateTime());// 最后登录时间
            if (timeNow - timeEnd > at.getExpiresIn() - 1000 * 3600 * 24L) {//快要过期，要修改新的AccessToken
                at.setAccessToken(accessToken);
                at.setRefreshToken(refreshToken);
                at.setUpdateTime(new Date());
                at = accessTokenDao.save(at);
            }
        }
        return at;
    }
}