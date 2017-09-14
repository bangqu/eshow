package cn.org.eshow.webapp.action;

import cn.org.eshow.common.CommonVar;
import cn.org.eshow.component.easemob.EasemobUtil;
import cn.org.eshow.model.User;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.AllowedMethods;

/**
 * 系统API接口
 */
@AllowedMethods({"feedback", "easemob"})
public class SystemAction extends ApiBaseAction<String> {

    private static final long serialVersionUID = 1L;

    /**
     * 意见反馈
     */
    public void feedback() {
        String content = getRequest().getParameter("content");
        if (StringUtils.isEmpty(content)) {
            RenderUtil.failure("必须填写反馈内容");
            return;
        }
        String msg = "反馈内容：" + content;
        msg += "<br>【EShow移动版】";
        mailMessage.setTo(new String[]{"<zhang20084@126.com>", "<lililai@bangqu.com>"});
        String subject = "EShow移动版意见反馈";
        mailMessage.setSubject(subject);
        mailMessage.setText(msg);
        // 添加到线程中发送
        CommonVar.MAIL_SEND_LIST.add(mailMessage);
        if (!CommonVar.MAIL_SEND_LIST.isEmpty()) {
            log.debug("email already add in list");
        }
        RenderUtil.success("反馈成功");
    }

}