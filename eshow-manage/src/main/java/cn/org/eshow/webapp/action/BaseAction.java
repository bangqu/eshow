package cn.org.eshow.webapp.action;

import cn.org.eshow.Constants;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.User;
import cn.org.eshow.service.MailEngine;
import cn.org.eshow.service.RoleManager;
import cn.org.eshow.service.UserManager;
import cn.org.eshow.util.JacksonUtil;
import cn.org.eshow.webapp.util.Struts2Utils;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Implementation of <strong>ActionSupport</strong> that contains convenience
 * methods for subclasses. For example, getting the current user and saving
 * messages/errors. This class is intended to be a base class for all Action
 * classes.
 * 
 */
public class BaseAction extends ActionSupport {
	
	private static final long serialVersionUID = 3525445612504421307L;

	/**
	 * Constant for index result String
	 */
	public static final String INDEX = "index";

	/**
	 * Constant for list result String
	 */
	public static final String LIST = "list";

    /**
     * Constant for set result String
     */
    public static final String SET = "set";

	/**
	 * Constant for cancel result String
	 */
	public static final String CANCEL = "cancel";

	/**
	 * Action 跳转 Url
	 */
	public static final String REDIRECT = "redirect";

	/**
	 * Transient log to prevent session synchronization issues - children can
	 * use instance for logging.
	 */
	protected transient final Log log = LogFactory.getLog(getClass());

	protected Integer id;

	/**
	 * The UserManager
	 */
	protected UserManager userManager;

	/**
	 * The RoleManager
	 */
	protected RoleManager roleManager;

	/**
	 * Indicator if the user clicked cancel
	 */
	protected String cancel;

	/**
	 * Indicator for the page the user came from.
	 */
	protected String from;

	/**
	 * 跳转方向
	 */
	protected String redirect;

	/**
	 * 开始数目
	 */
	protected int begin = 1;
	/**
	 * 每页记录数
	 */
	protected int pagesize = 10;

	/**
	 * Set to "delete" when a "delete" request parameter is passed in
	 */
	protected String delete;

	/**
	 * Set to "save" when a "save" request parameter is passed in
	 */
	protected String save;

	/**
	 * MailEngine for sending e-mail
	 */
	protected MailEngine mailEngine;

	/**
	 * A message pre-populated with default data
	 */
	protected SimpleMailMessage mailMessage;

	/**
	 * Velocity template to use for e-mailing
	 */
	protected String templateName;

	/**
	 * Simple method that returns "cancel" result
	 * 
	 * @return "cancel"
	 */
	public String cancel() {
		return CANCEL;
	}

	/**
	 * Save the message in the session, appending if messages already exist
	 * 
	 * @param msg
	 *            the message to put in the session
	 */
	@SuppressWarnings("unchecked")
	protected void saveMessage(String msg) {
		List messages = (List) getRequest().getSession().getAttribute(
				"messages");
		if (messages == null) {
			messages = new ArrayList();
		}
		messages.add(msg);
		getRequest().getSession().setAttribute("messages", messages);
	}

	/**
	 * Convenience method to get the Configuration HashMap from the servlet
	 * context.
	 * 
	 * @return the user's populated form from the session
	 */
	protected Map getConfiguration() {
		Map config = (HashMap) getSession().getServletContext().getAttribute(
				Constants.CONFIG);
		// so unit tests don't puke when nothing's been set
		if (config == null) {
			return new HashMap();
		}
		return config;
	}

	/**
	 * Convenience method to get the request
	 * 
	 * @return current request
	 */
	protected HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	/**
	 * Convenience method to get the response
	 * 
	 * @return current response
	 */
	protected HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	/**
	 * Convenience method to get the session. This will create a session if one
	 * doesn't exist.
	 * 
	 * @return the session from the request (request.getSession()).
	 */
	protected HttpSession getSession() {
		return getRequest().getSession();
	}

	/**
	 * @param name
	 * @param object
	 */
	public void saveRequest(String name, Object object) {
		getRequest().setAttribute(name, object);
	}

