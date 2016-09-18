package cn.org.eshow.webapp.action;

import cn.org.eshow.Constants;
import cn.org.eshow.bean.query.CodeQuery;
import cn.org.eshow.bean.query.ThirdPartyQuery;
import cn.org.eshow.bean.query.UserQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.component.easemob.api.IMUserAPI;
import cn.org.eshow.component.easemob.comm.ClientContext;
import cn.org.eshow.component.easemob.comm.EasemobRestAPIFactory;
import cn.org.eshow.component.easemob.comm.body.IMUserBody;
import cn.org.eshow.component.easemob.comm.wrapper.BodyWrapper;
import cn.org.eshow.component.easyapi.Message;
import cn.org.eshow.component.easyapi.config.Config;
import cn.org.eshow.component.easyapi.util.SmsUtil;
import cn.org.eshow.model.AccessToken;
import cn.org.eshow.model.Code;
import cn.org.eshow.model.ThirdParty;
import cn.org.eshow.model.User;
import cn.org.eshow.service.AccessTokenManager;
import cn.org.eshow.service.CodeManager;
import cn.org.eshow.service.ThirdPartyManager;
import cn.org.eshow.util.JacksonUtil;
import cn.org.eshow.util.RandomCodeUtil;
import cn.org.eshow.util.RegexUtil;
import cn.org.eshow.util.StringUtil;
import cn.org.eshow.webapp.util.Struts2Utils;
import org.apache.amber.oauth2.as.issuer.MD5Generator;
import org.apache.amber.oauth2.as.issuer.OAuthIssuer;
import org.apache.amber.oauth2.as.issuer.OAuthIssuerImpl;
import org.apache.amber.oauth2.common.exception.OAuthSystemException;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;

import java.util.Date;
import java.util.List;

/**
 *
 */
@AllowedMethods({"check", "login", "signup", "third", "mobile", "password", "update", "cancel", "view"})
public class UserAction extends ApiBaseAction<User> {

    private static final long serialVersionUID = 6776558938712115191L;

    @Autowired
    private CodeManager codeManager;
    @Autowired
    private AccessTokenManager accessTokenManager;
    @Autowired
    private ThirdPartyManager thirdPartyManager;

    private ThirdPartyQuery query = new ThirdPartyQuery();
    private User user = new User();
    private String code;//验证码
    private ThirdParty thirdParty = new ThirdParty();
    private String type;//register注册  identity找回密码

    public void check() {
        if (StringUtils.isEmpty(user.getUsername())) {
            errorParame("请输入手机号");
            return;
        }
        //验证是否是手机号
        if (!RegexUtil.mobile(user.getUsername())) {
            failure("用户名必须是手机号");
            return;
        }
        if (StringUtils.isEmpty(type)) {
            errorParame("缺少类型参数");
            return;
        }
        UserQuery userQuery = new UserQuery();
        userQuery.setUsername(user.getUsername());
        User old = userManager.check(userQuery);//判断是否存在该用户
        if ("register".equals(type)) {
            if (old != null) {
                failure("对不起此手机号码已经注册EShow");
            } else {
                String temp = RandomCodeUtil.numberCode(6);
                Boolean flag = false;
                try {
                    Message message=SmsUtil.send(user.getUsername(), Config.REGISTER, user.getUsername(), temp, "code");
                    if (message!=null) {
                        String status = message.getStatus();
                        if (status.equals("1")) {
                            flag = true;
                        }
                    }
                } catch (Exception e) {
                    success("验证码已发送!");
                    return;
                }
                if (flag) {
                    Code code = new Code();
                    code.setAddTime(new Date());
                    code.setType("register");
                    code.setMobile(user.getUsername());
                    code.setState(CommonVar.CODE_UNUSED);
                    code.setCode(temp);
                    code.setEnabled(true);
                    codeManager.save(code);
                    success("验证码已经发送到手机" + user.getUsername());
                } else {
                    success("验证码已发送!");
                    return;
                }
            }
        } else if ("identity".equals(type)) {
            if (old != null) {
                String temp = RandomCodeUtil.numberCode(6);
                Boolean flag = false;
                try {
                    Message message= SmsUtil.send(user.getUsername(), Config.IDENTITY, user.getUsername(), temp, "code");
                    if (message!=null) {
                        String status = message.getStatus();
                    }
                } catch (Exception e) {
                    success("验证码已发送!");
                    return;
                }
                if (flag) {
                    Code code = new Code();
                    code.setAddTime(new Date());
                    code.setType("identity");
                    code.setMobile(user.getUsername());
                    code.setState(CommonVar.CODE_UNUSED);
                    code.setCode(temp);
                    code.setEnabled(true);
                    codeManager.save(code);
                    success("验证码已经发送到手机" + user.getUsername());
                } else {
                    success("验证码已发送!");
                    return;
                }
            } else {
                failure("对不起此手机号码还未注册EShow");
            }
        }
    }

