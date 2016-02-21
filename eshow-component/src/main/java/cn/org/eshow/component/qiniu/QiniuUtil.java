package cn.org.eshow.component.qiniu;
import com.qiniu.api.auth.AuthException;
import com.qiniu.api.auth.digest.Mac;
import com.qiniu.api.config.Config;
import com.qiniu.api.rs.PutPolicy;
import org.json.JSONException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author leida
 */
public class QiniuUtil {

    /**
     文件名及路径
     */
    public static String key() {
        return getDateTime("yyyy/MM/dd", new Date()) + "/" + System.currentTimeMillis() ;
    }

    public static String uptoken(String bucketName) throws AuthException, JSONException {
        Config.ACCESS_KEY = "h2V2WcqzVYn3RTnc7BiDsubyTquJIkylzK-TBbEW";
        Config.SECRET_KEY = "kr7fpW-iAANyfjQ0XwH4XBSvhsl6Zg5OPqmmNc0q";
        Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);
        PutPolicy putPolicy = new PutPolicy(bucketName);// 请确保该bucket已经存在
        return putPolicy.token(mac);
    }

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
