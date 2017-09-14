package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.ThirdPartyQuery;
import cn.org.eshow.model.ThirdParty;
import cn.org.eshow.model.User;
import cn.org.eshow.service.ThirdPartyManager;
import cn.org.eshow.util.JacksonUtil;
import cn.org.eshow.webapp.action.response.UserResponse;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 第三方账户API接口
 */
@AllowedMethods({"mine", "check", "save", "delete", "login"})
public class ThirdPartyAction extends ApiBaseAction {

    private static final long serialVersionUID = 6776558938712115191L;

    @Autowired
    private ThirdPartyManager thirdPartyManager;

    private ThirdPartyQuery query = new ThirdPartyQuery(Boolean.TRUE);
    private ThirdParty thirdParty = new ThirdParty();
    private List<ThirdParty> thirdParties = new ArrayList<ThirdParty>();
    private User user = new User();

    /**
     * 我的第三方账号列表
     */
    public void mine() {
        User user = accessTokenManager.isValid(accessToken);
        if (user == null) {
            RenderUtil.expires();//用户信息过期
            return;
        }
        query.setUserId(user.getId());
        thirdParties = thirdPartyManager.list(query);
        RenderUtil.list("获取成功", "thirdParties", thirdParties);
    }

    /**
     * 添加第三方账号
     */
    public void save() {
        User user = accessTokenManager.isValid(accessToken);
        if (user == null) {
            RenderUtil.expires();//用户信息过期
            return;
        }
        if (StringUtils.isEmpty(thirdParty.getUsername()) || StringUtils.isEmpty(thirdParty.getPlatform())) {
            RenderUtil.failure("参数不能为空");
            return;
        }
        ThirdParty old = thirdPartyManager.check(new ThirdPartyQuery(thirdParty.getUsername(), thirdParty.getPlatform(), Boolean.TRUE));
        if (old != null) {
            old = thirdPartyManager.updateUser(old, user);
            RenderUtil.success("绑定成功", "thirdParty", old);
            return;
        }
        thirdParty = thirdPartyManager.save(thirdParty, user);
        RenderUtil.success("绑定成功", "thirdParty", thirdParty);
    }

    /**
     * 删除第三方账号
     */
    public void delete() {
        User user = accessTokenManager.isValid(accessToken);
        if (user == null) {
            RenderUtil.expires();//用户信息过期
            return;
        }
        if (StringUtils.isEmpty(thirdParty.getUsername()) || StringUtils.isEmpty(thirdParty.getPlatform())) {
            RenderUtil.failure("参数不能为空");
            return;
        }
        ThirdParty old = thirdPartyManager.check(new ThirdPartyQuery(user.getId(), thirdParty.getUsername(), thirdParty.getPlatform(), Boolean.TRUE));
        if (old == null) {
            RenderUtil.failure("第三方账号信息不存在");
            return;
        }
        thirdPartyManager.enabled(old);
        RenderUtil.success("解绑成功");
    }

    /**
     * 第三方账号登录
     */
    public void login() throws Exception {
        if (StringUtils.isEmpty(thirdParty.getUsername()) || StringUtils.isEmpty(thirdParty.getPlatform())) {
            RenderUtil.errorParame("参数不能为空");
            return;
        }
        ThirdParty old = thirdPartyManager.check(new ThirdPartyQuery(thirdParty.getUsername(), thirdParty.getPlatform(), Boolean.TRUE));
        if (old == null) {
            thirdPartyManager.save(thirdParty);//保存第三方登录信息
            RenderUtil.success("等待绑定用户", "bind", "false");
            return;
        }
        if (old.getUser() == null) {
            RenderUtil.success("等待绑定用户", "bind", "false");
            return;
        }
        userManager.updateGetuiInfo(old.getUser(), user);//更新个推信息
        Map<String, String> map = new HashMap<String, String>();
        map.put("bind", "true");
        map.put("user", JacksonUtil.toJson(new UserResponse(old.getUser())));
        map.put("accessToken", JacksonUtil.toJson(accessTokenManager.refresh(old.getUser())));
        RenderUtil.result(1, "登录成功", map);
    }

    public ThirdPartyQuery getQuery() {
        return query;
    }

    public void setQuery(ThirdPartyQuery query) {
        this.query = query;
    }

    public ThirdParty getThirdParty() {
        return thirdParty;
    }

    public void setThirdParty(ThirdParty thirdParty) {
        this.thirdParty = thirdParty;
    }

    public List<ThirdParty> getThirdParties() {
        return thirdParties;
    }

    public void setThirdParties(List<ThirdParty> thirdParties) {
        this.thirdParties = thirdParties;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
