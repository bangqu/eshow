package cn.org.eshow.common.page;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.Assert;

import java.io.Serializable;

/**
 * 分页工具类
 *
 * @author leida
 */
public class PageUtil implements Serializable {

    private static final long serialVersionUID = -6561956922405541734L;

    private static final Log log = LogFactory.getLog(PageUtil.class);

    /**
     * <p>
     * 修改Url的某个参数的值。
     * </p>
     *
     * @param url   要替换参数的URL
     * @param key   要替换参数的name
     * @param value 要为该参数替换的值
     * @param isAdd 如果该参数不存在,是否添加
     * @return String
     */
    public static String parseUrl(String url, String key, String value,
                                  boolean isAdd) {
        Assert.notNull(url);
        Assert.notNull(key);
        boolean isExist = false;
        String[] split1 = url.split("\\?");
        String urlLeft = split1[0]; // URI
        String query = split1.length == 2 ? split1[1] : ""; // 参数
        if (split1.length >= 2) {// 如果有参数的话
            query = split1[1];
        } else {// 如果有参数的话
            if (isAdd) {// 如果添加
                return split1[0] + "?" + key + "=" + value;
            } else {// 如果不添加
                return split1[0];
            }
        }
        String[] parseUrl = query.split("&");
        query = "";
        for (int i = 0; i < parseUrl.length; i++) {
            String[] split2 = parseUrl[i].split("=");
            String paramName = split2[0];
            String paramValue = split2.length == 2 ? split2[1] : "";
            if (paramName.equals(key)) {// 如果这个参数的要修改的参数
                isExist = true;
                paramValue = value;
            }
            if (query.equals("")) {
                query = paramName + "=" + paramValue;
            } else {
                query = query + "&" + paramName + "=" + paramValue;
            }
        }
        url = query.equals("") ? urlLeft : urlLeft + "?" + query;
        if (isAdd && !isExist) {// 如果需要添加,并且不存在,就添加
            url = PageUtil.addParam(url, key, value);
        }
        if (log.isDebugEnabled()) {
            log.debug("url: '" + url + "'");
        }
        return url;
    }

    /**
     * <p>
     * 添加参数。
     * </p>
     *
     * @param url
     * @param key
     * @param value
     * @return String
     */
    public static String addParam(String url, String key, String value) {
        Assert.notNull(url);
        Assert.notNull(key);
        if (url.indexOf("?") < 1) {
            url += "?" + key + "=" + value;
        } else {
            url += "&" + key + "=" + value;
        }
        return url;
    }

    /**
     * @param url
     * @param key
     * @return
     */
    public static String delParam(String url, String key) {
        Assert.notNull(url);
        Assert.notNull(key);
        String tempUrl = "";
        if (url.indexOf("?") >= 1) {
            String[] tempSplit = url.split("\\?");
            tempUrl = url.split("\\?")[0];
            if (tempSplit.length >= 2) {
                url = url.split("\\?")[1];
            }
        } else {
            return url;
        }
        String[] parseUrl = url.split("&");
        url = "";
        for (int i = 0; i < parseUrl.length; i++) {
            String[] split2 = parseUrl[i].split("=");
            if (split2.length <= 0) {
                continue;
            }
            if (!split2[0].equals(key)) {
                if (split2.length >= 2) {
                    url += split2[0] + "=" + split2[1] + "&";
                } else {
                    url += split2[0] + "=" + "" + "&";
                }
            }

        }
        if ((url.lastIndexOf("&") != -1)
                && (url.lastIndexOf("&") == (url.length() - 1))) {
            url = url.substring(0, url.lastIndexOf("&"));
        }
        if (url.equals("")) {
            return tempUrl;
        } else {
            return tempUrl + "?" + url;
        }
    }

}
