package cn.org.eshow.webapp.action;

import cn.org.eshow.Constants;
import cn.org.eshow.bean.query.CaptchaQuery;
import cn.org.eshow.bean.query.UserQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.component.easemob.EasemobUtil;
import cn.org.eshow.component.easyapi.Message;
import cn.org.eshow.component.easyapi.config.Config;
import cn.org.eshow.component.easyapi.util.SmsUtil;
import cn.org.eshow.component.easyapi.util.VoiceUtil;
import cn.org.eshow.model.Captcha;
import cn.org.eshow.model.User;
import cn.org.eshow.service.CaptchaManager;
import cn.org.eshow.util.JacksonUtil;
import cn.org.eshow.util.RandomCodeUtil;
import cn.org.eshow.util.RegexUtil;
import cn.org.eshow.util.StringUtil;
import cn.org.eshow.webapp.action.response.UserResponse;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.amber.oauth2.common.exception.OAuthSystemException;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.Map;

/**
 * 验证码API接口
 */
@AllowedMethods({"send", "voice", "login"})
public class CaptchaAction extends ApiBaseAction<Captcha> {

    @Autowired
    private CaptchaManager captchaManager;

    private CaptchaQuery query = new CaptchaQuery();
    private Captcha captcha = new Captcha();
    private User user = new User();
    private String code;//验证码

    /**
     * 发送手机验证码
     */
    public void send() throws Exception {
        if (!RegexUtil.mobile(captcha.getMobile())) {
            RenderUtil.failure("用户名必须是手机号");
            return;
        }
        if (captcha.getType() == null) {
            RenderUtil.errorParame("短信类型不能为空");
            return;
        }
        String code = RandomCodeUtil.numberCode(6);//验证码
        Message message = SmsUtil.send(captcha.getMobile(), Config.getTemplateName(captcha.getType()), captcha.getMobile(), code, "code");
        if (!"1".equals(message.getStatus())) {
            RenderUtil.failure("短信发送失败，请重试");
            return;
        }
        captchaManager.save(captcha.getType(), code, captcha.getMobile());//添加未使用验证码
        RenderUtil.success("验证码已经发送到手机" + captcha.getMobile());
    }


    /**
     * 验证码播报
     */
    public void voice() throws Exception {
        if (captcha.getMobile() == null) {
            RenderUtil.errorParame("电话号码不能为空");
            return;
        }
        //验证是否是手机号
        if (!RegexUtil.mobile(captcha.getMobile())) {
            RenderUtil.failure("用户名必须是手机号");
            return;
        }
        if (StringUtils.isEmpty(captcha.getType())) {
            RenderUtil.errorParame("缺少类型参数");
            return;
        }
        String code = RandomCodeUtil.numberCode(6);
        Message message = VoiceUtil.send(captcha.getMobile(), captcha.getMobile(), code, "code");
        if (!message.getStatus().equals("1")) {
            RenderUtil.failure("播报失败，请重试");
        }
        captchaManager.save(captcha.getType(), code, captcha.getMobile());//添加未使用验证码
        RenderUtil.success("验证码已经播报到手机" + captcha.getMobile(), "code", code);
    }


    /**
     * 验证短信登录
     */
    public void login() throws OAuthSystemException {
        if (StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(code)) {
            RenderUtil.failure("参数不能为空");
            return;
        }
        captcha = captchaManager.check(new CaptchaQuery(code, user.getUsername(), CommonVar.CODE_UNUSED));//未使用验证码
        if (captcha == null) {
            RenderUtil.failure("验证码错误");
            return;
        }
        captcha.setState(1);
        captchaManager.save(captcha);//修改验证码为已使用
        User old = userManager.check(new UserQuery(user.getUsername()));
        if (old == null) {
            old = new User();
            old.setUsername(user.getUsername());
            old.setPassword(RandomCodeUtil.numberCode(6));//随机6位数数字密码
            old.setNickname(StringUtil.asterisk(user.getUsername()));//昵称初始默认为手机号(中间用*号)
            old.addRole(roleManager.getRole(Constants.USER_ROLE));
            try {
                old = userManager.saveUser(old);
            } catch (Exception ade) {
                ade.printStackTrace();
                RenderUtil.failure("注册失败");
                return;
            }
        }
        EasemobUtil.createUser(user.getUsername(), user.getUsername());//注册环信
        userManager.updateGetuiInfo(old, user);//更新个推信息
        //发送手机密码短信通知
        Map<String, String> map = new HashMap<String, String>();
        map.put("user", JacksonUtil.toJson(new UserResponse(old)));//获取用户信息
        map.put("accessToken", JacksonUtil.toJson(accessTokenManager.refresh(old)));
        RenderUtil.result(1, "登录成功", map);
    }

    public Captcha getCaptcha() {
        return captcha;
    }

    public void setCaptcha(Captcha captcha) {
        this.captcha = captcha;
    }

    public CaptchaQuery getQuery() {
        return query;
    }

    public void setQuery(CaptchaQuery query) {
        this.query = query;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
