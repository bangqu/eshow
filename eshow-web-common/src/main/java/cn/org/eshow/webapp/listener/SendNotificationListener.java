package cn.org.eshow.webapp.listener;

import cn.org.eshow.model.Notification;
import cn.org.eshow.model.User;
import cn.org.eshow.service.NotificationManager;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * 发送通知线程
 *
 * @author leida
 */
public class SendNotificationListener extends Thread {

    private static final Log log = LogFactory.getLog(SendNotificationListener.class);

    /**
     * 发送通知用户列表
     */
    public static List<User> USER_SEND_NOTIFICATION_LIST = new ArrayList<User>();

    /**
     * 发送通知信息
     */
    public static Notification NOTIFICATION = new Notification();

    @Autowired
    private NotificationManager notificationManager;

    public SendNotificationListener() {
        start();
    }

    public synchronized void run() {
        try {
            Thread.sleep(1000 * 10);
            log.debug("Notification send listener Start successful!");
            while (true) {
                if (!USER_SEND_NOTIFICATION_LIST.isEmpty()) {
                    for (int i = 0; i < USER_SEND_NOTIFICATION_LIST.size(); ) {
                        User user = USER_SEND_NOTIFICATION_LIST.get(i);
                        notificationManager.save(user, NOTIFICATION);
                        log.debug("Send notification successful:" + user.getUsername() + " " + NOTIFICATION.getTitle());
                        USER_SEND_NOTIFICATION_LIST.remove(i);
                        Thread.sleep(1000 * 1);
                    }
                }
                Thread.sleep(1000 * 3);
            }
        } catch (Exception e) {
            System.out.println("SendNotificationListener.run() exception");
        }
    }

}
