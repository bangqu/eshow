package cn.org.eshow.service.impl;

import cn.org.eshow.bean.query.NotificationRemindQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.NotificationRemindDao;
import cn.org.eshow.model.NotificationRemind;
import cn.org.eshow.model.User;
import cn.org.eshow.service.NotificationRemindManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.WebService;
import java.util.Date;
import java.util.List;

@WebService(serviceName = "NotificationRemindService", endpointInterface = "cn.org.eshow.service.NotificationRemindManager")
@Service
public class NotificationRemindManagerImpl extends GenericManagerImpl<NotificationRemind, Integer> implements NotificationRemindManager {

    @Autowired
    NotificationRemindDao notificationRemindDao;


    public NotificationRemindManagerImpl() {
    }

    @Autowired
    public NotificationRemindManagerImpl(NotificationRemindDao notificationRemindDao) {
        super(notificationRemindDao);
        this.notificationRemindDao = notificationRemindDao;
    }

    @Override
    public List<NotificationRemind> list(NotificationRemindQuery query) {
        return notificationRemindDao.list(query);
    }

    @Override
    public Page<NotificationRemind> search(NotificationRemindQuery query) {
        return notificationRemindDao.search(query);
    }

    @Override
    public NotificationRemind check(NotificationRemindQuery query) {
        List<NotificationRemind> list = notificationRemindDao.list(query);
        if (!list.isEmpty()) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public NotificationRemind save(User user, Integer friendCount, Integer notificationCount) {
        NotificationRemind notificationRemind = check(new NotificationRemindQuery(user.getId()));
        if (notificationRemind == null) {
            notificationRemind = new NotificationRemind();
            notificationRemind.setUser(user);
            notificationRemind.setFriendCount(friendCount);
            notificationRemind.setNotificationCount(notificationCount);
            return notificationRemindDao.save(notificationRemind);
        }
        notificationRemind.setFriendCount(notificationRemind.getFriendCount() + friendCount);
        notificationRemind.setNotificationCount(notificationRemind.getNotificationCount() + notificationCount);
        return notificationRemindDao.save(notificationRemind);
    }

    @Override
    public long count(NotificationRemindQuery query) {
        return notificationRemindDao.count(query);
    }

    @Override
    public void reset(Integer userId, String field) {
        NotificationRemind notificationRemind = notificationRemindDao.getBy("user.id", userId);
        if (notificationRemind != null) {
            if (field.equals("friendCount")) {
                notificationRemind.setFriendCount(0);
            } else if (field.equals("notificationCount")) {
                notificationRemind.setNotificationCount(0);
            }
            notificationRemind.setUpdateTime(new Date());
            notificationRemindDao.save(notificationRemind);
        }
    }

}