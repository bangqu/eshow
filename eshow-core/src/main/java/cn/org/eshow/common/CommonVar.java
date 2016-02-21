package cn.org.eshow.common;

import org.springframework.mail.SimpleMailMessage;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author leida
 *
 */
public class CommonVar {

	/**
	 * 私有构造函数
	 */
	private CommonVar() {}
	
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
	 * 未审核
	 */
	public final static Integer TOPIC_STATE_UNAUDIT = Integer.valueOf(0);
	
	/**
	 * 已通过
	 */
	public final static Integer TOPIC_STATE_PASS = Integer.valueOf(1);
	
	/**
	 * 未通过
	 */
	public final static Integer TOPIC_STATE_UNPASS = Integer.valueOf(2);
	
	/**
	 * 邮件发送列表
	 */
	public static List<SimpleMailMessage> MAIL_SEND_LIST = new ArrayList<SimpleMailMessage>();

}
