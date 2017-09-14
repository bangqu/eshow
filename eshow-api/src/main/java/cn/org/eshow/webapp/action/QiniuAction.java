package cn.org.eshow.webapp.action;

import cn.org.eshow.component.qiniu.QiniuConfig;
import cn.org.eshow.component.qiniu.QiniuUtil;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;

/**
 * 七牛API接口
 */
@AllowedMethods({"uptoken", "key"})
public class QiniuAction extends ApiBaseAction<String> {

    private static final long serialVersionUID = 1L;

    /**
     * 获取七牛空间TOKEN
     */
    public void uptoken() {
        // 在七牛绑定的对应bucket的域名. 默认是bucket.qiniudn.com
        String qiniu = QiniuUtil.uploadToken(QiniuConfig.BUCKET);
        RenderUtil.success(qiniu);
    }

    /**
     * 获取七牛KEY
     */
    public void key() {
        String key = QiniuUtil.key();
        RenderUtil.success(key);
    }
}