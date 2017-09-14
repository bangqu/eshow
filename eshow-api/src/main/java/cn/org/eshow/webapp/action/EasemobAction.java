package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.UserQuery;
import cn.org.eshow.component.easemob.api.impl.EasemobIMUsers;
import cn.org.eshow.model.User;
import cn.org.eshow.util.JacksonUtil;
import cn.org.eshow.webapp.action.response.UserResponse;
import cn.org.eshow.webapp.util.RenderUtil;
import io.swagger.client.model.RegisterUsers;
import org.apache.struts2.convention.annotation.AllowedMethods;

import java.util.List;

/**
 * 环信API接口
 */
@AllowedMethods({"user", "generate"})
public class EasemobAction extends ApiBaseAction<String> {

    private UserQuery query = new UserQuery();

    private EasemobIMUsers easemobIMUsers = new EasemobIMUsers();

    private String easemobId;//环信ID

    /**
     * 根据环信获取用户信息
     */
    public void user() {
        User user = userManager.getBy("easemobId", easemobId);//判断是否存在该用户
        if (user == null) {
            RenderUtil.failure("用户信息不存在");
            return;
        }
        RenderUtil.success("获取成功", "user", JacksonUtil.toJson(new UserResponse(user)));
    }

    /**
     * 生成环信账号
     */
    public void generate() {
        List<User> users = userManager.list(query);
        for (User user : users) {
            //注册环信
            RegisterUsers registerUser = new RegisterUsers();
            registerUser.add(new io.swagger.client.model.User().username(user.getUsername()).password(user.getUsername()));
            easemobIMUsers.createNewIMUserSingle(registerUser);
        }
        RenderUtil.success("环信注册成功");
    }

    public UserQuery getQuery() {
        return query;
    }

    public void setQuery(UserQuery query) {
        this.query = query;
    }

    public String getEasemobId() {
        return easemobId;
    }

    public void setEasemobId(String easemobId) {
        this.easemobId = easemobId;
    }
}