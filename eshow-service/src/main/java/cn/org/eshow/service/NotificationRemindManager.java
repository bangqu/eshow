package cn.org.eshow.service;

import cn.org.eshow.bean.query.NotificationRemindQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.NotificationRemind;
import cn.org.eshow.model.User;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface NotificationRemindManager extends GenericManager<NotificationRemind, Integer> {

    List<NotificationRemind> list(NotificationRemindQuery query);

    Page<NotificationRemind> search(NotificationRemindQuery query);

    NotificationRemind check(NotificationRemindQuery query);

    NotificationRemind save(User user, Integer friendCount, Integer notificationCount);

    long count(NotificationRemindQuery query);

    void reset(Integer userId, String field);
}