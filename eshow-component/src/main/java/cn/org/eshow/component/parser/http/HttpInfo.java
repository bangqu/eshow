package cn.org.eshow.component.parser.http;


import org.apache.http.client.HttpClient;

import java.util.Map;
import java.util.HashMap;

/**
 * Class offers access to HTTP client and response details to the user.
 */
public class HttpInfo {

	public HttpClient client;

	public long contentLength = 0;
	public String charset = "";
	public String mimeType = "";
	private Map<String, String> headers = new HashMap<String, String>();
	public int statusCode = 0;
	public String statusText = "";

	public long totalLength = 0;
	public int totalResponses = 0;

	public HttpInfo(HttpClient client) {
		this.client = client;
	}

	public void setResponse(HttpResponseWrapper wrapper) {
		this.contentLength = wrapper.getContentLength();
		this.charset = wrapper.getCharset();
		this.mimeType = wrapper.getMimeType();
		this.headers = wrapper.getHeaders();
		this.statusCode = wrapper.getStatusCode();
		this.statusText = wrapper.getStatusText();

		this.totalLength += this.contentLength;
		this.totalResponses++;
	}

}