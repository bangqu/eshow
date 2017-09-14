package cn.org.eshow.component.qiniu;

import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import static cn.org.eshow.component.qiniu.QiniuConfig.ACCESS_KEY;
import static cn.org.eshow.component.qiniu.QiniuConfig.SECRET_KEY;

/**
 * 七牛工具类
 *
 * @author leida
 */
public class QiniuUtil {

    /**
     * 文件名及路径
     */
    public static String key() {
        return getDateTime("yyyy/MM/dd", new Date()) + "/" + System.currentTimeMillis();
    }

    /**
     * 上传获取token
     *
     * @param bucket
     * @return
     */
    public static String uploadToken(String bucket) {
        Auth auth = Auth.create(QiniuConfig.ACCESS_KEY, QiniuConfig.SECRET_KEY);
        return auth.uploadToken(bucket);
    }

    /**
     * 覆盖上传获取token
     */
    public static String uploadToken(String bucket, String key) {
        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        //<bucket>:<key>，表示只允许用户上传指定key的文件。在这种格式下文件默认允许“修改”，已存在同名资源则会被本次覆盖。
        //如果希望只能上传指定key的文件，并且不允许修改，那么可以将下面的 insertOnly 属性值设为 1。
        //第三个参数是token的过期时间
        return auth.uploadToken(bucket, key, 3600, null);
    }

    /**
     * 上传文件
     *
     * @param bucket
     * @param data
     * @param key
     * @return
     * @throws IOException
     */
    public static String upload(String bucket, byte[] data, String key) throws IOException {
        try {
            Configuration cfg = new Configuration(Zone.zone0());
            //创建上传对象
            UploadManager uploadManager = new UploadManager(cfg);
            //调用put方法上传，这里指定的key和上传策略中的key要一致
            Response res = uploadManager.put(data, key, uploadToken(bucket, key));
            //打印返回的信息
            return res.bodyString();
        } catch (QiniuException e) {
            Response r = e.response;
            // 请求失败时打印的异常的信息
            System.out.println(r.toString());
            try {
                //响应的文本信息
                return r.bodyString();
            } catch (QiniuException e1) {
                //ignore
                return null;
            }
        }
    }

    /**
     * 获取格式化时间
     *
     * @param aMask
     * @param aDate
     * @return
     */
    public static String getDateTime(String aMask, Date aDate) {
        SimpleDateFormat df = null;
        String returnValue = "";
        if (aDate == null) {
        } else {
            df = new SimpleDateFormat(aMask);
            returnValue = df.format(aDate);
        }
        return (returnValue);
    }
}
