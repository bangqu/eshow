package cn.org.eshow.webapp.action;

import cn.org.eshow.Constants;
import cn.org.eshow.model.User;
import cn.org.eshow.service.CaptchaManager;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;

import java.util.Date;

/**
 * Action to allow new users to sign up.
 */
@Results({@Result(name = "input", location = "signup"),
        @Result(name = "success", type = "redirect", location = "/user/success"),
        @Result(name = "redirect", type = "redirect", location = "${redirect}")})
@AllowedMethods({"list", "search", "delete", "view", "update", "save"})
public class SignupAction extends BaseAction {

    private static final long serialVersionUID = 6558317334878272308L;

    @Autowired
    private CaptchaManager codeManager;

    private User user;

    /**
     * When method=GET, "input" is returned. Otherwise, "success" is returned.
     *
     * @return cancel, input or success
     * @throws Exception
     */
    public String execute() throws Exception {
        if (cancel != null) {
            return CANCEL;
        }
        if (ServletActionContext.getRequest().getMethod().equals("GET")) {
            return INPUT;
        }
        return save();
    }

    /**
     * Returns "input"
     *
     * @return "input" by default
     */
    public String doDefault() {
        return INPUT;
    }

    /**
     * 注册用户
     *
     * @return
     * @throws Exception
     */
    public String save() throws Exception {
        user.setEnabled(true);
        user.setAddTime(new Date());
        user.setUpdateTime(new Date());
        user.addRole(roleManager.getRole(Constants.USER_ROLE));
        try {
            userManager.saveUser(user);
            saveMessage("注册成功");
        } catch (AccessDeniedException ade) {
            saveMessage("注册失败");
            return NONE;
        }
        return SUCCESS;
    }

    public void setUser(User user) {
        this.user = user;
    }


    public User getUser() {
        return user;
    }

}
