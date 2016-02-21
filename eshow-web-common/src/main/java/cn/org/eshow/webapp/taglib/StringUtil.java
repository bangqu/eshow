package cn.org.eshow.webapp.taglib;

import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.Date;

import cn.org.eshow.util.HtmlUtil;

/**
 * 在JSP页面中可能要对数据进行简单转换<br>
 * 所以单独写这个类负责
 * 
 * @author leida
 */
public class StringUtil {

	/**
	 * 截取
	 * 
	 * @param str
	 * @return String
	 */
	public static String preview(String str,int len) {
		if (str == null)
			return "";
		return HtmlUtil.htmlToStr(str,len);
	}

	/**
	 * 把回车换行在JSP页面上显示效果
	 * 
	 * @param str
	 * @return String
	 */
	public static String replaceSpace(String str) {
		if (str == null)
			return "";
		return str.replaceAll("\r\n", "<br>");
	}

	/**
	 * 价格转换位千分位
	 * 
	 * @param price
	 * @return String
	 */
	public static String priceFormat(Object price) {
		if (price == null)
			return "";
		DecimalFormat df = new DecimalFormat("###,###.###");
		return df.format(price);
	}

	/**
	 * 中文转utf-8
	 * 
	 * @param name
	 * @return String
	 * @throws UnsupportedEncodingException
	 */
	public static String encode(String name) throws UnsupportedEncodingException {
		return java.net.URLEncoder.encode(name, "UTF-8");
	}

	/**
	 * @param date1
	 *            比较参照日期
	 * 
	 * @param date2
	 *            要比较的日期
	 * @return int
	 */
	public static int compareDate(Date date1, Date date2) {
		return (date1 == null ? new Date() : date1)
				.compareTo(date2 == null ? new Date() : date2);
	}
}
