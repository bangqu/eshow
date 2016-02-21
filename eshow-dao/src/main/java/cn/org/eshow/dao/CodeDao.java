package cn.org.eshow.dao;


import cn.org.eshow.bean.query.CodeQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Code;

import java.util.List;

/**
 * An interface that provides a data management interface to the Code table.
 */
public interface CodeDao extends GenericDao<Code, Integer> {

    Page<Code> search(CodeQuery query);

    List<Code> list(CodeQuery query);

}