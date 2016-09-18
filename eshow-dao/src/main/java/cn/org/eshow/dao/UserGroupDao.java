package cn.org.eshow.dao;


import cn.org.eshow.bean.query.UserGroupQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.UserGroup;

import java.util.List;

/**
 * An interface that provides a data management interface to the UserGroup table.
 */
public interface UserGroupDao extends GenericDao<UserGroup, Integer> {

    Page<UserGroup> search(UserGroupQuery query);

    List<UserGroup> list(UserGroupQuery query);

    Long count(UserGroupQuery query);
}