package cn.org.eshow.dao;

import cn.org.eshow.bean.query.NotificationRemindQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.NotificationRemind;

import java.util.List;


/**
 * An interface that provides a data management interface to the NotificationRemind table.
 */
public interface NotificationRemindDao extends GenericDao<NotificationRemind, Integer> {

    List<NotificationRemind> list(NotificationRemindQuery query);

    Page<NotificationRemind> search(NotificationRemindQuery query);

    Long count(NotificationRemindQuery query);
}