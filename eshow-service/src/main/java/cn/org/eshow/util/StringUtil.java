package cn.org.eshow.util;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 */
public class StringUtil {

    private static final Log log = LogFactory.getLog(StringUtil.class);

    /**
     * @param content
     * @return
     */
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

    /**
     * @param obj
     * @return
     */
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
     * @param str     被处理字符串
     * @param toCount 截取长度
     * @param more    后缀字符串
     * @return String
     */
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

    /**
     * @param obj
     * @return
     */
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
     * @param password  Password or other credentials to use in authenticating this username
     * @param algorithm Algorithm used to do the digest
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
     * @param str the string to encode
     * @return the encoded string
     */
    public static String encodeString(String str) {
        Base64 encoder = new Base64();
        return new String(encoder.encode(str.getBytes())).trim();
    }

    /**
     * Decode a string using Base64 encoding.
     *
     * @param str the string to decode
     * @return the decoded string
     */
    public static String decodeString(String str) {
        Base64 dec = new Base64();
        return new String(dec.decode(str.getBytes()));
    }

    /**
     * @param ASCII
     * @return
     */
    public static char ascii2Char(int ASCII) {
        return (char) ASCII;
    }

    /**
     * @param ASCIIs
     * @return
     */
    public static String ascii2String(String ASCIIs) {
        String[] ASCIIss = ASCIIs.split(",");
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < ASCIIss.length; i++) {
            sb.append((char) ascii2Char(Integer.parseInt(ASCIIss[i])));
        }
        return sb.toString();
    }

    /**
     * MD5 加密方法
     *
     * @param str 待加密字符串
     * @return 加密后字符串
     */
    public static String md5(String str) {
        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
        MessageDigest md5 = null;
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        md5.update(str.getBytes());
        byte[] encodedValue = md5.digest();
        int j = encodedValue.length;
        char finalValue[] = new char[j * 2];
        int k = 0;
        for (int i = 0; i < j; i++) {
            byte encoded = encodedValue[i];
            finalValue[k++] = hexDigits[encoded >> 4 & 0xf];
            finalValue[k++] = hexDigits[encoded & 0xf];
        }
        return new String(finalValue);
    }

    public static String asterisk(String name) {
        StringBuffer stringBuffer = new StringBuffer();
        if (name != null) {
            //邮箱显示首末位，中间显示三个*
            if (name.contains("@")) {
                String[] s = name.split("@");
                if (s.length == 2) {
                    int length = s[0].length();
                    stringBuffer.append(s[0].charAt(0));
                    stringBuffer.append("***");
                    stringBuffer.append(s[0].charAt(length - 1));
                    stringBuffer.append("@");
                    stringBuffer.append(s[1]);
                }
            }
            String check1 = "^1[345789]\\d{9}$";
            Pattern regex1 = Pattern.compile(check1);
            Matcher matcher = regex1.matcher(name);
            matcher.matches();
            if (matcher.matches()) {
                stringBuffer.append(name.substring(0, 4));
                stringBuffer.append("****");
                stringBuffer.append(name.substring(8, 11));
            }
        }
        return stringBuffer.toString();
    }

    public static void main(String[] args) {
        System.out.println(decodeString("a5a86401ff25d8e78cd5f4deeb5bf7a07eb3bf4f"));
    }
}
