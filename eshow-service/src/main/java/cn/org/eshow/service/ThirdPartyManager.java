package cn.org.eshow.service;

import cn.org.eshow.bean.query.ThirdPartyQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.ThirdParty;
import cn.org.eshow.model.User;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface ThirdPartyManager extends GenericManager<ThirdParty, Integer> {

    /**
     * @param query
     * @return
     */
    List<ThirdParty> list(ThirdPartyQuery query);

    /**
     * @param query
     * @return
     */
    Page<ThirdParty> search(ThirdPartyQuery query);

    /**
     * @param query
     * @return
     */
    ThirdParty check(ThirdPartyQuery query);

    /**
     * 添加第三方账号信息
     *
     * @param thirdParty
     * @return
     */
    ThirdParty save(ThirdParty thirdParty, User user);

    /**
     * 更新第三方账号关联用户
     *
     * @param thirdParty
     * @return
     */
    ThirdParty updateUser(ThirdParty thirdParty, User user);

    /**
     * 删除第三方账号信息
     *
     * @param thirdParty
     * @return
     */
    ThirdParty enabled(ThirdParty thirdParty);
}
