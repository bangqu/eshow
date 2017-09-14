package cn.org.eshow.common;

import org.springframework.mail.SimpleMailMessage;

import java.util.ArrayList;
import java.util.List;

/**
 * 公共变量
 *
 * @author leida
 */
public class CommonVar {

    /**
     * 私有构造函数
     */
    private CommonVar() {
    }

    /**
     * 可用
     */
    public final static Integer STATE_USE = Integer.valueOf(1);

    /**
     * 不可用
     */
    public final static Integer STATE_UNUSE = Integer.valueOf(0);

    /**
     * 顶，收藏，访问的默认值
     */
    public final static Integer DEFAULT = Integer.valueOf(0);

    /**
     * 默认步长
     */
    public final static Integer STEP = Integer.valueOf(1);

    /**
     * CODE未使用
     */
    public final static Integer CODE_UNUSED = Integer.valueOf(0);

    /**
     * CODE已使用
     */
    public final static Integer CODE_USED = Integer.valueOf(1);

    /**
     * 用户默认头像
     */
    public final static String USER_DEFAULT_PHOTO = String.valueOf("https://qiniu.easyapi.com/user/default.jpg");

    /**
     * 邮件发送列表
     */
    public static List<SimpleMailMessage> MAIL_SEND_LIST = new ArrayList<SimpleMailMessage>();

    /**
     * 平台支出枚举类型
     */
    public enum CodeType {
        找回密码, 手机验证, 邮箱验证
    }
}
