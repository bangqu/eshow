package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.InfoQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Info;
import cn.org.eshow.service.InfoManager;
import cn.org.eshow.util.PageUtil;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 *
 */
@Results({@Result(name = "input", location = "add"),
        @Result(name = "list", type = "redirect", location = ""),
        @Result(name = "success", type = "redirect", location = "view/${id}"),
        @Result(name = "redirect", type = "redirect", location = "${redirect}")})
public class InfoAction extends BaseAction {

    private static final long serialVersionUID = 1L;

    @Autowired
    private InfoManager infoManager;

    private List<Info> infos;
    private Info info;
    private InfoQuery query = new InfoQuery();

    /**
     *
     * @return
     */
    public String list() {
        infos = infoManager.list(query);
        return LIST;
    }

    /**
     *
     * @return
     */
    public String search() {
        Page<Info> page = infoManager.search(query);
        infos = page.getDataList();
        saveRequest("page", PageUtil.conversion(page));
        return LIST;
    }

    /**
     *
     */
    public void delete() {
        info = infoManager.get(id);
        if (info != null) {
            info.setEnabled(Boolean.FALSE);
            infoManager.save(info);
            RenderUtil.success("删除成功");
        } else {
            RenderUtil.failure("参数不正确");
        }
    }

    /**
     *
     * @return
     */
    public String view() {
        if (id != null) {
            info = infoManager.get(id);
        }
        return NONE;
    }

    /**
     *
     * @return
     */
    public String browse() {
        if (info.getUrl() != null) {
            query.setUrl(info.getUrl());
            query.setWebsite(info.getWebsite());
            info = infoManager.browse(query);
        }
        return NONE;
    }

    /**
     *
     * @return
     * @throws Exception
     */
    public String update() throws Exception {
        Info old = infoManager.get(id);
        old.setTitle(info.getTitle() != null ? info.getTitle() : old.getTitle());
        old.setContent(info.getContent() != null ? info.getContent() : old.getContent());
        old.setUrl(info.getUrl() != null ? info.getUrl() : old.getUrl());
        old.setRemark(info.getRemark() != null ? info.getRemark() : old.getRemark());
        infoManager.save(old);
        saveMessage("修改成功");
        return REDIRECT;
    }

    /**
     *
     * @return
     * @throws Exception
     */
    public String save() throws Exception {
        info.setType (info.getType() );
        info.setUrl(info.getUrl());
        info.setTitle(info.getTitle() );
        info.setContent(info.getContent());
        info.setRemark(info.getRemark());
        info.setEnabled(true);
        info.setUser(getSessionUser());
        info = infoManager.save(info);
        id = info.getId();
        saveMessage("添加成功");
        return REDIRECT;
    }

    public List<Info> getInfos() {
        return infos;
    }

    public void setInfos(List<Info> infos) {
        this.infos = infos;
    }

    public Info getInfo() {
        return info;
    }

    public void setInfo(Info info) {
        this.info = info;
    }

    public InfoQuery getQuery() {
        return query;
    }

    public void setQuery(InfoQuery query) {
        this.query = query;
    }

}