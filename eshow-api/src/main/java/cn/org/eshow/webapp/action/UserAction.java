package cn.org.eshow.webapp.action;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.security.access.AccessDeniedException;

import cn.org.eshow.Constants;
import cn.org.eshow.bean.query.UserQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Role;
import cn.org.eshow.model.User;
import cn.org.eshow.service.UserExistsException;
import cn.org.eshow.util.DateUtil;
import cn.org.eshow.util.PageUtil;
import cn.org.eshow.webapp.util.RequestUtil;

import org.springframework.mail.MailException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class UserAction extends ApiBaseAction {

	private static final long serialVersionUID = 6776558938712115191L;

	private List<User> users;
	private User user;
	private UserQuery query;


	/**
	 * 注册接口
	 */
	public void signup() {
		if (StringUtils.isEmpty(user.getUsername())) {
			failure("请输入用户名");
			return;
		}
		//验证是否是手机号
		if (StringUtils.isEmpty(user.getPassword())) {
			failure("请输入密码");
			return;
		}
		if (StringUtils.isEmpty(user.getNickname())) {
			failure("请输入昵称");
			return;
		}
		if (StringUtils.isEmpty(user.getEmail())) {
			failure("请输入昵称");
			return;
		}
		User old = userManager.getBy("username", user.getUsername());//判断是否存在该用户
		if (old == null) {
			try {
				user = userManager.saveUser(user);

				Struts2Utils.renderText("{\"status\":\"1\","+"\"msg\":\"登录成功\""+"}");
			} catch (AccessDeniedException ade) {
				log.warn(ade.getMessage());
				failure("注册失败");
			} catch (UserExistsException e) {
				log.warn(e.getMessage());
				failure("用户已注册，如果忘记密码请找回密码");
			} catch (OAuthSystemException e) {
				e.printStackTrace();
			}
		} else {
			failure("用户已注册，如果忘记密码请找回密码");
			return;
		}
	}


	/**
	 * 登录接口
	 */
	public void login() throws OAuthSystemException {
		if (StringUtils.isEmpty(user.getUsername()) && StringUtils.isEmpty(user.getPassword())) {
			failure("参数不能为空");
			return;
		}
		User old = userManager.getBy("username", user.getUsername());
		if (old == null) {
			failure("用户不存在");
			return;
		}
		if (!userManager.login(old, user.getPassword())) {
			failure("密码错误");
			return;
		}
		if (!old.isEnabled()) {
			failure("用户已禁用");
			return;
		}
		StringBuffer sbf = new StringBuffer();
		sbf.append("{\"status\":\"1\",");
		sbf.append("\"msg\":\"登录成功\",");
		// 获得用户信息
		sbf.append("\"user\":" + JacksonUtil.toJson(old) + "");
		sbf.append("}");
		Struts2Utils.renderText(sbf.toString());
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
