package cn.org.eshow.service;

import cn.org.eshow.bean.query.CodeQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Code;
import cn.org.eshow.model.User;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface CodeManager extends GenericManager<Code, Integer> {

    /**
     *
     * @param query
     * @return
     */
    List<Code> list(CodeQuery query);

    /**
     *
     * @param query
     * @return
     */
    Page<Code> search(CodeQuery query);

    /**
     * 返回用户的找回密码的CODE
     * @param user
     * @return
     */
    Code password(User user);

    /**
     *
     * @param query
     * @return
     */
    Code check(CodeQuery query);

    /**
     * 邮箱对应的验证码
     * @param email
     * @param user
     * @return
     */
    Code email(String email, User user);

    /**
     * 邮箱对应的验证码
     * @param email
     * @param type
     * @return
     */
    Code email(String email, String type);

    /**
     *
     * @param type
     * @param code
     * @param email
     * @param user
     * @return
     */
    Code save(String type, String code, String email, User user);

    /**
     * 修改编码状态
     * @param code
     * @return
     */
    Code state(Code code);
}