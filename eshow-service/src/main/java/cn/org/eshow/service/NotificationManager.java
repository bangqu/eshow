package cn.org.eshow.service;

import cn.org.eshow.bean.query.NotificationQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Notification;
import cn.org.eshow.model.User;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface NotificationManager extends GenericManager<Notification, Integer> {

    List<Notification> list(NotificationQuery query);

    Page<Notification> search(NotificationQuery query);

    Notification check(NotificationQuery query);

    /**
     * 保存消息通知
     *
     * @param user
     * @param category
     * @param title
     * @param content
     * @param img
     * @param model
     * @param modelVal
     * @return
     */
    Notification save(User user, String category, String title, String content, String img, String model, String modelVal);

    /**
     * 保存消息通知
     *
     * @param user
     * @param notification
     * @return
     */
    Notification save(User user, Notification notification);

    long count(NotificationQuery query);
}
