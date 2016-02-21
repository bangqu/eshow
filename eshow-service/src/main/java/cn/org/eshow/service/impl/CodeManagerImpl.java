package cn.org.eshow.service.impl;


import cn.org.eshow.bean.query.CodeQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.CodeDao;
import cn.org.eshow.model.Code;
import cn.org.eshow.model.User;
import cn.org.eshow.service.CodeManager;
import cn.org.eshow.util.RandomCodeUtil;
import cn.org.eshow.util.RegexUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.WebService;
import java.util.List;

@WebService(serviceName = "CodeService", endpointInterface = "cn.org.eshow.service.CodeManager")
@Service
public class CodeManagerImpl extends GenericManagerImpl<Code, Integer> implements CodeManager {

    @Autowired
    CodeDao codeDao;

    public CodeManagerImpl() {
    }

    @Autowired
    public CodeManagerImpl(CodeDao codeDao) {
        super(codeDao);
        this.codeDao = codeDao;
    }

    public List<Code> list(CodeQuery query) {
        return codeDao.list(query);
    }

    public Page<Code> search(CodeQuery query) { return codeDao.search(query); }

    public Code password(User user) {
        Code code = null;
        CodeQuery query = new CodeQuery();
        query.setOrder("addTime");
        query.setDesc(true);
        query.setUserId(user.getId());
        query.setType(CommonVar.CodeType.找回密码.toString());// 找回密码
        query.setState(CommonVar.CODE_UNUSED);// 未使用
        List<Code> codes = list(query);// 查找是否已经提交过找回密码请求（已生成CODE）
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

    public Code check(CodeQuery query) {
        query.setBegin(1);
        query.setPagesize(1);
        Page<Code> page = search(query);
        if (page.getDataList().isEmpty()) {
            return null;
        }
        return page.getDataList().get(0);
    }

    public Code save(String type, String code, String email, User user) {
        Code object = new Code();
        object.setType(type);
        object.setCode(code);
        object.setEmail(email);
        object.setUser(user);
        return codeDao.save(object);
    }

    public Code email(String email, User user) {
        Code code;
        CodeQuery query = new CodeQuery();
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

    public Code email(String email, String type) {
        Code code = null;
        CodeQuery query = new CodeQuery();
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

    public Code state(Code code) {
        code.setState(code.getState() == CommonVar.CODE_UNUSED ? CommonVar.CODE_USED : CommonVar.CODE_UNUSED);
        return codeDao.save(code);
    }
}
