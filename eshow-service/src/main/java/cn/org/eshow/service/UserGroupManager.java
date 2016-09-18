package cn.org.eshow.service;


import cn.org.eshow.bean.query.UserGroupQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.UserGroup;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface UserGroupManager extends GenericManager<UserGroup, Integer> {

    List<UserGroup> list(UserGroupQuery query);

    Page<UserGroup> search(UserGroupQuery query);

    UserGroup check(UserGroupQuery query);

    Long count(UserGroupQuery query);
}