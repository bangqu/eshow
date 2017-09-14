package cn.org.eshow.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 产品分类表
 *
 * @author leida
 */
@Entity
@Table(name = "product_category")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class ProductCategory extends BaseObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;//产品分类ID

    @Column(length = 20)
    private String name;//名称

    @Column(length = 400)
    private String description;//描述

    @Column
    private Integer sequence;//排序

    @Column(length = 20)
    private String website;//网站

    @Column
    private Boolean enabled = Boolean.TRUE;//是否可用

    @OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY, mappedBy = "productCategory")
    private Set<Product> products = new HashSet<Product>(0);//商品列表


    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
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

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }


    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }


    public Set<Product> getProducts() {
        return products;
    }

    public void setProducts(Set<Product> products) {
        this.products = products;
    }

    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;

        ProductCategory pojo = (ProductCategory) o;

        if (name != null ? !name.equals(pojo.name) : pojo.name != null)
            return false;
        if (website != null ? !website.equals(pojo.website) : pojo.website != null)
            return false;
        if (description != null ? !description.equals(pojo.description)
                : pojo.description != null)
            return false;

        return true;
    }

    public int hashCode() {
        int result = 0;
        result = result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (website != null ? website.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);

        return result;
    }

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", this.id)
//                .append("addTime", this.addTime)
                .append("name", this.name)
                .append("description", this.description)
                .append("website", this.website).toString();
    }

}
