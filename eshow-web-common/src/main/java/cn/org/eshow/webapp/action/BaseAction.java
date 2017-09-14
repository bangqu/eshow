package cn.org.eshow.webapp.action;

import cn.org.eshow.Constants;
import cn.org.eshow.model.User;
import cn.org.eshow.service.MailEngine;
import cn.org.eshow.service.RoleManager;
import cn.org.eshow.service.UserManager;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
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
     * Transient log to prevent session synchronization issues - children can use instance for logging.
     */
    protected transient final Log log = LogFactory.getLog(getClass());

    protected Integer id;

    /**
     * The UserManager
     */
    @Autowired
    protected UserManager userManager;

    /**
     * The RoleManager
     */
    @Autowired
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
     * @param msg the message to put in the session
     */
    @SuppressWarnings("unchecked")
    protected void saveMessage(String msg) {
        List messages = (List) getRequest().getSession().getAttribute("messages");
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
     * @param name
     * @param object
     */
    public void saveRequest(String name, Object object) {
        getRequest().setAttribute(name, object);
    }

    /**
     * 得到当前登录用户
     *
     * @return User
     */
    protected User getSessionUser() {
        User user = null;
        if (getRequest().getUserPrincipal() instanceof UsernamePasswordAuthenticationToken) {
            UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken) getRequest().getUserPrincipal();
            user = (User) auth.getPrincipal();
        }
        if (getRequest().getUserPrincipal() instanceof RememberMeAuthenticationToken) {
            RememberMeAuthenticationToken auth = (RememberMeAuthenticationToken) getRequest().getUserPrincipal();
            user = (User) auth.getPrincipal();
        }
        return user;
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

    /**
     * Convenience method for setting a "from" parameter to indicate the previous page.
     *
     * @param from indicator for the originating page
     */
    public void setFrom(String from) {
        this.from = from;
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

}
