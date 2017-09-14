package cn.org.eshow.webapp.action;

import cn.org.eshow.Constants;
import cn.org.eshow.bean.query.CaptchaQuery;
import cn.org.eshow.bean.query.ThirdPartyQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.component.easemob.EasemobUtil;
import cn.org.eshow.model.Captcha;
import cn.org.eshow.model.ThirdParty;
import cn.org.eshow.model.User;
import cn.org.eshow.service.CaptchaManager;
import cn.org.eshow.util.JacksonUtil;
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
 * 用户API接口
 */
@AllowedMethods({"login", "signup", "mobile", "updatePassword", "update", "cancel", "view", "logout"})
public class UserAction extends ApiBaseAction<User> {

    private static final long serialVersionUID = 6776558938712115191L;

    @Autowired
    private CaptchaManager captchaManager;

    private ThirdPartyQuery query = new ThirdPartyQuery();
    private User user = new User();
    private String code;//验证码
    private ThirdParty thirdParty = new ThirdParty();
    private String type;//register注册  identity找回密码

    /**
     * 用户登录
     */
    public void login() throws OAuthSystemException {
        if (!RegexUtil.mobile(user.getUsername())) {
            RenderUtil.failure("用户名必须是手机号");
            return;
        }
        if (StringUtils.isEmpty(user.getPassword())) {
            RenderUtil.errorParame("密码不能为空");
            return;
        }
        User old = userManager.getBy("username", user.getUsername());//判断是否存在该用户
        if (old == null) {
            RenderUtil.failure("该手机号码不存在");
            return;
        }
        if (!userManager.login(old, user.getPassword())) {
            RenderUtil.failure("密码错误");
            return;
        }
        if (!old.isEnabled()) {
            RenderUtil.failure("该用户已禁用");
            return;
        }
        userManager.updateGetuiInfo(old, user);//更新个推信息
        //发送手机密码短信通知
        Map<String, String> map = new HashMap<String, String>();
        map.put("user", JacksonUtil.toJson(new UserResponse(old)));//获取用户信息
        map.put("accessToken", JacksonUtil.toJson(accessTokenManager.refresh(old)));
        RenderUtil.result(1, "登录成功", map);
    }

    /**
     * 注册接口
     */
    public void signup() throws Exception {
        if (!RegexUtil.mobile(user.getUsername())) {
            RenderUtil.failure("用户名必须是手机号");
            return;
        }
        User old = userManager.getBy("username", user.getUsername());//判断是否存在该用户
        if (old != null) {
            RenderUtil.failure("该账号已被注册，请重新输入！");
            return;
        }
        if (StringUtils.isEmpty(code)) {
            RenderUtil.errorParame("请输入验证码");
            return;
        }
        if (StringUtils.isEmpty(user.getPassword())) {
            RenderUtil.errorParame("请输入密码");
            return;
        }
        if (StringUtils.isEmpty(user.getNickname())) {
            user.setNickname(StringUtil.asterisk(user.getUsername()));
        }
        Captcha captcha = captchaManager.check(new CaptchaQuery(code, user.getUsername(), CommonVar.CODE_UNUSED));//未使用
        if (captcha == null) {
            RenderUtil.failure("验证码错误");
            return;
        }
        user.addRole(roleManager.getRole(Constants.USER_ROLE));
        user = userManager.saveUser(user);

        captchaManager.updateState(captcha);// 验证码已使用

        EasemobUtil.createUser(user.getUsername(), user.getUsername());//注册环信

        Map<String, String> map = new HashMap<String, String>();
        map.put("user", JacksonUtil.toJson(new UserResponse(user)));//获取用户信息
        map.put("accessToken", JacksonUtil.toJson(accessTokenManager.save(user)));
        RenderUtil.result(1, "登录成功", map);
    }

    /**
     * 修改新密码
     */
    public void updatePassword() throws Exception {
        if (StringUtils.isEmpty(user.getPassword())) {
            RenderUtil.errorParame("请输入密码");
            return;
        }
        User old = accessTokenManager.isValid(accessToken);
        if (old == null) {
            RenderUtil.expires();//用户信息过期
            return;
        }
        String oldPassword = getRequest().getParameter("oldPassword");
        if (userManager.password(oldPassword, user.getPassword(), old)) {
            RenderUtil.success("密码修改成功");
        } else {
            RenderUtil.failure("旧密码不正确");
        }
    }

    /**
     * 修改用户信息
     *
     * @return
     */
    public void update() {
        User old = accessTokenManager.isValid(accessToken);
        if (old == null) {
            RenderUtil.expires();//用户信息过期
            return;
        }
        userManager.updateUser(old, user);
        RenderUtil.success("更新成功");
    }

    /**
     * 获取用户信息
     */
    public void view() {
        User user = accessTokenManager.isValid(accessToken);
        if (user == null) {
            RenderUtil.expires();//用户信息过期
            return;
        }
        User old = userManager.getBy("username", user.getUsername());//判断是否存在该用户
        RenderUtil.success("获取成功", new UserResponse(old));
    }

    /**
     * 用户退出
     */
    public void logout() {
        User user = accessTokenManager.isValid(accessToken);
        if (user == null) {
            RenderUtil.expires();//用户信息过期
            return;
        }
        userManager.logout(user);
        RenderUtil.success("退出成功");
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

    public ThirdParty getThirdParty() {
        return thirdParty;
    }

    public void setThirdParty(ThirdParty thirdParty) {
        this.thirdParty = thirdParty;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
