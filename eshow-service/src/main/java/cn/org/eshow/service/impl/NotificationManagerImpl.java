package cn.org.eshow.service.impl;

import cn.org.eshow.bean.query.NotificationQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.NotificationDao;
import cn.org.eshow.model.Notification;
import cn.org.eshow.model.User;
import cn.org.eshow.service.NotificationManager;
import cn.org.eshow.service.NotificationRemindManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.WebService;
import java.util.List;

@WebService(serviceName = "NotificationService", endpointInterface = "cn.org.eshow.service.NotificationManager")
@Service
public class NotificationManagerImpl extends GenericManagerImpl<Notification, Integer> implements NotificationManager {

    @Autowired
    NotificationDao notificationDao;
    @Autowired
    NotificationRemindManager notificationRemindManager;

    public NotificationManagerImpl() {

    }

    @Autowired
    public NotificationManagerImpl(NotificationDao notificationDao) {
        super(notificationDao);
        this.notificationDao = notificationDao;
    }

    @Override
    public List<Notification> list(NotificationQuery query) {
        return notificationDao.list(query);
    }

    @Override
    public Page<Notification> search(NotificationQuery query) {
        return notificationDao.search(query);
    }

    @Override
    public Notification check(NotificationQuery query) {
        List<Notification> list = notificationDao.list(query);
        if (!list.isEmpty()) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public long count(NotificationQuery query) {
        return notificationDao.count(query);
    }

    @Override
    public Notification save(User user, String category, String title, String content, String img, String model, String modelVal) {
        Notification notification = new Notification();
        notification.setUser(user);
        notification.setCategory(category);
        notification.setTitle(title);
        notification.setContent(content);
        notification.setImg(img);
        notification.setModel(model);
        notification.setModelVal(modelVal);
        notification = notificationDao.save(notification);
        notificationRemindManager.save(user, notification.getCategory().equals(Notification.Category.平台公告) ? 1 : 0, notification.getCategory().equals(Notification.Category.系统消息) ? 1 : 0);
        return notification;
    }

    @Override
    public Notification save(User user, Notification notification) {
        notification.setUser(user);
        notification = notificationDao.save(notification);
        notificationRemindManager.save(user, notification.getCategory().equals(Notification.Category.平台公告) ? 1 : 0, notification.getCategory().equals(Notification.Category.系统消息) ? 1 : 0);
        return notification;
    }
}
