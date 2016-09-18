package cn.org.eshow.webapp.action;

import cn.org.eshow.Constants;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.AccessToken;
import cn.org.eshow.model.User;
import cn.org.eshow.service.AccessTokenManager;
import cn.org.eshow.service.MailEngine;
import cn.org.eshow.service.RoleManager;
import cn.org.eshow.service.UserManager;
import cn.org.eshow.util.DateUtil;
import cn.org.eshow.util.JacksonUtil;
import cn.org.eshow.webapp.util.Struts2Utils;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.mail.SimpleMailMessage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Implementation of <strong>ActionSupport</strong> that contains convenience
 * methods for subclasses. For example, getting the current user and saving
 * messages/errors. This class is intended to be a base class for all Action
 * classes.
 * 
 */
public class ApiBaseAction<T> extends ActionSupport {
	private static final long serialVersionUID = 3525445612504421307L;

	/**
	 * Transient log to prevent session synchronization issues - children can use instance for logging.
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
	 * userId
	 */
	protected Integer userId;

	/**
	 * accessToken
	 */
	protected String accessToken;

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
	 * Convenience method to get the Configuration HashMap from the servlet context.
	 * 
	 * @return the user's populated form from the session
	 */
	protected Map getConfiguration() {
		Map config = (HashMap) getSession().getServletContext().getAttribute(Constants.CONFIG);
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
	 * Convenience method to get the session. This will create a session if one doesn't exist.
	 * 
	 * @return the session from the request (request.getSession()).
	 */
	protected HttpSession getSession() {
		return getRequest().getSession();
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
	public void success(String msg, T object) {
		Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + msg + "\",\"" + object.getClass().getSimpleName().toLowerCase() + "\":" + JacksonUtil.toJson(object) + "}");
	}

	/**
	 * 返回失败信息
	 */
	public void failure() {
		Struts2Utils.renderText("{\"status\":\"-5\"}");
	}

	/**
	 * 返回失败
	 */
	public void failure(String msg) {
		Struts2Utils.renderText("{\"status\":\"-5\",\"msg\":\"" + msg + "\"}");
	}

	/**
	 * 没有数据
	 */
	public void noData() {
		Struts2Utils.renderText("{\"status\":\"0\"}");
	}

	/**
	 * 没有数据
	 */
	public void noData(String msg) {
		Struts2Utils.renderText("{\"status\":\"0\",\"msg\":\"" + msg + "\"}");
	}


	/**
	 * 缺少参数
	 */
	public void errorParame(String msg) {
		Struts2Utils.renderText("{\"status\":\"-1\",\"msg\":\"" + msg + "\"}");
	}

    /**
     * 访问令牌过期提示
     */
    public void expires() {
        Struts2Utils.renderText("{\"status\":\"-9\",\"msg\":\"用户信息过期，请重新登录\"}");
    }


	/**
	 * 输出列表JSONArray
	 */
	public void list(String name, String msg, List<T> list) {
		if (list.isEmpty()) {
			noData("没有数据");
		} else {
			Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + msg + "\",\"" + name + "\":" + JacksonUtil.toJson(list) + "}");
		}
	}

    /**
     * 输出分页列表JSONArray
     */
    public void page(String name, String msg, Page page, List list) {
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + msg + "\",\"total\":" + page.getTotal() + ",\"totalPage\":" + page.getTotalPage() + ",\"pageSize\":" + page.getPageSize() + ",\"" + name + "\":" + JacksonUtil.toJson(list) + "}");
    }

	/**
	 * 输出分页JSONArray
	 */
	public void search(String name, String msg, Page<T> page) {
		if (page.getDataList().isEmpty()) {
			noData("没有数据");
		} else {
			Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + msg + "\",\"total\":" + page.getTotal() + ",\"totalPage\":" + page.getTotalPage() + ",\"pageSize\":" + page.getPageSize() + ",\"" + name + "\":" + JacksonUtil.toJson(page.getDataList()) + "}");
		}
	}

	/**
	 * 判断是否有效 true有效 false无效
	 *
	 * @param accessToken
	 * @return User
	 */
	public User isValid(String accessToken, AccessTokenManager accessTokenManager) {
		if (accessToken == null) {
			return null;
		}
		AccessToken at = accessTokenManager.getBy("accessToken", accessToken);
		if (at != null) {
			long timeNow = DateUtil.dateToLong(new Date());// 当前时间
			long timeEnd = DateUtil.dateToLong(at.getUpdateTime());// 最后登录时间
			if (timeNow - timeEnd > at.getExpiresIn()) {
				return null;
			} else {
				return at.getUser();
			}
		} else {
			return null;
		}
	}

    protected void saveMessage(String msg) {
        List<String> messages = (List<String>) getRequest().getSession().getAttribute("messages");
        if (messages == null) {
            messages = new ArrayList<String>();
        }
        messages.add(msg);
        getRequest().getSession().setAttribute("messages", messages);
    }

	/**
	 * @param name
	 * @param object
	 */
	public void saveRequest(String name, Object object) {
		getRequest().setAttribute(name, object);
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

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
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
