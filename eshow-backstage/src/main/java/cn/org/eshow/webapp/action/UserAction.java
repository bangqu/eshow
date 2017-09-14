package cn.org.eshow.webapp.action;

import cn.org.eshow.Constants;
import cn.org.eshow.bean.SelectBean;
import cn.org.eshow.bean.query.UserQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Role;
import cn.org.eshow.model.User;
import cn.org.eshow.service.UserExistsException;
import cn.org.eshow.util.DateUtil;
import cn.org.eshow.util.PageUtil;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.MailException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Results({@Result(name = "input", location = "/user/add"),
        @Result(name = "list", type = "redirect", location = ""),
        @Result(name = "success", type = "redirect", location = "view/${id}"),
        @Result(name = "delete", type = "redirect", location = "admin/user/"),
        @Result(name = "photo", type = "redirect", location = "admin/user/edit"),
        @Result(name = "redirect", type = "redirect", location = "${redirect}")})
@AllowedMethods({"list", "photo", "search", "delete", "view", "page"})
public class UserAction extends BaseAction {

    private static final long serialVersionUID = 6776558938712115191L;

    @Autowired
    @Qualifier("passwordEncoder")
    private PasswordEncoder passwordEncoder;


    private List<User> users;
    private User user;
    private UserQuery query = new UserQuery();

    /**
     * Constant for photo result String
     */
    public static final String PHOTO = "photo";

    /**
     * 查询用户
     *
     * @return String
     */
    public String search() {
        Page<User> page = userManager.search(query);
        users = page.getDataList();
        saveRequest("page", PageUtil.conversion(page));
        saveRequest("query", query);
        return LIST;
    }

