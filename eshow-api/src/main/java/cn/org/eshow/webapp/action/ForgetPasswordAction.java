package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.CaptchaQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.model.Captcha;
import cn.org.eshow.model.User;
import cn.org.eshow.service.CaptchaManager;
import cn.org.eshow.service.UserExistsException;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * 忘记密码API接口
 */
@AllowedMethods({"reset"})
public class ForgetPasswordAction extends ApiBaseAction<User> {

    @Autowired
    private CaptchaManager codeManager;
    @Autowired
    private PasswordEncoder passwordEncoder;

    private User user = new User();
    private String code;//验证码

    /**
     * 重置密码
     */
    public void reset() throws UserExistsException {
        if (code == null || user.getPassword() == null) {
            RenderUtil.failure("参数不能为空");
            return;
        }
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            RenderUtil.failure("两次输入的密码不一致");
            return;
        }
        Captcha captcha = codeManager.check(new CaptchaQuery(code, user.getUsername(), CommonVar.CODE_UNUSED));// 未使用验证码
        if (captcha == null) {// 判断验证码是否有效
            RenderUtil.failure("验证码错误，请再次获得验证码");
            return;
        }
        User old = userManager.getBy("username", user.getUsername());
        if (old == null) {
            RenderUtil.failure("用户不存在");
            return;
        }
        captcha.setState(CommonVar.CODE_USED);// 已使用
        codeManager.save(captcha);
        old.setPassword(user.getPassword());
        userManager.saveUser(old);
        RenderUtil.success("密码找回成功，请使用新密码登录");
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
