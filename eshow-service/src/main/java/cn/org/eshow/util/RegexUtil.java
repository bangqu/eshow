package cn.org.eshow.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 正则表达式Util类
 *
 * @author leida
 */
public class RegexUtil {

    /**
     * Email正则表达式
     */
    public final static String EMAIL_REGEX = "\\w+([-+\\.]\\w+)*@\\w+([-\\.]\\w+)*\\.\\w+([-\\.]\\w+)*";

    /**
     * 手机号码
     */
    public final static String MOBILE_REGEX = "^1[345789]\\d{9}$";

    /**
     *
     * @param email
     * @return
     */
    public static boolean email(String email) {
        Pattern pattern = Pattern.compile(EMAIL_REGEX);
        Matcher matcher = pattern.matcher(email);
        if (matcher.matches()) {
            return true;
        }
        return false;
    }

    /**
     *
     * @param mobile
     * @return
     */
    public static boolean mobile(String mobile) {
        Pattern pattern = Pattern.compile(MOBILE_REGEX);
        Matcher matcher = pattern.matcher(mobile);
        if (matcher.matches()) {
            return true;
        }
        return false;
    }

    public static void main(String[] args) {
        System.out.println(email("zhang20084@126.com"));
        System.out.println(mobile("13656171020"));
    }
}