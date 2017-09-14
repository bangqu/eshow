package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.CaptchaQuery;
import cn.org.eshow.bean.query.UserQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Captcha;
import cn.org.eshow.model.User;
import cn.org.eshow.service.CaptchaManager;
import cn.org.eshow.service.UserExistsException;
import cn.org.eshow.util.PageUtil;
import cn.org.eshow.util.RegexUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;

@Results({@Result(name = "input", location = "/user/add"),
        @Result(name = "list", type = "redirect", location = ""),
        @Result(name = "success", type = "redirect", location = "/center/info?id=${id}&active=login"),
        @Result(name = "checkSuccess", type = "redirect", location = "/user/setting?username=${user.username}"),
        @Result(name = "findPassword", type = "redirect", location = "/user/setPassword?username=${user.username}"),
        @Result(name = "redirect", type = "redirect", location = "${redirect}")})
@AllowedMethods({"list", "search", "delete", "view", "update", "save"})
public class UserAction extends BaseAction {

    private static final long serialVersionUID = 6776558938712115191L;

    @Autowired
    private CaptchaManager codeManager;

    @Autowired
    @Qualifier("passwordEncoder")
    private PasswordEncoder passwordEncoder;

    private List<User> users;
    private User user;
    private UserQuery query;
    private String code;
    private String codeType;

    /**
     * 校验用户,发送验证码
     *
     * @return
     */
    public String check() {
        if (StringUtils.isEmpty(user.getUsername())) {
            saveMessage("请输入手机号码");
            return REDIRECT;
        }
        //验证是否是手机号
        if (!RegexUtil.mobile(user.getUsername())) {
            saveMessage("用户名必须是手机号");
            return REDIRECT;
        }
        User old = userManager.getBy("username", user.getUsername());//判断是否存在该用户
        if (old == null) {
            CaptchaQuery codeQuery = new CaptchaQuery();
            codeQuery.setCode(code);
            codeQuery.setMobile(user.getUsername());
            codeQuery.setState(CommonVar.CODE_UNUSED);
            Captcha obj = codeManager.check(codeQuery);
            if (obj == null) {
                saveMessage("验证码错误");
                return REDIRECT;
            } else {
                obj.setState(CommonVar.CODE_USED);// 已使用
                codeManager.save(obj);
            }
        } else {
            saveMessage("该用户已是EShow用户");
            return REDIRECT;
        }
        return "checkSuccess";
    }

    /**
     * 查询用户
     *
     * @return String
     */
    public String search() {
        Page<User> page = userManager.search(query);
        users = page.getDataList();
        saveRequest("page", PageUtil.conversion(page));
        return LIST;
    }

    /**
     * @return String
     */
    public String view() {
        if (id == null) {
            if (getRequest().getRemoteUser() != null) {
                user = userManager.getUserByUsername(getRequest().getRemoteUser());
            } else {
                return INPUT;
            }
        } else {
            user = userManager.getUser(id);
        }
        return NONE;

    }

    /**
     * 修改密码
     *
     * @return String
     * @throws UserExistsException
     */
    public String password() throws UserExistsException {
        User old = userManager.getUserByUsername(user.getUsername());
        old.setPassword(passwordEncoder.encode(user.getPassword()));
        userManager.save(old);
        saveMessage("密码修改成功");
        return REDIRECT;
    }

    /**
     * 修改用户头像
     *
     * @return
     */
    public String photo() {
        User old = userManager.get(id);
        old.setPhoto(user.getPhoto());
        userManager.save(old);
        saveMessage("资料修改成功");
        return REDIRECT;
    }

    /**
     * 修改用户
     *
     * @return String
     * @throws UserExistsException
     */
    public String update() throws UserExistsException {
        // only attempt to change roles if user is admin
        // for other users, prepare() method will handle populating
        User old = userManager.getUser(id);
        old.setNickname(user.getNickname());
        old.setRealname(user.getRealname());
        old.setMale(user.getMale());
        old.setBirthday(user.getBirthday());
        old.setIntro(user.getIntro());
        old.setHobby(user.getHobby());
        userManager.saveUser(old);
        saveMessage("资料修改成功");
        return SUCCESS;
    }


    /**
     * 找回密码
     *
     * @return
     */
    public String find() {
        if (StringUtils.isEmpty(user.getUsername())) {
            saveMessage("请输入手机号码");
            return REDIRECT;
        }
        //验证是否是手机号
        if (!RegexUtil.mobile(user.getUsername())) {
            saveMessage("用户名必须是手机号");
            return REDIRECT;
        }
        User old = userManager.getBy("username", user.getUsername());//判断是否存在该用户
        if (old == null) {
            saveMessage("该用户还不是EShow用户,请先注册");
            return REDIRECT;
        } else {
            CaptchaQuery codeQuery = new CaptchaQuery();
            codeQuery.setCode(code);
            codeQuery.setMobile(user.getUsername());
            codeQuery.setState(CommonVar.CODE_UNUSED);
            Captcha obj = codeManager.check(codeQuery);
            if (obj == null) {
                saveMessage("验证码错误");
                return REDIRECT;
            } else {
                obj.setState(CommonVar.CODE_USED);// 已使用
                codeManager.save(obj);
            }
        }
        return "findPassword";
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public UserQuery getQuery() {
        return query;
    }

    public void setQuery(UserQuery query) {
        this.query = query;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCodeType() {
        return codeType;
    }

    public void setCodeType(String codeType) {
        this.codeType = codeType;
    }
}
