package cn.org.eshow.dao;

import java.util.List;

import cn.org.eshow.bean.query.InfoQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.GenericDao;
import cn.org.eshow.model.Info;

/**
 * An interface that provides a data management interface to the Info table.
 */
public interface InfoDao extends GenericDao<Info, Integer> {

	List<Info> list(InfoQuery query);

	Page<Info> search(InfoQuery query);
}