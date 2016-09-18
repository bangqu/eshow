package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.CodeQuery;
import cn.org.eshow.bean.query.UserQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.component.easyapi.config.Config;
import cn.org.eshow.component.easyapi.util.SmsUtil;
import cn.org.eshow.component.easyapi.util.VoiceUtil;
import cn.org.eshow.model.Code;
import cn.org.eshow.model.User;
import cn.org.eshow.service.CodeManager;
import cn.org.eshow.util.RandomCodeUtil;
import cn.org.eshow.util.RegexUtil;
import cn.org.eshow.webapp.util.Struts2Utils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * 短信登录API
 */
@AllowedMethods({"send", "voice"})
public class CodeAction extends BaseFileUploadAction<Code> {

    @Autowired
    private CodeManager codeManager;

    private CodeQuery query = new CodeQuery();
    private UserQuery userQuery = new UserQuery();
    private Code code;
    private String mobile;
    private String message;//发送信息详情
    private String type;//代码类型(register注册验证，login登录验证,change 变更验证,identity 身份验证）

    /**
     * 发送手机验证码
     */
    public void send() throws Exception {
        if (mobile == null) {
            errorParame("电话号码不能为空");
            return;
        }
        String temp = RandomCodeUtil.numberCode(6);
        Boolean flag = false;
        if ("register".equals(type)) {
            try {
                cn.org.eshow.component.easyapi.Message message = SmsUtil.send(mobile, Config.REGISTER, mobile, temp, "code");
                if (message != null) {
                    String status = message.getStatus();
                    if (status.equals("1")) {
                        flag = true;
                    }
                }
            } catch (Exception e) {
                Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "验证码已发送!" + "\",\"" + "code" + "\":\"" + temp + "\"}");
                return;
            }
        } else if ("login".equals(type)) {
            try {
                cn.org.eshow.component.easyapi.Message message = SmsUtil.send(mobile, Config.LOGIN, mobile, temp, "code");
                if (message != null) {
                    String status = message.getStatus();
                    if (status.equals("1")) {
                        flag = true;
                    }
                }
            } catch (Exception e) {
                Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "验证码已发送!" + "\",\"" + "code" + "\":\"" + temp + "\"}");
                return;
            }
        } else if ("change".equals(type)) {
            try {
                cn.org.eshow.component.easyapi.Message message = SmsUtil.send(mobile, Config.CHANGE, mobile, temp, "code");
                if (message != null) {
                    String status = message.getStatus();
                    if (status.equals("1")) {
                        flag = true;
                    }
                }
            } catch (Exception e) {
                Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "验证码已发送!" + "\",\"" + "code" + "\":\"" + temp + "\"}");
                return;
            }
        } else if ("identity".equals(type)) {
            try {
                cn.org.eshow.component.easyapi.Message message = SmsUtil.send(mobile, Config.IDENTITY, mobile, temp, "code");
                if (message != null) {
                    String status = message.getStatus();
                    if (status.equals("1")) {
                        flag = true;
                    }
                }
            } catch (Exception e) {
                Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "验证码已发送!" + "\",\"" + "code" + "\":\"" + temp + "\"}");
                return;
            }
        }
        if (flag) {
            Code code = new Code();
            code.setAddTime(new Date());
            code.setType(type);
            code.setMobile(mobile);
            code.setState(CommonVar.CODE_UNUSED);
            code.setCode(temp);
            code.setEnabled(true);
            codeManager.save(code);
            success("验证码已经发送到手机" + mobile);
        } else {
            failure("短信发送失败，请重试");
        }
    }


    /**
     * 验证码播报
     */
    public void voice() throws Exception {
        if (mobile == null) {
            errorParame("电话号码不能为空");
            return;
        }
        //验证是否是手机号
        if (!RegexUtil.mobile(mobile)) {
            failure("用户名必须是手机号");
            return;
        }
        if (StringUtils.isEmpty(type)) {
            errorParame("缺少类型参数");
            return;
        }
        User old = userManager.getBy("username", mobile);//判断是否存在该用户
        String temp = RandomCodeUtil.numberCode(6);
        Boolean flag = false;
        if ("register".equals(type)) {
            if (old != null) {
                failure("对不起此手机号码已经注册");
                return;
            }
            try {
                cn.org.eshow.component.easyapi.Message message = VoiceUtil.send(mobile, mobile, temp, "code");
                if (message != null) {
                    String status = message.getStatus();
                    if (status.equals("1")) {
                        flag = true;
                    }
                }
            } catch (Exception e) {
                Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "验证码已播报!" + "\",\"" + "code" + "\":\"" + temp + "\"}");
                return;
            }
        } else if ("identity".equals(type)) {
            if (old == null) {
                failure("对不起此手机号码暂未注册");
                return;
            }
            cn.org.eshow.component.easyapi.Message message = VoiceUtil.send(mobile, mobile, temp, "code");
            if (message != null) {
                String status = message.getStatus();
                if (status.equals("1")) {
                    flag = true;
                }
            }
        }
        if (flag) {
            Code code = new Code();
            code.setAddTime(new Date());
            code.setType(type);
            code.setMobile(mobile);
            code.setState(CommonVar.CODE_UNUSED);
            code.setCode(temp);
            code.setEnabled(true);
            codeManager.save(code);
            Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "验证码已经播报到手机" + mobile + "\",\"" + "code" + "\":\"" + temp + "\"}");
        } else {
            failure("播报失败，请重试");
        }
    }

    public Code getCode() {
        return code;
    }

    public void setCode(Code code) {
        this.code = code;
    }

    public CodeQuery getQuery() {
        return query;
    }

    public void setQuery(CodeQuery query) {
        this.query = query;
    }

    public UserQuery getUserQuery() {
        return userQuery;
    }

    public void setUserQuery(UserQuery userQuery) {
        this.userQuery = userQuery;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
