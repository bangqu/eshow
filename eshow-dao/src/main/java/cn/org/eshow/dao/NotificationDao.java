package cn.org.eshow.dao;

import cn.org.eshow.bean.query.NotificationQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Notification;

import java.util.List;

public interface NotificationDao extends GenericDao<Notification, Integer> {

    Page<Notification> search(NotificationQuery query);

    List<Notification> list(NotificationQuery query);

    Long count(NotificationQuery query);
}