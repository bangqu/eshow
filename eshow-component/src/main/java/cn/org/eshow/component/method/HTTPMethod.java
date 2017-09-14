package cn.org.eshow.component.method;

import org.apache.http.Header;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.*;
import org.apache.http.impl.client.CloseableHttpClient;

import java.io.IOException;
import java.net.URI;
import java.util.List;

/**
 * API: https://hc.apache.org/httpcomponents-client-ga/httpclient/apidocs/
 * <p/>
 * API MEHTOD:
 * https://hc.apache.org/httpcomponents-client-ga/httpclient/apidocs/
 * org/apache/http/client/methods/package-frame.html
 * <p/>
 * HttpClient的支持在HTTP/1.1规范中定义的所有的HTTP方法：GET, HEAD, POST, PUT, DELETE, TRACE 和
 * OPTIONS。每有一个方法都有一个对应的类：HttpGet，HttpHead，HttpPost，HttpPut，HttpDelete，
 * HttpTrace和HttpOptions
 * 。所有的这些类均实现了HttpUriRequest接口，故可以作为execute的执行参数使用。请求URI是能够应用请求的统一资源标识符。
 * HTTP请求的URI包含一个协议计划protocol scheme，主机名host name,，可选的端口optional
 * port，资源的路径resource path，可选的查询optional query和可选的片段optional fragment。
 */
public class HTTPMethod {

