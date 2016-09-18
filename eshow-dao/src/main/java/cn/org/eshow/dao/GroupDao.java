package cn.org.eshow.dao;


import cn.org.eshow.bean.query.GroupQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Group;

import java.util.List;

/**
 * An interface that provides a data management interface to the Group table.
 */
public interface GroupDao extends GenericDao<Group, Integer> {

    Page<Group> search(GroupQuery query);

    List<Group> list(GroupQuery query);

    Long count(GroupQuery query);

}