package cn.org.eshow.component.easemob;

import cn.org.eshow.component.easemob.api.impl.EasemobIMUsers;
import io.swagger.client.model.RegisterUsers;

/**
 * 环信工具类
 */
public class EasemobUtil {

    /**
     * 创建环信用户
     *
     * @param username 用户名
     * @param password 密码
     */
    public static void createUser(String username, String password) {
        EasemobIMUsers easemobIMUsers = new EasemobIMUsers();
        RegisterUsers users = new RegisterUsers();
        users.add(new io.swagger.client.model.User().username(username).password(password));
        easemobIMUsers.createNewIMUserSingle(users);
    }

}
