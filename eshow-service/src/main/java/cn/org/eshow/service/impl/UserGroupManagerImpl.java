package cn.org.eshow.service.impl;

import cn.org.eshow.bean.query.UserGroupQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.UserGroupDao;
import cn.org.eshow.model.UserGroup;
import cn.org.eshow.service.UserGroupManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.WebService;
import java.util.List;

@WebService(serviceName = "UserGroupService", endpointInterface = "cn.org.eshow.service.UserGroupManager")
@Service
public class UserGroupManagerImpl extends GenericManagerImpl<UserGroup, Integer> implements UserGroupManager {

	@Autowired
	UserGroupDao userGroupDao;

	public UserGroupManagerImpl() {
	}

	@Autowired
	public UserGroupManagerImpl(UserGroupDao userGroupDao) {
		super(userGroupDao);
		this.userGroupDao = userGroupDao;
	}

	@Override
	public List<UserGroup> list(UserGroupQuery query) {
		return userGroupDao.list(query);
	}

	@Override
	public Page<UserGroup> search(UserGroupQuery query) {
		return userGroupDao.search(query);
	}

    @Override
    public UserGroup check(UserGroupQuery query) {
        List<UserGroup> list = userGroupDao.list(query);
        if (!list.isEmpty()) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public Long count(UserGroupQuery query) {
        return userGroupDao.count(query);
    }
}