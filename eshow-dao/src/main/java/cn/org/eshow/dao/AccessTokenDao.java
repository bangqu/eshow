package cn.org.eshow.dao;


import cn.org.eshow.bean.query.AccessTokenQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.AccessToken;

import java.util.List;

/**
 * An interface that provides a data management interface to the AccessToken table.
 */
public interface AccessTokenDao extends GenericDao<AccessToken, Integer> {

    /**
     * 搜索访问令牌列表
     * @param query 访问令牌查询对象
     * @return 访问令牌分页列表
     */
    List<AccessToken> list(AccessTokenQuery query);

    /**
     * 获取访问令牌列表
     * @param query 访问令牌查询对象
     * @return 访问令牌列表
     */
    Page<AccessToken> search(AccessTokenQuery query);

}