package cn.org.eshow.service;

import cn.org.eshow.bean.query.AccessTokenQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.AccessToken;
import cn.org.eshow.model.User;
import org.apache.amber.oauth2.common.exception.OAuthSystemException;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface AccessTokenManager extends GenericManager<AccessToken, Integer> {

    /**
     * 获取访问令牌列表
     *
     * @param query 访问令牌查询对象
     * @return 访问令牌列表
     */
    List<AccessToken> list(AccessTokenQuery query);

    /**
     * 搜索访问令牌列表
     *
     * @param query 访问令牌查询对象
     * @return 访问令牌列分页列表
     */
    Page<AccessToken> search(AccessTokenQuery query);

    /**
     * 获取用户访问令牌
     *
     * @param user 用户
     * @return 访问令牌
     * @throws OAuthSystemException
     */
    AccessToken refresh(User user) throws OAuthSystemException;

}