    /**
     *
     */
    public void page() {
        String keyword = getRequest().getParameter("q");
        if (StringUtils.isNotEmpty(keyword)) {
            query.setUsername(keyword);
        }
        query.setPagesize(50);
        Page<User> page = userManager.search(query);
        users = page.getDataList();
        List<SelectBean> beans = new ArrayList<SelectBean>();
        for (User obj : users) {
            beans.add(new SelectBean(obj.getId(), obj.getUsername()));
        }
        RenderUtil.page("获取成功", "beans", page, beans);
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
     * 更新用户照片
     *
     * @return success
     * @throws IOException
     * @throws UserExistsException
     */
    public String photo() throws IOException, UserExistsException {
        user = userManager.getUser(id);
        String path = "upload/user/" + DateUtil.getDateTime("yyyyMMdd", user.getAddTime()) + "/";
        user.setPhoto(user.getId() + ".jpg");
        userManager.saveUser(user);
        // 获得裁剪和缩略的参数
        Integer x = Integer.valueOf(getRequest().getParameter("left"));
        Integer y = Integer.valueOf(getRequest().getParameter("top"));
        Integer w = Integer.valueOf(getRequest().getParameter("width"));
        Integer h = Integer.valueOf(getRequest().getParameter("height"));

        // 根据缩略图规则进行缩略图生成
        return PHOTO;
    }

    /**
     * Delete the member passed in.
     *
     * @return success
     */
    public String delete() {
        userManager.removeUser(id);
        saveMessage("用户" + user.getUsername() + "删除成功");

        return "delete";
    }

    /**
     * 修改密码
     *
     * @return String
     * @throws UserExistsException
     */
//	public String password() throws UserExistsException {
//		User old = userManager.getUser(id);
//		String oldPassword = getRequest().getParameter("oldPassword");
//		if (userManager.password(oldPassword, user.getPassword(), old)) {
//			saveMessage("密码修改成功");
//		} else {
//			saveMessage("旧密码输入错误");
//		}
//		return REDIRECT;
//	}
    public String password() throws UserExistsException {
        User old = userManager.getUserByUsername(user.getUsername());
        old.setPassword(passwordEncoder.encode(user.getPassword()));
        userManager.save(old);
        saveMessage("密码修改成功");
        return REDIRECT;
    }

    /**
     * Grab the user from the database based on the "id" passed in.
     *
     * @return success if user found
     * @throws IOException can happen when sending a "forbidden" from
     *                     response.sendError()
     */
    public String edit() throws IOException {
        HttpServletRequest request = getRequest();

        // if a user's id is passed in
        if (id != null) {
            // lookup the user using that id
            user = userManager.getUser(id);
        } else if (request.getRemoteUser() != null) {
            user = userManager.getUserByUsername(request.getRemoteUser());
        } else {
            user = new User();
            user.addRole(new Role(Constants.USER_ROLE));
        }
        id = user.getId();
        return SUCCESS;
    }


    /**
     * Sends users to "mainMenu" when !from.equals("list"). Sends everyone else
     * to "cancel"
     *
     * @return "mainMenu" or "cancel"
     */
    public String cancel() {
        if (!"list".equals(from)) {
            return LIST;
        }
        return LIST;
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
        User old = userManager.get(id);
        old.setNickname(user.getNickname() != null ? user.getNickname() : old.getNickname());
        old.setRealname(user.getRealname() != null ? user.getRealname() : old.getRealname());
        old.setAge(user.getAge() != null ? user.getAge() : old.getAge());
        old.setMale(user.getMale() != null ? user.getMale() : old.getMale());
        old.setBirthday(user.getBirthday() != null ? user.getBirthday() : old.getBirthday());
        old.setConstellation(user.getConstellation() != null ? user.getConstellation() : old.getConstellation());
        old.setBloodType(user.getBloodType() != null ? user.getBloodType() : old.getBloodType());
        old.setBirthAttrib(user.getBirthAttrib() != null ? user.getBirthAttrib() : old.getBirthAttrib());
        old.setMarital(user.getMarital() != null ? user.getMarital() : old.getMarital());
        old.setIntro(user.getIntro() != null ? user.getIntro() : old.getIntro());
        old.setHobby(user.getHobby() != null ? user.getHobby() : old.getHobby());
        old.setEmail(user.getEmail() != null ? user.getEmail() : old.getEmail());
        old.setPhoto((user.getPhoto() != null && !user.getPhoto().equals("")) ? user.getPhoto() : old.getPhoto());
        userManager.saveUser(old);
        saveMessage("资料修改成功");
        id = user.getId();
        return REDIRECT;
    }

    /**
     * Save user
     *
     * @return success if everything worked, otherwise input
     * @throws IOException when setting "access denied" fails on response
     */
    public String save() throws Exception {

        Integer originalVersion = user.getVersion();

        boolean isNew = ("".equals(getRequest().getParameter("user.version")));
        // only attempt to change roles if user is admin
        // for other users, prepare() method will handle populating
        if (getRequest().isUserInRole(Constants.ADMIN_ROLE)) {
            user.getRoles().clear(); // APF-788: Removing roles from user
            // doesn't work
            String[] userRoles = getRequest().getParameterValues("userRoles");

            for (int i = 0; userRoles != null && i < userRoles.length; i++) {
                String roleName = userRoles[i];
                user.addRole(roleManager.getRole(roleName));
            }
        }

        try {
            userManager.saveUser(user);
        } catch (AccessDeniedException ade) {
            // thrown by UserSecurityAdvice configured in aop:advisor
            // userManagerSecurity
            log.warn(ade.getMessage());
            getResponse().sendError(HttpServletResponse.SC_FORBIDDEN);
            return null;
        } catch (UserExistsException e) {
            List<Object> args = new ArrayList<Object>();
            args.add(user.getNickname());
            args.add(user.getUsername());
            addActionError(getText("errors.existing.user", args));

            // reset the version # to what was passed in
            user.setVersion(originalVersion);
            // redisplay the unencrypted passwords
            user.setPassword(user.getConfirmPassword());
            return INPUT;
        }

        if (!"list".equals(from)) {
            // add success messages
            saveMessage(getText("user.saved"));
            return "mainMenu";
        } else {
            // add success messages
            List<Object> args = new ArrayList<Object>();
            args.add(user.getNickname());
            if (isNew) {
                saveMessage(getText("user.added", args));
                // Send an account information e-mail
                mailMessage.setSubject(getText("signup.email.subject"));
                try {
                    //sendUserMessage(user, getText("newuser.email.message", args), RequestUtil.getAppURL(getRequest()));
                } catch (MailException me) {
                    addActionError(me.getCause().getLocalizedMessage());
                }
                id = user.getId();
                return SUCCESS;
            } else {
                saveMessage(getText("user.updated.byAdmin", args));
                return INPUT;
            }
        }
    }

    /**
     * 添加管理员
     *
     * @throws Exception
     */
    public String add() throws Exception {
        if (user.getUsername() == null) {
            RenderUtil.failure("用户名不能为空");
            return REDIRECT;
        }
        ;
        User old = userManager.getBy("username", user.getUsername());
        if (old != null) {
            RenderUtil.failure("用户名已经存在");
            return REDIRECT;
        }
        if (user.getPassword() == null) {
            RenderUtil.failure("密码不能为空");
            return REDIRECT;
        }
        if (StringUtils.isEmpty(user.getNickname())) {
            user.setNickname(user.getUsername());
        }
        ;
        user.addRole(roleManager.getRole(Constants.ADMIN_ROLE));
        user.setAddTime(new Date());
        user.setAddTime(new Date());
        user.setEnabled(true);
        userManager.saveUser(user);
        return REDIRECT;
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

}
