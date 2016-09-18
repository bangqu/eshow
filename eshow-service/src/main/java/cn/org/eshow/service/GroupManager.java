package cn.org.eshow.service;


import cn.org.eshow.bean.query.GroupQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Group;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface GroupManager extends GenericManager<Group, Integer> {

    List<Group> list(GroupQuery query);

    Page<Group> search(GroupQuery query);

    Group check(GroupQuery query);

    Long count(GroupQuery query);
}