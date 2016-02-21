package cn.org.eshow.component.parser.helper;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 正则表达式解析
 */
public class Match {

	/**
	 * 微博内容中的at正则表达式
	 */
	public final static String AT_REGEX = "@[\\u4e00-\\u9fa5\\w\\-]+";

	/**
	 * 微博内容中的#话题#正则表达式
	 */
	public final static String TOPIC_REGEX = "#([^\\#|.]+)#";

	/**
	 * Youtube視頻地址正则表达式
	 */
	public final static String YOUTUBE_REGEX = "(?:http://)?www\\.youtube\\.com/watch\\?v=([\\w\\-]+)[^'\"><\\s\\r\\n]+";

	/**
	 * 超鏈接正则表达式
	 */
	public final static String LINK_REGEX = "(http:|https:)//[^[A-Za-z0-9\\._\\?%&+\\-=/#]]*";

	/**
	 * 返回視頻地址ID
	 * 
	 * @param text 文本
	 * @param regEx 正则
	 * @return 匹配到的数据 or 空
	 */
	public static List<String> movie(String text, String regEx) {

		List<String> result = new ArrayList<String>();

		Pattern pattern = Pattern.compile(regEx);

		Matcher matcher = pattern.matcher(text);

		while (matcher.find()) {
			result.add(matcher.group(1));
		}
		return result;
	}

	/**
	 * 匹配数据
	 * 
	 * @param text 文本
	 * @param regEx 正则
	 * @return 匹配到的数据 or 空
	 */
	public static List<String> match(String text, String regEx) {

		List<String> result = new ArrayList<String>();

		Pattern pattern = Pattern.compile(regEx);
		// Pattern pattern = Pattern.compile(regEx, Pattern.DOTALL);

		Matcher matcher = pattern.matcher(text);

		while (matcher.find()) {
			result.add(matcher.group());
		}
		return result;
	}

	public static String quote(String text) {
		String weifu = "#-#-#";

		text = Matcher.quoteReplacement(text);
		// 替换需要得到的结果有3中写法：(.*?) 、 (.*) 、 (.*)? ,最终都会替换成 (.*?)
		text = text.replaceAll("\\(\\.\\*\\?\\)", weifu).replaceAll("\\(\\.\\*\\)", weifu).replaceAll("\\(\\.\\*\\)\\?", weifu);

		// 替换.* 目前只支持最简单的.*操作
		text = text.replaceAll("\\.\\*", "#-@-#").replaceAll("\\.\\*\\?", "#-@-#");

		text = text.replaceAll("\\s{1}", "\\\\s+").replaceAll("\\$", "\\\\\\$");

		// 替换正则中的特殊字符串.
		text = text.replaceAll("\\(", "\\\\(").replaceAll("\\)", "\\\\)").replaceAll("\\.", "\\\\.").replaceAll("\\?", "\\\\?");

		text = text.replace(weifu, "(.*?)");

		text = text.replace("#-@-#", ".*?");

		text = text.replaceAll("(\\\\s\\+){2,}", "\\\\s+");

		return text;
	}

	public static void main(String[] args) {
		System.out.println(match("方式答复都是#123#范#德#萨方式", TOPIC_REGEX));
		System.out.println(match("方式答复都是@范德萨", AT_REGEX));
		System.out.println(match("http://www.youtube.com/watch?v=gs-mQVAHbl2UWM&feature=related", YOUTUBE_REGEX));
		System.out.println(match("http://group.qq.com/cgi-bin/groupbaseinfo?groupid=122121", "http://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?"));
		System.out.println(match("fdsfds22*fds", "\\d+\\*"));
	}
}
