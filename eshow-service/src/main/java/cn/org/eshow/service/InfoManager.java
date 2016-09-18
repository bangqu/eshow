package cn.org.eshow.service;

import cn.org.eshow.bean.query.InfoQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Info;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface InfoManager extends GenericManager<Info, Integer> {

	/**
	 *
	 * @param query
	 * @return
     */
	List<Info> list(InfoQuery query);

	/**
	 *
	 * @param query
	 * @return
     */
	Page<Info> search(InfoQuery query);

	/**
	 *
	 * @param query
	 * @return
     */
	Info browse(InfoQuery query);// 浏览单个信息

}