    /**
     * 注册接口
     */
    public void signup() throws Exception {
        if (StringUtils.isEmpty(user.getUsername())) {
            errorParame("请输入手机号码");
            return;
        }
        //验证是否是手机号
        if (!RegexUtil.mobile(user.getUsername())) {
            failure("用户名必须是手机号");
            return;
        }
        if (StringUtils.isEmpty(code)) {
            errorParame("请输入验证码");
            return;
        }
        if (StringUtils.isEmpty(user.getPassword())) {
            errorParame("请输入密码");
            return;
        }
        if (StringUtils.isEmpty(user.getNickname())) {
            user.setNickname(StringUtil.asterisk(user.getUsername()));
        }
        User old = null;
        try {
            UserQuery userQuery = new UserQuery();
            userQuery.setUsername(user.getUsername());
            old = userManager.check(userQuery);//判断是否存在该用户
            if (old != null) {
                failure("对不起此手机号码已经注册EShow");
                return;
            }
        } catch (Exception e) {

        }
        if (old == null) {
            CodeQuery codeQuery = new CodeQuery();
            codeQuery.setCode(code);
            codeQuery.setMobile(user.getUsername());
            codeQuery.setState(CommonVar.CODE_UNUSED);
            Code obj = codeManager.check(codeQuery);
            if (obj == null) {
                failure("验证码错误");
                return;
            } else {
                obj.setState(CommonVar.CODE_USED);// 已使用
                codeManager.save(obj);
            }
            user.setEnabled(true);
            user.setAddTime(new Date());
            user.setUpdateTime(new Date());
            user.addRole(roleManager.getRole(Constants.USER_ROLE));
            user.setEasemobId(StringUtil.md5(user.getUsername()));
            try {
                user = userManager.saveUser(user);
            } catch (AccessDeniedException ade) {
                failure("注册失败");
                return;
            }
            // 生成AccessToken
            OAuthIssuer oauthIssuerImpl = new OAuthIssuerImpl(new MD5Generator());
            String accessToken = oauthIssuerImpl.accessToken();
            String refreshToken = oauthIssuerImpl.refreshToken();
            AccessToken at = new AccessToken(user, accessToken, AccessToken.EXPIRES_IN, refreshToken);
            at = accessTokenManager.save(at);

            //注册环信
            EasemobRestAPIFactory factory = ClientContext.getInstance().init(ClientContext.INIT_FROM_PROPERTIES).getAPIFactory();
            IMUserAPI obb = (IMUserAPI)factory.newInstance(EasemobRestAPIFactory.USER_CLASS);
            BodyWrapper userBody = new IMUserBody(StringUtil.md5(user.getUsername()), user.getId().toString(), user.getNickname());
            obb.createNewIMUserSingle(userBody);

            StringBuffer sbf = new StringBuffer();
            sbf.append("{\"status\":\"1\",");
            sbf.append("\"msg\":\"登录成功\",");
            // 获得用户信息
            sbf.append("\"user\":" + JacksonUtil.toJson(user) + "");
            sbf.append(",");
            sbf.append("\"accessToken\":" + JacksonUtil.toJson(at) + "");
            sbf.append("}");
            Struts2Utils.renderText(sbf.toString());
            return;
        }
    }

    /**
     * 登录接口
     */
    public void login() throws OAuthSystemException {
        if (StringUtils.isEmpty(user.getUsername())) {
            errorParame("手机号码不能为空");
            return;
        }
        //验证是否是手机号
        if (!RegexUtil.mobile(user.getUsername())) {
            failure("用户名必须是手机号");
            return;
        }
        if (StringUtils.isEmpty(user.getPassword())) {
            errorParame("密码不能为空");
            return;
        }
        User old = null;
        try {
//            UserQuery userQuery = new UserQuery();
//            userQuery.setUsername(user.getUsername());
            old = userManager.getBy("username",user.getUsername());//判断是否存在该用户
            if (old == null) {
                failure("该手机号码不存在");
                return;
            }
            if (!userManager.login(old, user.getPassword())) {
                failure("密码错误");
                return;
            }
            if (!old.isEnabled()) {
                failure("该用户已禁用");
                return;
            }
            StringBuffer sbf = new StringBuffer();
            sbf.append("{\"status\":\"1\",");
            sbf.append("\"msg\":\"登录成功\",");
            // 获得用户信息
            sbf.append("\"user\":" + JacksonUtil.toJson(old) + "");
            sbf.append(",");
            sbf.append("\"accessToken\":" + JacksonUtil.toJson(accessTokenManager.refresh(old)) + "");
            sbf.append("}");
            Struts2Utils.renderText(sbf.toString());
            return;
        } catch (Exception e) {
            e.printStackTrace();
            failure("该手机号码不存在");
            return;
        }

    }

