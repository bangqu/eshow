package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.ThirdPartyQuery;
import cn.org.eshow.model.ThirdParty;
import cn.org.eshow.model.User;
import cn.org.eshow.service.AccessTokenManager;
import cn.org.eshow.service.ThirdPartyManager;
import cn.org.eshow.util.JacksonUtil;
import cn.org.eshow.webapp.action.response.ThirdPartyResponse;
import cn.org.eshow.webapp.util.Struts2Utils;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 */
@AllowedMethods({"list", "check", "save"})
public class ThirdPartyAction extends ApiBaseAction<ThirdParty> {

    private static final long serialVersionUID = 6776558938712115191L;

    @Autowired
    private ThirdPartyManager thirdPartyManager;
    @Autowired
    private AccessTokenManager accessTokenManager;

    private ThirdPartyQuery query = new ThirdPartyQuery();
    private ThirdParty thirdParty = new ThirdParty();
    private List<ThirdParty> thirdParties = new ArrayList<ThirdParty>();

    public void list() {
        thirdParties = thirdPartyManager.list(query);
        list("thirdParty", "获取成功", thirdParties);
    }

    public void check() {
        User old = isValid(accessToken, accessTokenManager);
        if (old == null) {
            expires();//用户信息过期
            return;
        }
        query.userId = old.getId();
        thirdParties = thirdPartyManager.list(query);
        ThirdPartyResponse thirdPartyResponse = new ThirdPartyResponse();
        thirdPartyResponse.setUserId(old.getId());
        if (thirdParties.size() > 0) {
            for (ThirdParty thirdParty : thirdParties) {
                if ("qq".equals(thirdParty.getPlatform())) {
                    thirdPartyResponse.setQq(true);
                } else if ("weixin".equals(thirdParty.getPlatform())) {
                    thirdPartyResponse.setWeixin(true);
                }
            }
        }
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"获取成功\",\"thirdPartyResponse\":" + JacksonUtil.toJson(thirdPartyResponse) + "}");
    }

    /**
     * 第三方绑定
     */
    public void save() {
        User old = isValid(accessToken, accessTokenManager);
        if (old == null) {
            expires();//用户信息过期
            return;
        }
        thirdParty.setAddTime(new Date());
        thirdParty.setUpdateTime(new Date());
        thirdParty.setUser(old);
        thirdPartyManager.save(thirdParty);
        success("绑定成功");
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
}
