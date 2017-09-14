package cn.org.eshow.dao;


import cn.org.eshow.bean.query.CaptchaQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Captcha;

import java.util.List;

/**
 * An interface that provides a data management interface to the Captcha table.
 */
public interface CaptchaDao extends GenericDao<Captcha, Integer> {

    Page<Captcha> search(CaptchaQuery query);

    List<Captcha> list(CaptchaQuery query);

}