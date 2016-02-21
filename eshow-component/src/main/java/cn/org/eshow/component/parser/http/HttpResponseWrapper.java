package cn.org.eshow.component.parser.http;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * Class defines http server response. 
 */
public class HttpResponseWrapper {
	
	private String charset;
	private String mimeType;
	private byte[] body;
	private Map<String, String> headers = new HashMap<String, String>();
    private int statusCode;
    private String statusText;

    /**
	 * Constructor - defines response result based on specified HttpMethodBase instance.
	 * @param method
	 */
	public HttpResponseWrapper(HttpMethodBase method) {
        try {
			this.body = method.getResponseBody();
        } catch (IOException e) {
			// todo: handle exception
        }
		
		Header[] headerArray = method.getResponseHeaders();
        if (headerArray != null) {
        	for (int i = 0; i < headerArray.length; i++) {
        		String currName = headerArray[i].getName();
        		String currValue = headerArray[i].getValue();
        		headers.put(currName, currValue);
        		
        		if ("content-type".equalsIgnoreCase(currName)) {
        			int index = currValue.indexOf(';');
        			this.mimeType = index > 0 ? currValue.substring(0, index) : currValue;
        		}
        	}
        }

        this.charset = method.getResponseCharSet();
        this.statusCode = method.getStatusCode();
        this.statusText = method.getStatusText();

    }

    public long getContentLength() {
        return body == null ? 0 : body.length;
    }

    public String getCharset() {
		return charset;
	}
	
	public String getMimeType() {
		return mimeType;
	}
	
	public byte[] getBody() {
		return body;
	}
	
	public InputStream getBodyAsInputStream() {
		return new ByteArrayInputStream(body);
	}
	
	public Map<String, String> getHeaders() {
		return headers;
	}
	
	public String getHeaderValue(String headerName) {
		return (String) headers.get(headerName);
	}

    public int getStatusCode() {
        return statusCode;
    }

    public String getStatusText() {
        return statusText;
    }

}