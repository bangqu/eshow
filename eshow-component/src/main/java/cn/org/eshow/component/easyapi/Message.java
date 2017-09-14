package cn.org.eshow.component.easyapi;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by alicasagile on 16/4/15.
 */
public class Message {
    public String status;
    public String msg;
    public List<Map<String, String>> data = new ArrayList<Map<String, String>>();

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<Map<String, String>> getData() {
        return data;
    }

    public void setData(List<Map<String, String>> data) {
        this.data = data;
    }
}
