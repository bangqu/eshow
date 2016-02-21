package cn.org.eshow.service;

import java.util.List;

import cn.org.eshow.bean.query.InfoQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Info;
import cn.org.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface InfoManager extends GenericManager<Info, Integer> {

	List<Info> list(InfoQuery query);

	Page<Info> search(InfoQuery query);

	Info browse(InfoQuery query);// 浏览单个信息


}