    /**
     * 1.1 GET
     *
     * @param httpclient
     * @param uri
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
    public CloseableHttpResponse doGET(CloseableHttpClient httpclient, String uri, Header[] headers) throws ClientProtocolException, IOException {
        HttpGet httpGet = new HttpGet(uri);
        if (null != headers && headers.length > 0) {
            httpGet.setHeaders(headers);
        }
        CloseableHttpResponse response = httpclient.execute(httpGet);
        return response;
    }

    /**
     * 1.2 GET
     *
     * @param httpclient
     * @param uri
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
    public CloseableHttpResponse doGET(CloseableHttpClient httpclient, URI uri, Header[] headers) throws ClientProtocolException, IOException {
        HttpGet httpGet = new HttpGet(uri);
        if (null != headers && headers.length > 0) {
            httpGet.setHeaders(headers);
        }
        CloseableHttpResponse response = httpclient.execute(httpGet);
        return response;
    }


    /**
     * 2.1 POST
     *
     * @param httpclient
     * @param uri
     * @param nvps
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
    public CloseableHttpResponse doPOST(CloseableHttpClient httpclient, String uri, List<NameValuePair> nvps, Header[] headers) throws ClientProtocolException, IOException {
        HttpPost httpPost = new HttpPost(uri);
        if (null != nvps && nvps.size() > 0) {
            httpPost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));
        }
        if (null != headers && headers.length > 0) {
            httpPost.setHeaders(headers);
        }
        CloseableHttpResponse response = httpclient.execute(httpPost);
        return response;
    }

    /**
     * 2.2 POST
     *
     * @param httpclient
     * @param uri
     * @param nvps
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
    public CloseableHttpResponse doPOST(CloseableHttpClient httpclient, URI uri, List<NameValuePair> nvps, Header[] headers) throws ClientProtocolException, IOException {
        HttpPost httpPost = new HttpPost(uri);
        if (null != nvps && nvps.size() > 0) {
            httpPost.setEntity(new UrlEncodedFormEntity(nvps));
        }
        if (null != headers && headers.length > 0) {
            httpPost.setHeaders(headers);
        }
        httpPost.setEntity(new UrlEncodedFormEntity(nvps));
        CloseableHttpResponse response = httpclient.execute(httpPost);
        return response;
    }

    /**
     * 3.1 HEAD
     *
     * @param httpclient
     * @param uri
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
    public CloseableHttpResponse doHEAD(CloseableHttpClient httpclient, String uri) throws ClientProtocolException, IOException {
        HttpHead httpHead = new HttpHead(uri);
        CloseableHttpResponse response = httpclient.execute(httpHead);
        return response;
    }

    /**
     * 3.2 HEAD
     *
     * @param httpclient
     * @param uri
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
    public CloseableHttpResponse doHEAD(CloseableHttpClient httpclient, URI uri) throws ClientProtocolException, IOException {
        HttpHead httpHead = new HttpHead(uri);
        CloseableHttpResponse response = httpclient.execute(httpHead);
        return response;
    }

    /**
     * 4.1 PUT
     *
     * @param httpclient
     * @param uri
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
    public CloseableHttpResponse doPUT(CloseableHttpClient httpclient, String uri, List<NameValuePair> nvps, Header[] headers) throws ClientProtocolException, IOException {
        HttpPut httpPut = new HttpPut(uri);
        if (null != nvps && nvps.size() > 0) {
            httpPut.setEntity(new UrlEncodedFormEntity(nvps));
        }
        if (null != headers && headers.length > 0) {
            httpPut.setHeaders(headers);
        }
        httpPut.setEntity(new UrlEncodedFormEntity(nvps));
        CloseableHttpResponse response = httpclient.execute(httpPut);
        return response;
    }


    /**
     * 5.1 DELETE
     *
     * @param httpclient
     * @param uri
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
    public CloseableHttpResponse doDELETE(CloseableHttpClient httpclient, String uri, List<NameValuePair> nvps, Header[] headers) throws ClientProtocolException, IOException {
        HttpDeleteExtend httpDelete = new HttpDeleteExtend(uri);
        if (null != nvps && nvps.size() > 0) {
            httpDelete.setEntity(new UrlEncodedFormEntity(nvps));
        }
        if (null != headers && headers.length > 0) {
            httpDelete.setHeaders(headers);
        }
        httpDelete.setEntity(new UrlEncodedFormEntity(nvps));
        CloseableHttpResponse response = httpclient.execute(httpDelete);
        return response;
    }

    /**
     * 5.1 DELETE
     * @param httpclient
     * @param uri
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
//    public CloseableHttpResponse doDELETE(CloseableHttpClient httpclient, String uri) throws ClientProtocolException, IOException{
//        HttpDelete httpDelete = new HttpDelete(uri);
//        CloseableHttpResponse response = httpclient.execute(httpDelete);
//        return response;
//    }


    /**
     * 6.1 TRACE
     *
     * @param httpclient
     * @param uri
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
    public CloseableHttpResponse doTRACE(CloseableHttpClient httpclient, String uri) throws ClientProtocolException, IOException {
        HttpTrace httpTrace = new HttpTrace(uri);
        CloseableHttpResponse response = httpclient.execute(httpTrace);
        return response;
    }

    /**
     * 6.2 TRACE
     *
     * @param httpclient
     * @param uri
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
    public CloseableHttpResponse doTRACE(CloseableHttpClient httpclient, URI uri) throws ClientProtocolException, IOException {
        HttpTrace httpTrace = new HttpTrace(uri);
        CloseableHttpResponse response = httpclient.execute(httpTrace);
        return response;
    }

    /**
     * 7.1 OPTIONS
     *
     * @param httpclient
     * @param uri
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
    public CloseableHttpResponse doOPTIONS(CloseableHttpClient httpclient, String uri) throws ClientProtocolException, IOException {
        HttpOptions httpOptions = new HttpOptions(uri);
        CloseableHttpResponse response = httpclient.execute(httpOptions);
        return response;
    }

    /**
     * 7.2 OPTIONS
     *
     * @param httpclient
     * @param uri
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
    public CloseableHttpResponse doOPTIONS(CloseableHttpClient httpclient, URI uri) throws ClientProtocolException, IOException {
        HttpOptions httpOptions = new HttpOptions(uri);
        CloseableHttpResponse response = httpclient.execute(httpOptions);
        return response;
    }
}