    /**
     * QQ、微信登录接口
     *
     * @return
     */
    public void third() throws Exception {
        if (StringUtils.isEmpty(thirdParty.getUsername())) {
            errorParame("用户名不能为空");
            return;
        }
        ThirdPartyQuery thirdPartyQuery = new ThirdPartyQuery();
        thirdPartyQuery.setUsername(thirdParty.getUsername());
        if (StringUtils.isEmpty(thirdParty.getPlatform())) {
            thirdPartyQuery.setPlatform(thirdParty.getPlatform());
        }
        ThirdParty old = thirdPartyManager.check(thirdPartyQuery);
        if (old == null) {
            //保存第三方登录信息
            thirdParty.setAddTime(new Date());
            thirdParty.setUpdateTime(new Date());
            thirdPartyManager.save(thirdParty);

            StringBuffer sbf = new StringBuffer();
            sbf.append("{\"status\":\"1\",");
            sbf.append("\"type\":\"false\",");
            sbf.append("\"msg\":\"登录成功\"");
            sbf.append("}");
            Struts2Utils.renderText(sbf.toString());
        } else {
            if (old.getUser() != null) {
                StringBuffer sbf = new StringBuffer();
                sbf.append("{\"status\":\"1\",");
                sbf.append("\"type\":\"true\",");
                sbf.append("\"msg\":\"登录成功\",");
                // 获得用户信息
                // 获得用户信息
                sbf.append("\"user\":" + JacksonUtil.toJson(old.getUser()) + "");
                sbf.append(",");
                sbf.append("\"accessToken\":" + JacksonUtil.toJson(accessTokenManager.refresh(old.getUser())) + "");
                sbf.append("}");
                Struts2Utils.renderText(sbf.toString());
            } else {
                StringBuffer sbf = new StringBuffer();
                sbf.append("{\"status\":\"1\",");
                sbf.append("\"type\":\"false\",");
                sbf.append("\"msg\":\"登录成功\"");
                sbf.append("}");
                Struts2Utils.renderText(sbf.toString());
            }
        }
    }


    /**
     * 绑定手机接口
     *
     * @return
     */
    public void mobile() throws Exception {
        if (StringUtils.isEmpty(thirdParty.getUsername())) {
            errorParame("第三方平台用户名不能为空");
            return;
        }
        if (StringUtils.isEmpty(user.getUsername())) {
            errorParame("手机号码不能为空");
            return;
        }
        //验证是否是手机号
        if (!RegexUtil.mobile(user.getUsername())) {
            failure("用户名必须是手机号");
            return;
        }
        query = new ThirdPartyQuery();
        query.setUsername(thirdParty.getUsername());
        ThirdParty old = thirdPartyManager.check(query);
        if (old != null) {
            UserQuery userQuery = new UserQuery();
            userQuery.setUsername(user.getUsername());
            User obj = userManager.check(userQuery);//判断是否存在该用户
            AccessToken at = null;
            if (obj == null) {
                //如果不存在该用户注册新用户
                user.setUsername(user.getUsername());
                user.setPassword(RandomCodeUtil.numberCode(6));
                user.setEnabled(true);
                user.setAddTime(new Date());
                user.setUpdateTime(new Date());
                user.addRole(roleManager.getRole(Constants.USER_ROLE));
                try {
                    user = userManager.saveUser(user);
                } catch (Exception ade) {
                    failure("登录失败");
                    return;
                }

                //保存第三方登录信息
                old.setAddTime(new Date());
                old.setUpdateTime(new Date());
                old.setUser(user);
                thirdPartyManager.save(old);

                // 生成AccessToken
                OAuthIssuer oauthIssuerImpl = new OAuthIssuerImpl(new MD5Generator());
                String accessToken = oauthIssuerImpl.accessToken();
                String refreshToken = oauthIssuerImpl.refreshToken();
                at = new AccessToken(user, accessToken, AccessToken.EXPIRES_IN, refreshToken);
                at = accessTokenManager.save(at);
            } else {
                //如果该用户已注册
                ThirdPartyQuery thirdPartyQuery = new ThirdPartyQuery();
                thirdPartyQuery.setUserId(obj.getId());
                ThirdParty party = thirdPartyManager.check(thirdPartyQuery);
                if (party != null) {
                    failure("该账号已被绑定，请更换账号");
                    return;
                }

                //保存第三方登录信息
                old.setAddTime(new Date());
                old.setUpdateTime(new Date());
                old.setUser(obj);
                thirdPartyManager.save(old);

                at = accessTokenManager.refresh(obj);
            }


            StringBuffer sbf = new StringBuffer();
            sbf.append("{\"status\":\"1\",");
            sbf.append("\"type\":\"true\",");
            sbf.append("\"msg\":\"登录成功\",");
            // 获得用户信息
            if (obj == null) {
                sbf.append("\"user\":" + JacksonUtil.toJson(user) + "");
            } else {
                sbf.append("\"user\":" + JacksonUtil.toJson(obj) + "");
            }
            sbf.append(",");
            sbf.append("\"accessToken\":" + JacksonUtil.toJson(at) + "");
            sbf.append("}");
            Struts2Utils.renderText(sbf.toString());
        } else {
            failure("该第三方平台用户账户信息异常");
        }
    }


