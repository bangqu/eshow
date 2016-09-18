package cn.org.eshow.util;

import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.net.URL;
import java.util.*;

/**
 * Basic evaluation utilities
 */
public class CommonUtil {

	/**
	 * Contains pair of intger values
	 */
	public static class IntPair {
		public int x;
		public int y;

		public IntPair() {}

		public IntPair(int x, int y) {
			this.x = x;
			this.y = y;
		}

		public String toString() {
			return "x = " + x + ", y = " + y;
		}

		public void defineFromString(String s, char separator, int maxValue) {
			int columnIndex = s.indexOf(separator);
			if (columnIndex == -1) {
				x = Integer.parseInt(s);
				y = x;
			}
			else {
				if (columnIndex == 0) {
					x = 1;
					String s2 = s.substring(1);
					y = "".equals(s2) ? maxValue : Integer.parseInt(s2);
				}
				else if (columnIndex == s.length() - 1) {
					x = Integer.parseInt(s.substring(0, s.length() - 1));
					y = maxValue;
				}
				else {
					String s1 = s.substring(0, columnIndex);
					String s2 = s.substring(columnIndex + 1);
					x = "".equals(s1) ? 1 : Integer.parseInt(s1);
					y = "".equals(s2) ? maxValue : Integer.parseInt(s2);
				}
			}
		}
	}

	public static String nvl(String value, String defaultValue) {
		return value == null ? defaultValue : value;
	}

	public static String adaptFilename(String filePath) {
		return filePath == null ? null : filePath.replace('\\', '/');
	}

	/**
	 * Checks if specified file path is absolute. Criteria for recogning absolute file paths is that i starts with /, \,
	 * or X: where X is some letter.
	 * 
	 * @param path
	 * @return True, if specified filepath is absolute, false otherwise.
	 */
	public static boolean isPathAbsolute(String path) {
		if (path == null) {
			return false;
		}

		path = adaptFilename(path);
		int len = path.length();

		return (len >= 1 && path.startsWith("/"))
				|| (len >= 2 && Character.isLetter(path.charAt(0)) && path.charAt(1) == ':');
	}

	/**
	 * For the goven working path and file path returns absolute file path.
	 * 
	 * @param workingPath
	 * @param filePath
	 * @return Absolute path of the second parameter according to absolute working path.
	 */
	public static String getAbsoluteFilename(String workingPath, String filePath) {
		filePath = adaptFilename(filePath);

		// if file path is absolute, then return only filePath parameter
		if (isPathAbsolute(filePath)) {
			return filePath;
		}
		else {
			workingPath = adaptFilename(workingPath);
			if (workingPath.endsWith("/")) {
				workingPath = workingPath.substring(0, workingPath.length() - 1);
			}
			return workingPath + "/" + filePath;
		}
	}

	/**
	 * Extracts a filename and directory from an absolute path.
	 */
	public static String getDirectoryFromPath(String path) {
		path = adaptFilename(path);
		int index = path.lastIndexOf("/");

		return path.substring(0, index);
	}

	/**
	 * Extracts a filename from an absolute path.
	 */
	public static String getFileFromPath(String path) {
		int i1 = path.lastIndexOf("/");
		int i2 = path.lastIndexOf("\\");
		if (i1 > i2) {
			return path.substring(i1 + 1);
		}
		return path.substring(i2 + 1);
	}

	/**
	 * Returns class name without packages for the specified object
	 */
	public static String getClassName(Object o) {
		if (o != null) {
			String processorClassName = o.getClass().getName();
			int dotIndex = processorClassName.lastIndexOf('.');
			if (dotIndex >= 0) {
				processorClassName = processorClassName.substring(dotIndex + 1);
			}

			return processorClassName;
		}
		else {
			return "null value";
		}
	}

	/**
	 *
	 * @param s
	 * @param count
     * @return
     */
	public static String replicate(String s, int count) {
		String result = "";
		for (int i = 1; i <= count; i++) {
			result += s;
		}

		return result;
	}

	/**
	 *
	 * @param value
	 * @param charset
	 * @return
	 * @throws UnsupportedEncodingException
     */
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

