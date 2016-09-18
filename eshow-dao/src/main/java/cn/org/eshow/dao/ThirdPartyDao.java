package cn.org.eshow.dao;

import cn.org.eshow.bean.query.ThirdPartyQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.ThirdParty;

import java.util.List;

/**
 * An interface that provides a data management interface to the ThirdParty table.
 */
public interface ThirdPartyDao extends GenericDao<ThirdParty, Integer> {

    List<ThirdParty> list(ThirdPartyQuery query);

    Page<ThirdParty> search(ThirdPartyQuery query);
}
