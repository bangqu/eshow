package cn.org.eshow.webapp.interceptor;

import cn.org.eshow.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AbstractAuthenticationEvent;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 认证成功事件
 * 
 * @author Jeff
 * 
 * @since 2012-10-12
 */
@Component
public class AuthenticationSuccessListener implements ApplicationListener {

	public static final String SESSION_IS_LOGIN_IN = "isLoggedIn";// 是否登录

	public static final String SESSION_MYID = "myid";// 我的用户ID

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private HttpSession session;

	public void onApplicationEvent(ApplicationEvent event) {

		if (event instanceof AuthenticationSuccessEvent || event instanceof InteractiveAuthenticationSuccessEvent) {
			loginSuccess((AbstractAuthenticationEvent) event);
		}
	}

	public void loginSuccess(AbstractAuthenticationEvent authEvent) {

		Authentication auth = authEvent.getAuthentication();
		User user = (User) auth.getPrincipal();

		session.setAttribute(SESSION_IS_LOGIN_IN, true);
		session.setAttribute(SESSION_MYID, user.getId());
	}

}
