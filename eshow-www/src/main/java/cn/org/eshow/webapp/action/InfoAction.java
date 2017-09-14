package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.InfoQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Info;
import cn.org.eshow.service.InfoManager;
import cn.org.eshow.util.PageUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
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
@AllowedMethods({"list", "search", "delete", "view", "update", "save"})
public class InfoAction extends BaseAction {

    private static final long serialVersionUID = 1L;

    @Autowired
    private InfoManager infoManager;

    private List<Info> infos;
    private Info info = new Info();
    private InfoQuery query = new InfoQuery();

    /**
     * @return
     */
    public String search() {
        Page<Info> page = infoManager.search(query);
        infos = page.getDataList();
        saveRequest("page", PageUtil.conversion(page));
        return LIST;
    }

    /**
     * @return
     */
    public String view() {
        if (id != null) {
            info = infoManager.get(id);
        }
        return NONE;
    }

    /**
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