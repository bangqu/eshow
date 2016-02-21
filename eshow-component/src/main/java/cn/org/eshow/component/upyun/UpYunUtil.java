package cn.org.eshow.component.upyun;

import cn.org.eshow.util.DateUtil;
import cn.org.eshow.util.FileUtil;

import java.io.File;
import java.util.Date;

public class UpYunUtil {

	/**
	 * 上传图片
	 * 
	 * @return 上传后地址
	 */
	public static String upload(File file) {
		try {
			// 初始化空间
			UpYun upyun = new UpYun("eshow", UpYunConfig.USERNAME, UpYunConfig.PASSWORD);
			String path = "/" + DateUtil.getDateTime("yyyy/MM/dd", new Date()) + "/"
					+ System.currentTimeMillis() + FileUtil.getFileExt(file.getName());// 又拍云存储的位置
			if (upyun.writeFile(path, file, true))// 上传图片到又拍云存储
			{
				return UpYunConfig.IMG + path;
			} else {
				return "";
			}
		} catch (Exception e) {
			return "";
		}
	}

}
