package cn.org.eshow.component.easyapi.util;

import cn.org.eshow.component.easyapi.HttpUtils;
import cn.org.eshow.component.easyapi.Message;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang3.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by alicasagile on 16/5/4.
 */
public class Comm {

    /**
     * get方法
     *
     * @param url
     * @param temp
     * @return
     */
    public static Message comm(String url, String temp) {
        Message message = null;
        try {
            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> mapDate = mapper.readValue(HttpUtils.getContentGet(url, "UTF-8").toString(), Map.class);
            message = new Message();
            message.setStatus(String.valueOf(mapDate.get("status")));
            message.setMsg(String.valueOf(mapDate.get("msg")));
            if (StringUtils.isNotEmpty(temp) && "1".equals(message.getStatus())) {
                message.setData((List<Map<String, String>>) mapDate.get(temp));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return message;
    }

    /**
     * post
     *
     * @param url
     * @param temp
     * @param param
     * @return
     */
    public static Message comm(String url, String temp, String param) {
        Message message = null;
        try {
            ObjectMapper mapper = new ObjectMapper();
            String result = HttpUtils.getContentPost(url, param, "UTF-8");
            if (StringUtils.isNotEmpty(result)) {
                Map<String, Object> mapDate = mapper.readValue(result, Map.class);
                message = new Message();
                message.setStatus(String.valueOf(mapDate.get("status")));
                message.setMsg(String.valueOf(mapDate.get("msg")));
                if (StringUtils.isNotEmpty(temp) && "1".equals(message.getStatus())) {
                    message.setData((List<Map<String, String>>) mapDate.get(temp));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return message;
    }
}
