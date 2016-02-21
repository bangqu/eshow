    <%@ page language="java" pageEncoding="utf-8"%>
    <%@ page import="java.io.*"%>
    <%@ page import="java.net.*"%>
    <%@ page import="java.util.*"%>
    <%@ page import="com.logo.eshow.components.ueditor.Uploader" %>
    <%@ page import="com.logo.eshow.components.upyun.UpYunConfig" %>
    <%@ page import="com.logo.eshow.components.upyun.UpYun" %>
    <%@ page import="com.logo.eshow.util.FileUtil" %>
    <%@ page import="com.logo.eshow.util.DateUtil" %>
    <%
    	request.setCharacterEncoding("utf-8");
    	response.setCharacterEncoding("utf-8");
    	String url = request.getParameter("upfile");
    	String state = "远程图片抓取成功！";
    	
    	String[] arr = url.split("ue_separate_ue");
    	String[] outSrc = new String[arr.length];
    	for(int i=0;i<arr.length;i++){

    		//格式验证
    		String type = getFileType(arr[i]);
			if(type.equals("")){
				state = "图片类型不正确！";
				continue;
			}
    		String saveName = Long.toString(new Date().getTime())+type;
    		//大小验证
    		HttpURLConnection.setFollowRedirects(false); 
		    HttpURLConnection   conn   = (HttpURLConnection) new URL(arr[i]).openConnection(); 
		    if(conn.getContentType().indexOf("image")==-1){
		    	state = "请求地址头不正确";
		    	continue;
		    }
		    if(conn.getResponseCode() != 200){
		    	state = "请求地址不存在！";
		    	continue;
		    }
		    String savePath = "/" + DateUtil.getDateTime("yyyy/MM/dd",new Date());
    		outSrc[i] = UpYunConfig.IMG + savePath + "/" + saveName + "!middle.jpg";
    		// 初始化空间
			UpYun upyun = new UpYun(UpYunConfig.BUCKET, UpYunConfig.USERNAME, UpYunConfig.PASSWORD);
    		try {
    			upyun.writeFile(savePath + "/" + saveName, FileUtil.inputStreamToByte(conn.getInputStream()), true);
    		} catch (Exception e) {
    			e.printStackTrace();
    			System.err.println("页面无法访问");
    		}
    	}
   	String outstr = "";
   	for(int i=0;i<outSrc.length;i++){
   		outstr+=outSrc[i]+"ue_separate_ue";
   	}
   	outstr = outstr.substring(0,outstr.lastIndexOf("ue_separate_ue"));
   	response.getWriter().print("{'url':'" + outstr + "','tip':'"+state+"','srcUrl':'" + url + "'}" );

    %>
    <%!
    public String getFileType(String fileName){
    	String[] fileType = {".gif" , ".png" , ".jpg" , ".jpeg" , ".bmp"};
    	Iterator<String> type = Arrays.asList(fileType).iterator();
    	while(type.hasNext()){
    		String t = type.next();
    		if(fileName.lastIndexOf(t)>0){
    			return t;
    		}
    	}
    	return "";
    }
    %>
