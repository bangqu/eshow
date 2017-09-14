package cn.org.eshow.service.impl;


import cn.org.eshow.bean.query.CaptchaQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.CaptchaDao;
import cn.org.eshow.model.Captcha;
import cn.org.eshow.model.User;
import cn.org.eshow.service.CaptchaManager;
import cn.org.eshow.util.RandomCodeUtil;
import cn.org.eshow.util.RegexUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.WebService;
import java.util.Date;
import java.util.List;

@WebService(serviceName = "CaptchaService", endpointInterface = "cn.org.eshow.service.CaptchaManager")
@Service
public class CaptchaManagerImpl extends GenericManagerImpl<Captcha, Integer> implements CaptchaManager {

    @Autowired
    CaptchaDao captchaDao;

    public CaptchaManagerImpl() {
    }

    @Autowired
    public CaptchaManagerImpl(CaptchaDao captchaDao) {
        super(captchaDao);
        this.captchaDao = captchaDao;
    }

    @Override
    public List<Captcha> list(CaptchaQuery query) {
        return captchaDao.list(query);
    }

    @Override
    public Page<Captcha> search(CaptchaQuery query) {
        return captchaDao.search(query);
    }

    @Override
    public Captcha password(User user) {
        Captcha code = null;
        CaptchaQuery query = new CaptchaQuery();
        query.setOrder("addTime");
        query.setDesc(true);
        query.setUserId(user.getId());
        query.setType(CommonVar.CodeType.找回密码.toString());// 找回密码
        query.setState(CommonVar.CODE_UNUSED);// 未使用
        List<Captcha> codes = list(query);// 查找是否已经提交过找回密码请求（已生成CODE）
        if (codes.isEmpty()) {
            if (RegexUtil.email(user.getUsername())) {
                //16位字母和数字组合
                code = save(CommonVar.CodeType.找回密码.toString(), RandomCodeUtil.code(16), user.getUsername(), user);
            }
        } else {
            code = codes.get(0);
        }
        return code;
    }

    @Override
    public Captcha phone(String mobile) {
        Captcha code;
        CaptchaQuery query = new CaptchaQuery();
        query.setMobile(mobile);
        query.setType("手机验证");// 手机验证
        query.setOrder("addTime");
        query.setDesc(true);
        query.setState(CommonVar.CODE_UNUSED);// 未使用
        code = check(query);// 查找是否已经提交过手机验证请求（已生成CODE）
        if (code == null) {
            if (RegexUtil.mobile(mobile)) {
                //6位6数字组合
                code = save("手机验证", RandomCodeUtil.numberCode(6), mobile);
            }
        }
        return code;
    }

    @Override
    public Captcha save(String type, String code, String mobile) {
        Captcha obj = new Captcha();
        obj.setType(type);
        obj.setCode(code);
        obj.setMobile(mobile);
        obj.setState(CommonVar.CODE_UNUSED);//未使用
        return captchaDao.save(obj);
    }

    @Override
    public Captcha check(CaptchaQuery query) {
        query.setBegin(1);
        query.setPagesize(1);
        Page<Captcha> page = search(query);
        if (page.getDataList().isEmpty()) {
            return null;
        }
        return page.getDataList().get(0);
    }

    @Override
    public Captcha save(String type, String code, String email, User user) {
        Captcha object = new Captcha();
        object.setType(type);
        object.setCode(code);
        object.setEmail(email);
        object.setUser(user);
        return captchaDao.save(object);
    }

    public Captcha email(String email, User user) {
        Captcha code;
        CaptchaQuery query = new CaptchaQuery();
        query.setEmail(email);
        query.setType(CommonVar.CodeType.邮箱验证.toString());// 邮箱验证
        query.setOrder("addTime");
        query.setDesc(true);
        query.setState(CommonVar.CODE_UNUSED);// 未使用
        code = check(query);// 查找是否已经提交过手机验证请求（已生成CODE）
        if (code == null) {
            if (RegexUtil.email(email)) {
                //16位字母数字组合
                code = save(CommonVar.CodeType.邮箱验证.toString(), RandomCodeUtil.code(16), email, user);
            }
        }
        return code;
    }

    @Override
    public Captcha email(String email, String type) {
        Captcha code = null;
        CaptchaQuery query = new CaptchaQuery();
        query.setEmail(email);
        query.setType(CommonVar.CodeType.邮箱验证.toString());// 邮箱验证
        query.setOrder("addTime");
        query.setDesc(true);
        query.setState(CommonVar.CODE_UNUSED);// 未使用
        code = check(query);// 查找是否已经提交过手机验证请求（已生成CODE）
        if (code == null) {
            if (RegexUtil.email(email)) {
                //16位字母数字组合
                code = save(CommonVar.CodeType.邮箱验证.toString(), RandomCodeUtil.code(16), email, null);
            }
        }
        return code;
    }

    @Override
    public Captcha updateState(Captcha code) {
        code.setState(code.getState() == CommonVar.CODE_UNUSED ? CommonVar.CODE_USED : CommonVar.CODE_UNUSED);
        return captchaDao.save(code);
    }

}
