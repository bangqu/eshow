package cn.org.eshow.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class StringUtil {

	private static final Log log = LogFactory.getLog(StringUtil.class);

	public static String empty(Object content) {
		if (content == null) {
			return StringUtils.EMPTY;
		}
		if (StringUtils.isBlank(content.toString())) {
			return StringUtils.EMPTY;
		} else {
			return content.toString();
		}
	}

	public static String replace(Object obj) {
		if (obj == null) {
			obj = new Object();
		}
		String str = ConvertUtils.convert(obj);
		if (StringUtils.isBlank(str)) {
			return StringUtils.EMPTY;
		}
		str = str.replaceAll("\t", StringUtils.EMPTY).replaceAll("\n", StringUtils.EMPTY).trim();
		return str;
	}

	/**
	 * 取字符串的前toCount个字符
	 * 
	 * @param str
	 *            被处理字符串
	 * @param toCount
	 *            截取长度
	 * @param more
	 *            后缀字符串
	 * @return String
	 */
	@SuppressWarnings("static-access")
	public static String substring(String str, int toCount, String more) {
		int reInt = 0;
		String reStr = "";
		if (str == null)
			return "";
		char[] tempChar = str.toCharArray();
		for (int kk = 0; (kk < tempChar.length && toCount > reInt); kk++) {
			String s1 = str.valueOf(tempChar[kk]);
			byte[] b = s1.getBytes();
			reInt += b.length;
			reStr += tempChar[kk];
		}
		if (toCount == reInt || (toCount == reInt - 1))
			reStr += more;
		return reStr;
	}

	public static String encode(Object obj) {
		if (obj == null) {
			return StringUtils.EMPTY;
		}
		try {
			return URLEncoder.encode(obj.toString(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return obj.toString();
	}

	/**
	 * Encode a string using algorithm specified in web.xml and return the
	 * resulting encrypted password. If exception, the plain credentials string
	 * is returned
	 * 
	 * @param password
	 *            Password or other credentials to use in authenticating this
	 *            username
	 * @param algorithm
	 *            Algorithm used to do the digest
	 * @return encypted password based on the algorithm.
	 */
	public static String encodePassword(String password, String algorithm) {
		byte[] unencodedPassword = password.getBytes();

		MessageDigest md = null;

		try {
			// first create an instance, given the provider
			md = MessageDigest.getInstance(algorithm);
		} catch (Exception e) {
			log.error("Exception: " + e);

			return password;
		}

		md.reset();

		// call the update method one or more times
		// (useful when you don't know the size of your data, eg. stream)
		md.update(unencodedPassword);

		// now calculate the hash
		byte[] encodedPassword = md.digest();

		StringBuffer buf = new StringBuffer();

		for (byte anEncodedPassword : encodedPassword) {
			if ((anEncodedPassword & 0xff) < 0x10) {
				buf.append("0");
			}

			buf.append(Long.toString(anEncodedPassword & 0xff, 16));
		}

		return buf.toString();
	}

	/**
	 * Encode a string using Base64 encoding. Used when storing passwords as
	 * cookies. This is weak encoding in that anyone can use the decodeString
	 * routine to reverse the encoding.
	 * 
	 * @param str
	 *            the string to encode
	 * @return the encoded string
	 */
	public static String encodeString(String str) {
		Base64 encoder = new Base64();
		return new String(encoder.encode(str.getBytes())).trim();
	}

	/**
	 * Decode a string using Base64 encoding.
	 * 
	 * @param str
	 *            the string to decode
	 * @return the decoded string
	 */
	public static String decodeString(String str) {
		Base64 dec = new Base64();
		return new String(dec.decode(str.getBytes()));
	}

	public static char ascii2Char(int ASCII) {   
        return (char) ASCII;   
    }   
	
	public static String ascii2String(String ASCIIs) {
		String[] ASCIIss = ASCIIs.split(",");
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < ASCIIss.length; i++) {
			sb.append((char) ascii2Char(Integer.parseInt(ASCIIss[i])));
		}
		return sb.toString();
	}

	public static void main(String[] args) {
		System.out.println(decodeString("a5a86401ff25d8e78cd5f4deeb5bf7a07eb3bf4f"));
	}
}
