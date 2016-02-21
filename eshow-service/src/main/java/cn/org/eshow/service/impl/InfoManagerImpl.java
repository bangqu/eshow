package cn.org.eshow.service.impl;

import java.util.List;

import cn.org.eshow.bean.query.InfoQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.InfoDao;
import cn.org.eshow.model.Info;
import cn.org.eshow.service.InfoManager;
import cn.org.eshow.service.impl.GenericManagerImpl;
import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@WebService(serviceName = "InfoService", endpointInterface = "cn.org.eshow.service.InfoManager")
@Service
public class InfoManagerImpl extends GenericManagerImpl<Info, Integer> implements InfoManager {

	@Autowired
	InfoDao infoDao;

	@Autowired
	public InfoManagerImpl(InfoDao infoDao) {
		super(infoDao);
		this.infoDao = infoDao;
	}

    @Override
	public List<Info> list(InfoQuery query) {
		return infoDao.list(query);
	}

    @Override
	public Page<Info> search(InfoQuery query) {
		return infoDao.search(query);
	}

    @Override
	public Info browse(InfoQuery query) {
		List<Info> infos = infoDao.list(query);
		if (!infos.isEmpty()) {
			return infos.get(0);
		}
		return new Info();
	}

}