    /**
     * 重置密码接口
     *
     * @return
     */
    public void password() throws Exception {
        if (StringUtils.isEmpty(user.getUsername())) {
            errorParame("请输入手机号码");
            return;
        }
        if (!RegexUtil.mobile(user.getUsername())) {
            failure("用户名必须是手机号");
            return;
        }
        if (StringUtils.isEmpty(code)) {
            errorParame("请输入验证码");
            return;
        }
        if (StringUtils.isEmpty(user.getPassword())) {
            errorParame("请输入密码");
            return;
        }
        User old = null;
        try {
            UserQuery userQuery = new UserQuery();
            userQuery.setUsername(user.getUsername());
            old = userManager.check(userQuery);//判断是否存在该用户

            if (old != null) {
                CodeQuery codeQuery = new CodeQuery();
                codeQuery.setCode(code);
                codeQuery.setMobile(user.getUsername());
                codeQuery.setState(CommonVar.CODE_UNUSED);
                Code obj = codeManager.check(codeQuery);
                if (obj == null) {
                    failure("验证码错误");
                    return;
                } else {
                    obj.setState(CommonVar.CODE_USED);// 已使用
                    codeManager.save(obj);
                }
                old.setPassword(user.getPassword());
                try {
                    userManager.saveUser(old);
                } catch (AccessDeniedException ade) {
                    failure("密码修改失败");
                    return;
                }
                success("密码修改成功");
                return;
            }
        } catch (Exception e) {
            failure("对不起此手机号码未注册EShow");
            return;
        }

    }

    /**
     * 修改用户信息
     *
     * @return
     */
    public void update() {
        User old = isValid(accessToken, accessTokenManager);
        if (old == null) {
            expires();//用户信息过期
            return;
        }
        if (StringUtils.isNotEmpty(user.getPhoto())) {
            old.setPhoto(user.getPhoto());//更新头像
        }
        if (StringUtils.isNotEmpty(user.getRealname())) {
            old.setRealname(user.getRealname());//更新姓名
        }
        if (user.getAge() != null) {
            old.setAge(user.getAge());//更新年龄
        }
        if (user.getMale() != null) {
            old.setMale(user.getMale());//更新性别
        }
        if (StringUtils.isNotEmpty(user.getNickname())) {
            old.setNickname(user.getNickname());//更新昵称
        }
        if (StringUtils.isNotEmpty(user.getEmail())) {
            old.setEmail(user.getEmail());//更新邮箱
        }
        if (user.getBirthday() != null) {
            old.setBirthday(user.getBirthday());//更新生日
        }
        if (StringUtils.isNotEmpty(user.getIntro())) {
            old.setIntro(user.getIntro());//更新简介
        }
        userManager.save(old);
        success("更新成功");
    }

    /**
     * 取消第三方绑定
     */
    public void cancel() {
        User old = isValid(accessToken, accessTokenManager);
        if (old == null) {
            expires();//用户信息过期
            return;
        }
        ThirdPartyQuery thirdPartyQuery = new ThirdPartyQuery();
        thirdPartyQuery.userId = old.getId();
        thirdPartyQuery.platform = thirdParty.getPlatform();
        List<ThirdParty> thirdPartyList = thirdPartyManager.list(thirdPartyQuery);
        if (thirdPartyList.size() > 0) {
            thirdPartyManager.remove(thirdPartyList.get(0));
            success("取消绑定成功");
        } else {
            failure("不存在第三方绑定数据");
        }
    }

    /**
     * 获取用户信息
     */
    public void view() {
        UserQuery userQuery = new UserQuery();
        userQuery.setUsername(user.getUsername());
        User old = userManager.check(userQuery);//判断是否存在该用户
        success("获取成功", old);
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
