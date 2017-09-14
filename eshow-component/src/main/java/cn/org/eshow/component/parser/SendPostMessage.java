package cn.org.eshow.component.parser;

import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public class SendPostMessage {

	private HttpURLConnection conn = null;

	public boolean send(String urlAddr, Map map) throws Exception {

		boolean isSuccess = false;
		StringBuffer params = new StringBuffer();

		Iterator it = map.entrySet().iterator();
		while (it.hasNext()) {
			Entry element = (Entry) it.next();
			params.append(element.getKey());
			params.append("=");
			params.append(element.getValue());
			params.append("&");
		}

		if (params.length() > 0) {
			params.deleteCharAt(params.length() - 1);
		}

		try {
			URL url = new URL(urlAddr);
			conn = (HttpURLConnection) url.openConnection();

			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setUseCaches(false);
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			conn.setRequestProperty("Content-Length", String.valueOf(params.length()));
			conn.setDoInput(true);
			conn.connect();

			OutputStreamWriter out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
			out.write(params.toString());
			out.flush();
			out.close();

			int code = conn.getResponseCode();
			if (code != 200) {
				System.out.println("ERROR===" + code);
			} else {
				isSuccess = true;
				System.out.println("Success!");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			conn.disconnect();
		}
		return isSuccess;
	}
}