	/**
	 *
	 * @param url
	 * @param charset
     * @return
     */
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
					}
					else {
						result += encodeUrlParam(definition, charset) + "&";
					}
				}

				if (result.endsWith("&")) {
					result = result.substring(0, result.length() - 1);
				}

				return result;
			}
			catch (UnsupportedEncodingException e) {

			}
		}

		return url;
	}

	/**
	 * Checks if specified string value represents boolean true value.
	 * 
	 * @return If specified string equals (ignoring case) to 1, true or yes then true, otherwise false.
	 */
	public static boolean isBooleanTrue(String value) {
		if (value != null) {
			return "1".equals(value) || "true".equalsIgnoreCase(value)
					|| "yes".equalsIgnoreCase(value);
		}

		return false;
	}

	/**
	 * 加1
	 * 
	 * @param digg
	 * @return Long
	 */
	public static Long digg(Long digg) {
		if (digg != null) {
			return digg + 1;
		}
		return Long.valueOf("1");
	}
	
	/**
	 * 访问次数加1
	 * 
	 * @param count
	 * @return Integer
	 */
	public static Integer count(Integer count) {
		if (count != null) {
			return count + 1;
		}
		return Integer.valueOf("1");
	}

	/**
	 * Escapes XML string - special characters: &'"<> are replaced with XML escape sequences: &amp; &apos; &quot; &lt;
	 * &gt;
	 */
	public static String escapeXml(String s) {
		if (s != null) {
			StringBuffer result = new StringBuffer(s);
			int index = 0;
			for (int i = 0; i < s.length(); i++) {
				char ch = s.charAt(i);
				if (ch == '&') {
					String sub = s.substring(i);
					if (!sub.startsWith("&amp;") && !sub.startsWith("&apos;")
							&& !sub.startsWith("&gt;") && !sub.startsWith("&lt;")
							&& !sub.startsWith("&quot;")) {
						result.replace(index, index + 1, "&amp;");
						index += 5;
					}
					else {
						index++;
					}
				}
				else if (ch == '\'') {
					result.replace(index, index + 1, "&apos;");
					index += 6;
				}
				else if (ch == '>') {
					result.replace(index, index + 1, "&gt;");
					index += 4;
				}
				else if (ch == '<') {
					result.replace(index, index + 1, "&lt;");
					index += 4;
				}
				else if (ch == '\"') {
					result.replace(index, index + 1, "&quot;");
					index += 6;
				}
				else {
					index++;
				}
			}

			return result.toString();
		}

		return null;
	}

	/**
	 *
	 * @param file
	 * @param encoding
	 * @return
	 * @throws IOException
     */
	public static String readStringFromFile(File file, String encoding) throws IOException {
		if (!file.exists()) {
			throw new IOException("File doesn't exist!");
		}

		long fileLen = file.length();
		if (fileLen <= 0L) {
			if (file.exists()) {
				return ""; // empty file
			}
			return null; // all other file len problems
		}
		if (fileLen > Integer.MAX_VALUE) { // max String size
			throw new IOException("File too big for loading into a String!");
		}

		FileInputStream fis = null;
		InputStreamReader isr = null;
		BufferedReader brin = null;

		int length = (int) fileLen;
		char[] buf = null;
		int realSize = 0;
		try {
			fis = new FileInputStream(file);
			isr = new InputStreamReader(fis, encoding);
			brin = new BufferedReader(isr, 64 * 1024);
			buf = new char[length];
			int c;
			while ((c = brin.read()) != -1) {
				buf[realSize] = (char) c;
				realSize++;
			}
		}
		finally {
			if (brin != null) {
				brin.close();
				isr = null;
				fis = null;
			}
			if (isr != null) {
				isr.close();
				fis = null;
			}
			if (fis != null) {
				fis.close();
			}
		}
		return new String(buf, 0, realSize);
	}

	/**
	 * Saves specified content to the file with specified charset.
	 * 
	 * @param file
	 * @param content
	 * @param charset
	 * @throws IOException
	 * @throws UnsupportedEncodingException
	 */
	public static void saveStringToFile(File file, String content, String charset)
			throws IOException {
		FileOutputStream out = new FileOutputStream(file);
		byte[] data = content.getBytes(charset);

		out.write(data);

		out.flush();
		out.close();
	}

	/**
	 *
	 * @param file
	 * @return
	 * @throws IOException
     */
	public static byte[] readBytesFromFile(File file) throws IOException {
		FileInputStream fileinputstream = new FileInputStream(file);
		long l = file.length();

		if (l > Integer.MAX_VALUE) {
			throw new IOException("File too big for loading into a byte array!");
		}

		byte byteArray[] = new byte[(int) l];

		int i = 0;

		for (int j = 0; (i < byteArray.length)
				&& (j = fileinputstream.read(byteArray, i, byteArray.length - i)) >= 0; i += j)
			;

		if (i < byteArray.length) {
			throw new IOException("Could not completely read the file " + file.getName());
		}
		fileinputstream.close();
		return byteArray;
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

	/**
	 * Reads content from specified URL
	 * 
	 * @param url
	 * @throws IOException
	 * @return Read content as string.
	 */
	public static String readStringFromUrl(URL url) throws IOException {
		StringBuffer buffer = new StringBuffer();
		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
		int ch;
		while ((ch = in.read()) != -1) {
			buffer.append((char) ch);
		}
		in.close();

		return buffer.toString();
	}

}