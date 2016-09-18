package cn.org.eshow.service;

import cn.org.eshow.bean.query.ThirdPartyQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.ThirdParty;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface ThirdPartyManager extends GenericManager<ThirdParty, Integer> {

    /**
     *
     * @param query
     * @return
     */
    List<ThirdParty> list(ThirdPartyQuery query);

    /**
     *
     * @param query
     * @return
     */
    Page<ThirdParty> search(ThirdPartyQuery query);

    /**
     *
     * @param query
     * @return
     */
    ThirdParty check(ThirdPartyQuery query);
}
