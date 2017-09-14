package cn.org.eshow.component.easemob.api.impl;

import cn.org.eshow.component.easemob.api.ChatMessageAPI;
import cn.org.eshow.component.easemob.comm.OrgInfo;
import cn.org.eshow.component.easemob.comm.ResponseHandler;
import cn.org.eshow.component.easemob.comm.EasemobAPI;
import cn.org.eshow.component.easemob.comm.TokenUtil;
import io.swagger.client.ApiException;
import io.swagger.client.api.ChatHistoryApi;


public class EasemobChatMessage  implements ChatMessageAPI {

    private ResponseHandler responseHandler = new ResponseHandler();
    private ChatHistoryApi api = new ChatHistoryApi();

    @Override
    public Object exportChatMessages(final Long limit,final String cursor,final String query) {
        return responseHandler.handle(new EasemobAPI() {
            @Override
            public Object invokeEasemobAPI() throws ApiException {
                return api.orgNameAppNameChatmessagesGet(OrgInfo.ORG_NAME,OrgInfo.APP_NAME,TokenUtil.getAccessToken(),query,limit+"",cursor);
            }
        });
    }
}
