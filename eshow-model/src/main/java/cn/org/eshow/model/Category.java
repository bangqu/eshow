package cn.org.eshow.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 博文分类表
 *
 * @author leida
 */
@Entity
@Table(name = "category")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Category extends BaseObject implements Serializable {

    private static final long serialVersionUID = -8900865569034536533L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;// 博文分类ID

    @Column(name = "add_time")
    private Date addTime;// 添加时间

    @Column(name = "update_time")
    private Date updateTime;// 更新时间

    @Column(length = 20)
    private String name;// 名称

    @Column(length = 200)
    private String remark;// 注释

    @Column
    private Integer sequence;// 排序

    @Column(length = 20)
    private String website;// 网站

    @Column
    private Boolean enabled = Boolean.TRUE;// 是否可用

    public Integer getId() {
        return this.id;
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

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return this.remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;

        Category pojo = (Category) o;

        if (name != null ? !name.equals(pojo.name) : pojo.name != null)
            return false;
        if (website != null ? !website.equals(pojo.website) : pojo.website != null)
            return false;
        if (remark != null ? !remark.equals(pojo.remark) : pojo.remark != null)
            return false;

        return true;
    }

    public int hashCode() {
        int result = 0;
        result = result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        result = 31 * result + (website != null ? website.hashCode() : 0);

        return result;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", this.id)
                .append("addTime", this.updateTime)
                .append("updateTime", this.updateTime)
                .append("name", this.name)
                .toString();
    }

}
