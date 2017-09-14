package cn.org.eshow.service.impl;

import cn.org.eshow.bean.query.ThirdPartyQuery;
import cn.org.eshow.bean.query.TopicQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.ThirdPartyDao;
import cn.org.eshow.dao.TopicDao;
import cn.org.eshow.model.ThirdParty;
import cn.org.eshow.model.Topic;
import cn.org.eshow.model.User;
import cn.org.eshow.service.ThirdPartyManager;
import cn.org.eshow.service.TopicManager;
import cn.org.eshow.service.impl.GenericManagerImpl;

import java.util.List;
import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@WebService(serviceName = "ThirdPartyService", endpointInterface = "cn.org.eshow.service.ThirdPartyManager")
@Service
public class ThirdPartyManagerImpl extends GenericManagerImpl<ThirdParty, Integer> implements ThirdPartyManager {

    @Autowired
    ThirdPartyDao thirdPartyDao;

    @Autowired
    public ThirdPartyManagerImpl(ThirdPartyDao thirdPartyDao) {
        super(thirdPartyDao);
        this.thirdPartyDao = thirdPartyDao;
    }

    @Override
    public List<ThirdParty> list(ThirdPartyQuery query) {
        return thirdPartyDao.list(query);
    }

    @Override
    public Page<ThirdParty> search(ThirdPartyQuery query) {
        return thirdPartyDao.search(query);
    }

    @Override
    public ThirdParty check(ThirdPartyQuery query) {
        List<ThirdParty> list = thirdPartyDao.list(query);
        if (!list.isEmpty()) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public ThirdParty save(ThirdParty thirdParty, User user) {
        ThirdParty old = this.check(new ThirdPartyQuery(thirdParty.getPlatform(), user.getId()));//该用户是否已绑定第三方账号
        if (old != null) {
            old.setEnabled(Boolean.FALSE);//设置之前绑定为无效
            thirdPartyDao.save(old);
        }
        thirdParty.setUser(user);
        return thirdPartyDao.save(thirdParty);
    }

    @Override
    public ThirdParty updateUser(ThirdParty thirdParty, User user) {
        List<ThirdParty> thirdParties = thirdPartyDao.list(new ThirdPartyQuery(thirdParty.getPlatform(), user.getId()));//该用户已绑定第三方账号列表
        for (ThirdParty obj : thirdParties) {
            obj.setEnabled(Boolean.FALSE);
            thirdPartyDao.save(obj);
        }
        thirdParty.setUser(user);
        thirdParty.setEnabled(Boolean.TRUE);
        return thirdPartyDao.save(thirdParty);
    }

    @Override
    public ThirdParty enabled(ThirdParty thirdParty) {
        thirdParty.setEnabled(Boolean.FALSE);
        return thirdPartyDao.save(thirdParty);
    }
}