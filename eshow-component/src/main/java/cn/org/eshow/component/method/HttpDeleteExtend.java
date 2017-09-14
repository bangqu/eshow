package cn.org.eshow.component.method;

import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;

import java.net.URI;

/**
 *
 */
public class HttpDeleteExtend extends HttpEntityEnclosingRequestBase {
    public static final String METHOD_NAME = "DELETE";

    public HttpDeleteExtend() {
    }

    public HttpDeleteExtend(URI uri) {
        this.setURI(uri);
    }

    public HttpDeleteExtend(String uri) {
        this.setURI(URI.create(uri));
    }

    public String getMethod() {
        return "DELETE";
    }
}
