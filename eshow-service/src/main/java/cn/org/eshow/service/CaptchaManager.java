package cn.org.eshow.service;

import cn.org.eshow.bean.query.CaptchaQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Captcha;
import cn.org.eshow.model.User;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface CaptchaManager extends GenericManager<Captcha, Integer> {

    /**
     * @param query
     * @return
     */
    List<Captcha> list(CaptchaQuery query);

    /**
     * @param query
     * @return
     */
    Page<Captcha> search(CaptchaQuery query);

    /**
     * 返回用户的找回密码的CODE
     *
     * @param user
     * @return
     */
    Captcha password(User user);

    /**
     * 返回用户的验证手机号的CODE
     *
     * @param mobile
     * @return
     */
    Captcha phone(String mobile);

    /**
     * @param query
     * @return
     */
    Captcha check(CaptchaQuery query);

    /**
     * 邮箱对应的验证码
     *
     * @param email
     * @param user
     * @return
     */
    Captcha email(String email, User user);

    /**
     * 邮箱对应的验证码
     *
     * @param email
     * @param type
     * @return
     */
    Captcha email(String email, String type);

    /**
     * @param type
     * @param code
     * @param email
     * @param user
     * @return
     */
    Captcha save(String type, String code, String email, User user);

    /**
     * @param type
     * @param code
     * @param mobile
     * @return
     */
    Captcha save(String type, String code, String mobile);

    /**
     * 修改编码状态
     *
     * @param code
     * @return
     */
    Captcha updateState(Captcha code);
}