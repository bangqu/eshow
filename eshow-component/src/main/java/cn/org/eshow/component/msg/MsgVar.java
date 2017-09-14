package cn.org.eshow.component.msg;

/**
 * 公共变量
 * 
 * @author bunny
 */
public class MsgVar {

	/**
	 * 私有构造函数
	 */
	private MsgVar() {
	}

	/**
	 * 发送成功
	 */
	public final static Integer SEND_SUCCESS = Integer.valueOf(1);

	/**
	 * 短信数量不足
	 */
	public final static Integer MSG_NUMBER = Integer.valueOf(-3);

	/**
	 * 短信内容出现非法字符
	 */
	public final static Integer MSG_ILLEGAL = Integer.valueOf(-14);

	/**
	 * 手机号格式不正确
	 */
	public final static Double FORMAT_WRONG = Double.valueOf(-4);

	/**
	 * 短信接口安全密钥不正确
	 */
	public final static Integer KEY_WRONG = Integer.valueOf(-2);
	
	/**
	 * 验证码不匹配
	 */
	public final static  String CODE_WRONG = "验证码不匹配，请重新输入";

}
