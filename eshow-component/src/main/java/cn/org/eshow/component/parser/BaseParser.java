package cn.org.eshow.component.parser;

import cn.org.eshow.component.parser.helper.Match;

import java.util.List;

/**
 * 基础解析类
 * 
 * @author leida
 * 
 */
public class BaseParser {

	public static String poundTopic(String key) {
		return "#" + key + "#";
	}

	public static String topicUrl(String key) {
		return Constants.TOPIC_URL.replace("***", key.replaceAll("#", "")) + key + Constants.END_A;
	}

	/**
	 * 解析微博的@用户
	 * 
	 * @return
	 */
	public static List<String> atusers(String weibo) {
		return Match.match(weibo, Match.AT_REGEX);
	}

	/**
	 * 解析微博的@用户
	 * 
	 * @return
	 */
	public static String atuserToLink(String domain, String nickname) {
		return Constants.ATUSER_URL.replace("***", domain) + "@" + nickname
				+ Constants.END_A;
	}

	public static void main(String[] args) {
		System.out.println(atuserToLink("008", "零零八"));
	}
}
