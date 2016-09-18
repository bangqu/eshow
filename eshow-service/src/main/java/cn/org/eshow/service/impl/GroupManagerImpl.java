package cn.org.eshow.service.impl;

import cn.org.eshow.bean.query.GroupQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.GroupDao;
import cn.org.eshow.model.Group;
import cn.org.eshow.service.GroupManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.WebService;
import java.util.List;

@WebService(serviceName = "GroupService", endpointInterface = "cn.org.eshow.service.GroupManager")
@Service
public class GroupManagerImpl extends GenericManagerImpl<Group, Integer> implements GroupManager {

	@Autowired
	GroupDao groupDao;

	public GroupManagerImpl() {
	}

	@Autowired
	public GroupManagerImpl(GroupDao groupDao) {
		super(groupDao);
		this.groupDao = groupDao;
	}

	@Override
	public List<Group> list(GroupQuery query) {
		return groupDao.list(query);
	}

	@Override
	public Page<Group> search(GroupQuery query) {
		return groupDao.search(query);
	}

    @Override
    public Group check(GroupQuery query) {
        List<Group> list = groupDao.list(query);
        if (!list.isEmpty()) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public Long count(GroupQuery query) {
        return groupDao.count(query);
    }
}