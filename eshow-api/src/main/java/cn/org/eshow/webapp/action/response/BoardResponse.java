package cn.org.eshow.webapp.action.response;

import cn.org.eshow.model.Board;

import java.util.Date;

/**
 * 话题板块返回对象
 *
 * @author leida
 */

public class BoardResponse {


    private Integer id;// 版块ID
    private Date addTime;// 添加时间
    private String name;// 版块名称
    private String description;// 描述
    private Integer sequence;// 序号
    private String website;// 网站


    public BoardResponse(Board board) {
        if (board!=null) {
            this.id = board.getId();
            this.addTime = board.getAddTime();
            this.name = board.getName();
            this.description = board.getDescription();
            this.sequence = board.getSequence();
            this.website = board.getWebsite();
        }
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }
}
