package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.CodeQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.model.Code;
import cn.org.eshow.model.User;
import cn.org.eshow.service.CodeManager;
import cn.org.eshow.service.UserExistsException;
import cn.org.eshow.util.RegexUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * 忘记密码API接口
 */
@AllowedMethods({"user",  "password"})
public class ForgetPasswordAction extends ApiBaseAction {

    @Autowired
    private CodeManager codeManager;

    private String username;//手机
    private String code;//找回密码验证码
    private String password;//新密码
    private String confirmPassword;//新密码确认密码

    /**
     * 忘记密码
     */
    public void user() {
        if (StringUtils.isEmpty(username)) {
            failure("用户名不能为空");
            return;
        }
        if (!RegexUtil.mobile(username)) {
            failure("请输入手机号码");
            return;
        }
        try {
            User user = userManager.getBy("username", username);
            if (user == null) {
                failure("用户名不存在");
                return;
            }
            Code cod = codeManager.password(user);//生成找回密码CODE
//            YinwanAppMsg msg = new YinwanAppMsg(username, "找回密码验证码：" + cod.getCode() + "，请勿泄露！");
//            String flag = msg.send();
//            if (Integer.parseInt(flag) > 0) {
                success("找回密码验证码已经发送到邮箱" + username);

        } catch (UsernameNotFoundException e) {
            log.warn(e.getMessage());
            failure("用户名" + username + " 不存在");
        }
    }

    /**
     * 修改新密码
     */
    public void password() throws UserExistsException {
        if (code == null || password == null || confirmPassword == null) {
            failure("参数不能为空");
            return;
        }
        CodeQuery codeQuery = new CodeQuery();
        codeQuery.setCode(code);
        codeQuery.setOrder("addTime");
        codeQuery.setDesc(true);
        codeQuery.setState(CommonVar.CODE_UNUSED);// 未使用
        List<Code> list = codeManager.list(codeQuery);
        if (list.isEmpty()) {// 判断验证码是否有效
            failure("验证码错误，密码找回失败，请再次获得验证码");
            return;
        }
        Code c = list.get(0);
        c.setState(CommonVar.CODE_USED);// 已使用
        codeManager.save(c);
//        User old = userManager.getUser(c.getUser().getId());
        User old = userManager.getUserByUsername(c.getMobile());
        if (!password.equals(confirmPassword)) {
            failure("两次输入的密码不一致");
            return;
        }
        old.setPassword(password);
        userManager.saveUser(old);
        success("密码找回成功，请使用新密码登录");
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}
