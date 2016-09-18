package cn.org.eshow.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 订单工具类
 */
public class OrderUtil {

    /**
     * 获取默认格式订单号
     *
     * @return String 订单号
     */
    public static String getOrderNo() {
        Date date = new Date();
        DateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        return df.format(date);
    }

}
