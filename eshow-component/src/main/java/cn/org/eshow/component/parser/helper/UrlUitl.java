package cn.org.eshow.component.parser.helper;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.StringTokenizer;

/**
 */
public class UrlUitl {
	
	private static String encodeUrlParam(String value, String charset)
			throws UnsupportedEncodingException {
		if (value == null) {
			return "";
		}

		try {
			String decoded = URLDecoder.decode(value, charset);

			String result = "";
			for (int i = 0; i < decoded.length(); i++) {
				char ch = decoded.charAt(i);
				result += (ch == '#') ? "#" : URLEncoder.encode(String.valueOf(ch), charset);
			}

			return result;
		}
		catch (IllegalArgumentException e) {
			return value;
		}
	}

	public static String encodeUrl(String url, String charset) {
		if (url == null) {
			return "";
		}

		int index = url.indexOf("?");
		if (index >= 0) {
			try {
				String result = url.substring(0, index + 1);
				String paramsPart = url.substring(index + 1);
				StringTokenizer tokenizer = new StringTokenizer(paramsPart, "&");
				while (tokenizer.hasMoreTokens()) {
					String definition = tokenizer.nextToken();
					int eqIndex = definition.indexOf("=");
					if (eqIndex >= 0) {
						String paramName = definition.substring(0, eqIndex);
						String paramValue = definition.substring(eqIndex + 1);
						result += paramName + "=" + encodeUrlParam(paramValue, charset) + "&";
					} else {
						result += encodeUrlParam(definition, charset) + "&";
					}
				}

				if (result.endsWith("&")) {
					result = result.substring(0, result.length() - 1);
				}

				return result;
			} catch (UnsupportedEncodingException e) {

			}
		}

		return url;
	}
	
	/**
	 * Checks if specified link is full URL.
	 * 
	 * @param link
	 * @return True, if full URl, false otherwise.
	 */
	public static boolean isFullUrl(String link) {
		if (link == null) {
			return false;
		}
		link = link.trim().toLowerCase();
		return link.startsWith("http://") || link.startsWith("https://")
				|| link.startsWith("file://");
	}
	
	/**
	 * Calculates full URL for specified page URL and link which could be full, absolute or relative like there can be
	 * found in A or IMG tags.
	 */
	public static String fullUrl(String pageUrl, String link) {
		if (isFullUrl(link)) {
			return link;
		}
		else if (link != null && link.startsWith("?")) {
			int qindex = pageUrl.indexOf('?');
			int len = pageUrl.length();
			if (qindex < 0) {
				return pageUrl + link;
			}
			else if (qindex == len - 1) {
				return pageUrl.substring(0, len - 1) + link;
			}
			else {
				return pageUrl + "&" + link.substring(1);
			}
		}

		boolean isLinkAbsolute = link.startsWith("/");

		if (!isFullUrl(pageUrl)) {
			pageUrl = "http://" + pageUrl;
		}

		int slashIndex = isLinkAbsolute ? pageUrl.indexOf("/", 8) : pageUrl.lastIndexOf("/");
		if (slashIndex <= 8) {
			pageUrl += "/";
		}
		else {
			pageUrl = pageUrl.substring(0, slashIndex + 1);
		}

		return isLinkAbsolute ? pageUrl + link.substring(1) : pageUrl + link;
	}
	
}
