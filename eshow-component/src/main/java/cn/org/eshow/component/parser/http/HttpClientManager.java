package cn.org.eshow.component.parser.http;

import cn.org.eshow.component.parser.helper.Match;
import cn.org.eshow.util.CommonUtil;
import org.apache.http.client.HttpClient;
import org.apache.http.client.params.HttpClientParams;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * HTTP client functionality.
 */
public class HttpClientManager {

	public static final String DEFAULT_USER_AGENT = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1";

	private HttpClient client;

	private HttpInfo httpInfo;

	/**
	 * Constructor.
	 */
	public HttpClientManager() {
		client = new HttpClient();
		httpInfo = new HttpInfo(client);

		HttpClientParams clientParams = new HttpClientParams();
		clientParams.setBooleanParameter(
				"http.protocol.allow-circular-redirects", true);
		client.setParams(clientParams);
	}

	public void setCookiePolicy(String cookiePolicy) {
		if ("browser".equalsIgnoreCase(cookiePolicy)) {
			client.getParams().setCookiePolicy(
					CookiePolicy.BROWSER_COMPATIBILITY);
		} else if ("ignore".equalsIgnoreCase(cookiePolicy)) {
			client.getParams().setCookiePolicy(CookiePolicy.IGNORE_COOKIES);
		} else if ("netscape".equalsIgnoreCase(cookiePolicy)) {
			client.getParams().setCookiePolicy(CookiePolicy.NETSCAPE);
		} else if ("rfc_2109".equalsIgnoreCase(cookiePolicy)) {
			client.getParams().setCookiePolicy(CookiePolicy.RFC_2109);
		} else {
			client.getParams().setCookiePolicy(CookiePolicy.DEFAULT);
		}
	}

	/**
	 * Defines HTTP proxy for the client with specified host and port
	 * 
	 * @param hostName
	 * @param hostPort
	 */
	public void setHttpProxy(String hostName, int hostPort) {
		client.getHostConfiguration().setProxyHost(
				new ProxyHost(hostName, hostPort));
	}

	/**
	 * Defines HTTP proxy for the client with specified host
	 * 
	 * @param hostName
	 */
	public void setHttpProxy(String hostName) {
		client.getHostConfiguration().setProxyHost(new ProxyHost(hostName));
	}

	/**
	 * Defines user credintials for the HTTP proxy server
	 * 
	 * @param username
	 * @param password
	 */
	public void setHttpProxyCredentials(String username, String password,
			String host, String domain) {
		Credentials credentials = (host == null || domain == null
				|| "".equals(host.trim()) || "".equals(domain.trim())) ? new UsernamePasswordCredentials(
				username, password)
				: new NTCredentials(username, password, host, domain);
		client.getState().setProxyCredentials(AuthScope.ANY, credentials);
	}

	public HttpResponseWrapper execute(String url, String charset,
			String username, String password, Map<String, String> headers)
			throws HttpException {
		if (!url.startsWith("http://") && !url.startsWith("https://")) {
			url = "http://" + url;
		}

		url = CommonUtil.encodeUrl(url, charset);

		// if username and password are specified, define new credentials for
		// authenticaton
		if (username != null && password != null) {
			try {
				URL urlObj = new URL(url);
				client.getState().setCredentials(
						new AuthScope(urlObj.getHost(), urlObj.getPort()),
						new UsernamePasswordCredentials(username, password));
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
		}

		HttpMethodBase method;
		method = new GetMethod(url);
		identifyAsDefaultBrowser(method);

		// define request headers, if any exist
		if (headers != null) {
			Iterator<String> it = headers.keySet().iterator();
			while (it.hasNext()) {
				String headerName = it.next();
				String headerValue = headers.get(headerName);
				method.addRequestHeader(new Header(headerName, headerValue));
			}
		}

		try {
			int statusCode = client.executeMethod(method);

			// if there is redirection, try to download redirection page
			if ((statusCode == HttpStatus.SC_MOVED_TEMPORARILY)
					|| (statusCode == HttpStatus.SC_MOVED_PERMANENTLY)
					|| (statusCode == HttpStatus.SC_SEE_OTHER)
					|| (statusCode == HttpStatus.SC_TEMPORARY_REDIRECT)) {
				Header header = method.getResponseHeader("location");
				if (header != null) {
					String newURI = header.getValue();
					if (newURI != null && !newURI.equals("")) {
						newURI = CommonUtil.fullUrl(url, newURI);
						method.releaseConnection();
						method = new GetMethod(newURI);
						identifyAsDefaultBrowser(method);
						client.executeMethod(method);
					}
				}
			}

			HttpResponseWrapper httpResponseWrapper = new HttpResponseWrapper(
					method);

			// updates HTTP info with response's details
			this.httpInfo.setResponse(httpResponseWrapper);

			return httpResponseWrapper;
		} catch (IOException e) {
			throw new HttpException("IO error during HTTP execution for URL: "
					+ url, e);
		} finally {
			method.releaseConnection();
		}
	}

	/**
	 * Defines "User-Agent" HTTP header.
	 * 
	 * @param method
	 */
	private void identifyAsDefaultBrowser(HttpMethodBase method) {
		method.addRequestHeader(new Header("User-Agent", DEFAULT_USER_AGENT));
	}

	public HttpClient getHttpClient() {
		return client;
	}

	public HttpInfo getHttpInfo() {
		return httpInfo;
	}

	public static void main(String[] args) throws HttpException,
			UnsupportedEncodingException {
		Map<String, String> httpHeaderMap = new HashMap<String, String>();
		HttpClientManager manager = new HttpClientManager();
		HttpResponseWrapper res = manager.execute("http://www.djdkx.com/open/fanfanle",
				"utf-8", "", "", httpHeaderMap);
		String mimeType = res.getMimeType();

		byte[] responseBody = res.getBody();
		long contentLength = res.getContentLength();
		System.out.println(new String(responseBody, res.getCharset()));
		System.out.println(Match.match(new String(responseBody, res.getCharset()), "<body>(.*?)</body>"));
	}

}