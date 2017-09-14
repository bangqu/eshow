package cn.org.eshow.webapp.util;

import cn.org.eshow.common.page.Page;
import cn.org.eshow.util.JacksonUtil;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 渲染工具类
 */
public class RenderUtil {

    /**
     * 返回成功信息
     */
    public static void success() {
        Struts2Utils.renderText("{\"status\":\"1\"}");
    }

    /**
     * 返回成功信息及提示
     */
    public static void success(String msg) {
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + msg + "\"}");
    }

    /**
     * 返回成功信息及提示及对应的PO
     */
    public static void success(String msg, Object object) {
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + msg + "\",\"" + object.getClass().getSimpleName().toLowerCase() + "\":" + JacksonUtil.toJson(object) + "}");
    }

    /**
     * 返回成功信息及提示及对应的结果
     */
    public static void success(String msg, String name, String result) {
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + msg + "\",\"" + name + "\":" + result + "}");
    }

    /**
     * 返回成功信息及提示及对应的PO
     */
    public static void success(String msg, String name, Object object) {
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + msg + "\",\"" + name + "\":" + JacksonUtil.toJson(object) + "}");
    }


    /**
     * 返回失败信息
     */
    public static void failure() {
        Struts2Utils.renderText("{\"status\":\"-5\"}");
    }

    /**
     * 返回失败
     */
    public static void failure(String msg) {
        Struts2Utils.renderText("{\"status\":\"-5\",\"msg\":\"" + msg + "\"}");
    }

    /**
     * 暂无数据
     */
    public static void noData() {
        Struts2Utils.renderText("{\"status\":\"0\",\"msg\":\"暂无数据\"}");
    }


    /**
     * 缺少参数
     */
    public static void errorParame(String msg) {
        Struts2Utils.renderText("{\"status\":\"-1\",\"msg\":\"" + msg + "\"}");
    }

    /**
     * 访问令牌过期提示
     */
    public static void expires() {
        Struts2Utils.renderText("{\"status\":\"-9\",\"msg\":\"用户信息过期，请重新登录\"}");
    }


    /**
     * 输出列表JSONArray
     */
    public static void list(String msg, String name, List list) {
        if (list.isEmpty()) {
            noData();
        } else {
            Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + msg + "\",\"" + name + "\":" + JacksonUtil.toJson(list) + "}");
        }
    }

    /**
     * 输出分页列表JSONArray
     */
    public static void page(String msg, String name, Page page, List list) {
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + msg + "\",\"total\":" + page.getTotal() + ",\"totalPage\":" + page.getTotalPage() + ",\"pageSize\":" + page.getPageSize() + ",\"" + name + "\":" + JacksonUtil.toJson(list) + "}");
    }

    /**
     * 输出分页JSONArray
     */
    public static void search(String msg, String name, Page page) {
        if (page.getDataList().isEmpty()) {
            noData();
        } else {
            Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + msg + "\",\"total\":" + page.getTotal() + ",\"totalPage\":" + page.getTotalPage() + ",\"pageSize\":" + page.getPageSize() + ",\"" + name + "\":" + JacksonUtil.toJson(page.getDataList()) + "}");
        }
    }

    /**
     * 根据Map参数输入结果
     */
    public static void result(Integer status, String msg, Map<String, String> map) {
        StringBuffer sbf = new StringBuffer();
        sbf.append("{\"status\":\"" + status + "\",");
        sbf.append("\"msg\":\"" + msg);
        if (map == null || map.size() == 0) {
            sbf.append("\"}");
            Struts2Utils.renderText(sbf.toString());
            return;
        }
        sbf.append("\"");
        Iterator iter = map.entrySet().iterator();
        while (iter.hasNext()) {
            Map.Entry entry = (Map.Entry) iter.next();
            sbf.append(",\"" + entry.getKey() + "\":" + entry.getValue());
        }
        sbf.append("}");
        Struts2Utils.renderText(sbf.toString());
    }

    public static void main(String[] args) throws Exception {
        Map<String, String> map = new HashMap<String, String>();
        map.put("no", "2121212121");
        //result(1, "订单保存成功", map);
    }

}
