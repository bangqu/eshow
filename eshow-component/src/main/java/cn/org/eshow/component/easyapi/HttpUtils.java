package cn.org.eshow.component.easyapi;

import cn.org.eshow.component.method.HTTPMethod;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.NameValuePair;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by alicasagile on 16/4/11.
 */
public class HttpUtils {
    /**
     * 通过URL得到Response Body
     *
     * @param url
     * @param charset
     * @return String
     */
    public static final String getContentGet(String url, String charset) {
        try {
            CloseableHttpResponse response = getResponseGet(url, null);
            return EntityUtils.toString(response.getEntity(), charset);
        } catch (Exception e) {
            return "";
        }
    }


    /**
     * 通过URL得到Response Body
     *
     * @param url
     * @param charset
     * @return String
     */
    public static final String getContentPost(String url, String param, String charset) {
        try {
            CloseableHttpResponse response = getResponsePost(url, param);
            return EntityUtils.toString(response.getEntity(), charset);
        } catch (Exception e) {
            return "";
        }

    }

    /**
     * 通过URL得到Response Body
     *
     * @param url
     * @param charset
     * @return String
     */
    public static final String getContentPut(String url, String param,String charset) {
        try {
            CloseableHttpResponse response = getResponsePut(url, param);
            return EntityUtils.toString(response.getEntity(), charset);
        } catch (Exception e) {
            return "";
        }
    }

    /**
     * 通过URL得到Response Body
     *
     * @param url
     * @param charset
     * @return String
     */
    public static final String getContentDelete(String url, String param,String charset) {
        try {
            CloseableHttpResponse response = getResponseDelete(url,param);
            return EntityUtils.toString(response.getEntity(), charset);
        } catch (Exception e) {
            return "";
        }
    }


    /**
     * GET通过URL得到Response
     *
     * @param url
     * @return String
     */
    public static final CloseableHttpResponse getResponseGet(String url, String param) {
        CloseableHttpClient client = HttpClients.createDefault();
        try {
            HTTPMethod method = new HTTPMethod();
            if (StringUtils.isEmpty(param)) {
                return method.doGET(client, url, null);
            } else {
                if (url.contains("?")) {
                    return method.doGET(client, url + "&" + param, null);
                } else {
                    return method.doGET(client, url + "?" + param, null);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * POST通过URL得到Response
     *
     * @param url
     * @return String
     */
    public static final CloseableHttpResponse getResponsePost(String url, String param) {
        CloseableHttpClient client = HttpClients.createDefault();
        try {

            HTTPMethod method = new HTTPMethod();
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            if (!StringUtils.isEmpty(param)) {
                String[] pa = param.split("&");
                if (pa != null && pa.length > 0) {
                    for (String ss : pa) {
                        String[] res = ss.split("=");
                        if (res != null && res.length > 1) {
                            params.add(new BasicNameValuePair(res[0], res[1]));
                        }
                    }
                }
            }

            return method.doPOST(client, url, params, null);
        } catch ( Exception e){
            return null;
        }

    }


    /**
     * PUT通过URL得到Response
     *
     * @param url
     * @return String
     */
    public static final CloseableHttpResponse getResponsePut(String url, String param) {
        CloseableHttpClient client = HttpClients.createDefault();
        try {

            HTTPMethod method = new HTTPMethod();
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            if (!StringUtils.isEmpty(param)) {
                String[] pa = param.split("&");
                if (pa != null && pa.length > 0) {
                    for (String ss : pa) {
                        String[] res = ss.split("=");
                        if (res != null && res.length > 1) {
                            params.add(new BasicNameValuePair(res[0], res[1]));
                        }
                    }
                }
            }
            return method.doPUT(client, url, params, null);
        } catch ( Exception e){
            return null;
        }
    }

    /**
     * DELETE通过URL得到Response
     *
     * @param url
     * @return String
     */
    public static final CloseableHttpResponse getResponseDelete(String url, String param) {
        CloseableHttpClient client = HttpClients.createDefault();
        try {

            HTTPMethod method = new HTTPMethod();
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            if (!StringUtils.isEmpty(param)) {
                String[] pa = param.split("&");
                if (pa != null && pa.length > 0) {
                    for (String ss : pa) {
                        String[] res = ss.split("=");
                        if (res != null && res.length > 1) {
                            params.add(new BasicNameValuePair(res[0], res[1]));
                        }
                    }
                }
            }
            return method.doDELETE(client, url, params, null);
        } catch ( Exception e){
            return null;
        }
    }
}