	/**
	 * Convenience method to send e-mail to users
	 * 
	 * @param user
	 *            the user to send to
	 * @param msg
	 *            the message to send
	 * @param url
	 *            the URL to the application (or where ever you'd like to send
	 *            them)
	 */
	protected void sendUserMessage(User user, String msg, String url) {
		if (log.isDebugEnabled()) {
			log.debug("sending e-mail to user [" + user.getUsername() + "]...");
		}

		mailMessage.setTo(user.getNickname() + "<" + user.getUsername() + ">");

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", user);
		// TODO: figure out how to get bundle specified in struts.xml
		// model.put("bundle", getTexts());
		model.put("message", msg);
		model.put("applicationURL", url);
		mailEngine.sendMessage(mailMessage, templateName, model);
	}

	/**
	 * 得到当前登录用户
	 * 
	 * @return User
	 */
	protected User getSessionUser() {
		User user = null;
		if (getRequest().getUserPrincipal() instanceof UsernamePasswordAuthenticationToken) {
			UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken) getRequest()
					.getUserPrincipal();
			user = (User) auth.getPrincipal();
		}
		if (getRequest().getUserPrincipal() instanceof RememberMeAuthenticationToken) {
			RememberMeAuthenticationToken auth = (RememberMeAuthenticationToken) getRequest()
					.getUserPrincipal();
			user = (User) auth.getPrincipal();
		}
		return user;
	}
	
	/**
	 * 返回成功信息
	 */
	public void success() {
		Struts2Utils.renderText("{\"status\":\"1\"}");
	}

	/**
	 * 返回成功信息及提示
	 */
	public void success(String msg) {
		Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + msg + "\"}");
	}

	/**
	 * 返回成功信息及提示及对应的PO
	 */
	public void success(String msg, Object object) {
		Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + msg + "\",\""
				+ object.getClass().getSimpleName().toLowerCase() + "\":"
				+ JacksonUtil.toJson(object) + "}");
	}

	/**
	 * 返回失败信息
	 */
	public void failure() {
		Struts2Utils.renderText("{\"status\":\"0\"}");
	}

	/**
	 * 返回失败信息及提示
	 */
	public void failure(String msg) {
		Struts2Utils.renderText("{\"status\":\"0\",\"msg\":\"" + msg + "\"}");
	}

	/**
	 * 输出列表JSONArray
	 */
	public void list(String name, String msg, List<Object> list) {
		if (list.isEmpty()) {
			failure("没有数据");
		} else {
			Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + msg + "\",\"" + name + "\":"
					+ JacksonUtil.toJson(list) + "}");
		}
	}

	/**
	 * 输出分页JSONArray
	 * 
	 * @param page
	 */
	public void search(String name, String msg, Page<Object> page) {
		if (page.getDataList().isEmpty()) {
			failure("没有数据");
		} else {
			Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + msg + "\",\"total\":"
					+ page.getTotal() + ",\"totalPage\":" + page.getTotalPage() + ",\"pageSize\":"
					+ page.getPageSize() + ",\"" + name + "\":"
					+ JacksonUtil.toJson(page.getDataList()) + "}");
		}
	}

    public UserManager getUserManager() {
        return userManager;
    }

    public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setRoleManager(RoleManager roleManager) {
		this.roleManager = roleManager;
	}

	public void setMailEngine(MailEngine mailEngine) {
		this.mailEngine = mailEngine;
	}

	public void setMailMessage(SimpleMailMessage mailMessage) {
		this.mailMessage = mailMessage;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}

	/**
	 * Convenience method for setting a "from" parameter to indicate the
	 * previous page.
	 * 
	 * @param from
	 *            indicator for the originating page
	 */
	public void setFrom(String from) {
		this.from = from;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public void setDelete(String delete) {
		this.delete = delete;
	}

	public void setSave(String save) {
		this.save = save;
	}

	public String getRedirect() {
		return redirect;
	}

	public void setRedirect(String redirect) {
		this.redirect = redirect;
	}

	/**
	 * @return int
	 */
	protected int getOffset() {
		try {
			new Integer(begin);
			return (begin - 1) * pagesize;
		} catch (Exception e) {
			return 0;
		}
	}
}
