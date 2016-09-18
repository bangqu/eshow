package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.UserGroupQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.component.easemob.api.ChatGroupAPI;
import cn.org.eshow.component.easemob.comm.ClientContext;
import cn.org.eshow.component.easemob.comm.EasemobRestAPIFactory;
import cn.org.eshow.component.easemob.comm.body.UserNamesBody;
import cn.org.eshow.component.easemob.comm.wrapper.BodyWrapper;
import cn.org.eshow.component.easemob.comm.wrapper.ResponseWrapper;
import cn.org.eshow.model.Group;
import cn.org.eshow.model.User;
import cn.org.eshow.model.UserGroup;
import cn.org.eshow.service.AccessTokenManager;
import cn.org.eshow.service.GroupManager;
import cn.org.eshow.service.UserGroupManager;
import cn.org.eshow.util.JacksonUtil;
import cn.org.eshow.webapp.action.response.UserGroupResponse;
import cn.org.eshow.webapp.util.Struts2Utils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 群组成员API接口
 */
@AllowedMethods({"search", "delete", "view", "update", "save","mine"})
public class UserGroupAction extends ApiBaseAction<UserGroupResponse> {

    private static final long serialVersionUID = 1L;
    @Autowired
    private AccessTokenManager accessTokenManager;
    @Autowired
    private UserGroupManager userGroupManager;
    @Autowired
    private GroupManager groupManager;

    private UserGroup userGroup = new UserGroup();
    private List<UserGroup> userGroups;
    private UserGroupQuery query = new UserGroupQuery();
    private String userIds;//用户ids，逗号隔开

    /**
     * 搜索群组成员
     */
    public void search() {
        if (query.getGroupId() == null) {
            failure("非法参数");
            return;
        }
        Page<UserGroup> page = userGroupManager.search(query);
        if (page.getDataList().isEmpty()) {
            failure("暂无群组列表");
            return;
        }
        List<UserGroupResponse> responses = new ArrayList<UserGroupResponse>();
        for (UserGroup obj : page.getDataList()) {
            responses.add(new UserGroupResponse(obj));
        }
        page("userGroups", "获取成功", page, responses);
    }

    /**
     * 搜索我的群组
     */
    public void mine() {
        User user = isValid(accessToken, accessTokenManager);
        if (user == null) {
            expires();//用户信息过期
            return;
        }
        query.setUserId(user.getId());
        Page<UserGroup> page = userGroupManager.search(query);
        if (page.getDataList().isEmpty()) {
            failure("暂无群组列表");
            return;
        }
        List<UserGroupResponse> responses = new ArrayList<UserGroupResponse>();
        for (UserGroup obj : page.getDataList()) {
            responses.add(new UserGroupResponse(obj));
        }
        page("userGroups", "获取成功", page, responses);
    }

