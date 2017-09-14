package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.CaptchaQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.model.Captcha;
import cn.org.eshow.service.CaptchaManager;
import cn.org.eshow.util.RandomCodeUtil;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

/**
 * 验证码Action类
 */
@Results({@Result(name = "list", type = "redirect", location = "")})
public class CaptchaAction extends BaseAction {

    private static final long serialVersionUID = 4663487175099570373L;

    @Autowired
    private CaptchaManager codeManager;

    private List<Captcha> codes;
    private Captcha code;
    private CaptchaQuery query;
    private String mobile;
    private String type;//代码类型(register注册验证，login登录验证,change 变更验证,identity 身份验证）

    /**
     * 发送手机验证码
     */
    public void send() throws Exception {
        try {
            if (mobile != null) {
                String temp = RandomCodeUtil.numberCode(6);
                Boolean flag = false;
//                if ("register".equals(type)) {
//                    flag = AlidayuUtils.sendSMS(mobile, AlidayuConfig.REGISTER, AlidayuConfig.SMS_680809, temp);
//                } else if ("login".equals(type)) {
//                    flag = AlidayuUtils.sendSMS(mobile, AlidayuConfig.LOGIN, AlidayuConfig.SMS_680811, temp);
//                } else if ("change".equals(type)) {
//                    flag = AlidayuUtils.sendSMS(mobile, AlidayuConfig.CHANGE, AlidayuConfig.SMS_680806, temp);
//                } else if ("identity".equals(type)) {
//                    flag = AlidayuUtils.sendSMS(mobile, AlidayuConfig.IDENTITY, AlidayuConfig.SMS_680812, temp);
//                }
                if (flag) {
                    Captcha code = new Captcha();
                    code.setType(type);
                    code.setMobile(mobile);
                    code.setState(CommonVar.CODE_UNUSED);
                    code.setCode(temp);
                    code.setEnabled(true);
                    codeManager.save(code);
                    RenderUtil.success("发送成功");
                } else {
                    RenderUtil.success("发送失败");
                }
            }
        } catch (Exception e) {
            RenderUtil.success("发送失败");
        }
    }

    /**
     * @return
     * @throws Exception
     */
    public String voice() throws Exception {
        if (mobile == null) {
            String temp = RandomCodeUtil.numberCode(6);
            Boolean flag = false;
//            if ("register".equals(type)) {
//                flag = AlidayuUtils.voiceSMS(mobile, AlidayuConfig.TTS_695809, temp);
//            } else if ("login".equals(type)) {
//                flag = AlidayuUtils.voiceSMS(mobile, AlidayuConfig.TTS_695811, temp);
//            } else if ("change".equals(type)) {
//                flag = AlidayuUtils.voiceSMS(mobile, AlidayuConfig.TTS_695806, temp);
//            } else if ("identity".equals(type)) {
//                flag = AlidayuUtils.voiceSMS(mobile, AlidayuConfig.TTS_695812, temp);
//            }
            if (flag) {
                Captcha code = new Captcha();
                code.setAddTime(new Date());
                code.setType(type);
                code.setMobile(mobile);
                code.setState(CommonVar.CODE_UNUSED);
                code.setCode(temp);
                code.setEnabled(true);
                codeManager.save(code);
                saveMessage("发送成功");
            } else {
                saveMessage("发送失败");
            }
        }
        return NONE;
    }

    public List<Captcha> getCodes() {
        return codes;
    }

    public void setCodes(List<Captcha> codes) {
        this.codes = codes;
    }

    public Captcha getCode() {
        return code;
    }

    public void setCode(Captcha code) {
        this.code = code;
    }

    public CaptchaQuery getQuery() {
        return query;
    }

    public void setQuery(CaptchaQuery query) {
        this.query = query;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}