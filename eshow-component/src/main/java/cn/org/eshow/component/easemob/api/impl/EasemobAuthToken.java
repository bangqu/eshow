package cn.org.eshow.component.easemob.api.impl;

import cn.org.eshow.component.easemob.api.AuthTokenAPI;
import cn.org.eshow.component.easemob.comm.TokenUtil;


public class EasemobAuthToken implements AuthTokenAPI{

	@Override
	public Object getAuthToken(){
		return TokenUtil.getAccessToken();
	}
}