    /**
     * 获取群聊详情信息
     */
    public void view() {
        userGroup = userGroupManager.get(id);
        if (userGroup == null) {
            failure("群聊不存在");
            return;
        }
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"获取成功\",\"userGroup\":" + JacksonUtil.toJson(new UserGroupResponse(userGroup)) + "}");
    }

    /**
     * 群组添加成员
     */
    public void save() {
        User user = isValid(accessToken, accessTokenManager);
        if (user == null) {
            expires();//用户信息过期
            return;
        }
        if (userGroup.getGroup() == null || userGroup.getGroup().getId() == null) {
            failure("非法参数");
            return;
        }

        Group group = groupManager.get(userGroup.getGroup().getId());
        if (group == null) {
            failure("非法参数");
            return;
        }
        List<User> users = new ArrayList<User>();
        String[] easemobIds = null;
        Integer userSize = 0;
        if (!StringUtils.isEmpty(userIds)) {
            String[] ids = userIds.split(",");
            if (ids.length > 0) {
                easemobIds = new String[ids.length];
                for (int i = 0; i < ids.length; i++) {
                    String userid = ids[i];
                    User user1 = userManager.get(Integer.parseInt(userid));
                    if (user1 != null) {
                        query = new UserGroupQuery();
                        query.setUserId(user1.getId());
                        query.setGroupId(group.getId());
                        UserGroup old = userGroupManager.check(query);
                        if (old == null) {

                            String easemobId = user1.getEasemobId();
                            if (!StringUtils.isEmpty(easemobId)) {
                                easemobIds[i] = easemobId;
                                userSize += 1;
                                users.add(user1);
                            }
                        }
                    }
                }

            }
        }
        if (userSize == 0 || users.isEmpty()) {
            failure("非法参数");
            return;
        }
        EasemobRestAPIFactory factory = ClientContext.getInstance().init(ClientContext.INIT_FROM_PROPERTIES).getAPIFactory();
        ChatGroupAPI chatgroup = (ChatGroupAPI) factory.newInstance(EasemobRestAPIFactory.CHATGROUP_CLASS);
        BodyWrapper userNamesBody = new UserNamesBody(easemobIds);
        ResponseWrapper result = (ResponseWrapper) chatgroup.addBatchUsersToChatGroup(group.getEasemobGroupId(), userNamesBody);
        if (result == null || result.getResponseStatus() == null || result.getResponseStatus() != 200) {
            failure("添加失败");
            return;
        }
        group.setNumber(group.getNumber() + userSize);
        groupManager.save(group);
        for (User ob : users) {
            UserGroup ug = new UserGroup();
            ug.setAddTime(new Date());
            ug.setType(2);
            ug.setTop(Boolean.FALSE);
            ug.setDisturb(Boolean.TRUE);
            ug.setNickName(ob.getNickname());
            ug.setGroup(group);
            ug.setUser(ob);
            userGroupManager.save(ug);
        }

        success("创建成功");
    }

    /**
     * 修改群成员信息
     */
    public void update() {
        User user = isValid(accessToken, accessTokenManager);
        if (user == null) {
            expires();//用户信息过期
            return;
        }
        UserGroup old = userGroupManager.get(id);
        if (old == null || userGroup == null) {
            failure("非法参数");
            return;
        }
        old.setTop(userGroup.getTop() == null ? old.getTop() : userGroup.getTop());
        old.setDisturb(userGroup.getDisturb() == null ? old.getDisturb() : userGroup.getDisturb());
        old.setNickName(userGroup.getNickName() == null ? old.getNickName() : userGroup.getNickName());
        userGroup = userGroupManager.save(old);
        Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"修改成功\",\"userGroup\":" + JacksonUtil.toJson(new UserGroupResponse(userGroup)) + "}");
    }

    public void delete() {
        User user = isValid(accessToken, accessTokenManager);
        if (user == null) {
            expires();//用户信息过期
            return;
        }
        UserGroup old = userGroupManager.get(id);
        if (old == null) {
            failure("非法参数");
            return;
        }
        EasemobRestAPIFactory factory = ClientContext.getInstance().init(ClientContext.INIT_FROM_PROPERTIES).getAPIFactory();
        ChatGroupAPI chatgroup = (ChatGroupAPI) factory.newInstance(EasemobRestAPIFactory.CHATGROUP_CLASS);
        ResponseWrapper result = (ResponseWrapper) chatgroup.removeSingleUserFromChatGroup(old.getGroup().getEasemobGroupId(), old.getUser().getEasemobId());
        if (result == null || result.getResponseStatus() == null || result.getResponseStatus() != 200) {
            failure("删除失败");
            return;
        }
        Group group = old.getGroup();
        group.setNumber(group.getNumber() > 1 ? (group.getNumber() - 1) : 0);
        groupManager.save(group);
        userGroupManager.remove(old);

        success("删除成功");
    }

    public UserGroup getUserGroup() {
        return userGroup;
    }

    public void setUserGroup(UserGroup userGroup) {
        this.userGroup = userGroup;
    }

    public List<UserGroup> getUserGroups() {
        return userGroups;
    }

    public void setUserGroups(List<UserGroup> userGroups) {
        this.userGroups = userGroups;
    }

    public UserGroupQuery getQuery() {
        return query;
    }

    public void setQuery(UserGroupQuery query) {
        this.query = query;
    }

    public String getUserIds() {
        return userIds;
    }

    public void setUserIds(String userIds) {
        this.userIds = userIds;
    }
}