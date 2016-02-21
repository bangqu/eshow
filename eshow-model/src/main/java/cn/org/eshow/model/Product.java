package cn.org.eshow.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import java.io.Serializable;

/**
 * 商品表
 *
 * @author leida
 */
@Entity
@Table(name = "product")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Product extends BaseObject implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;// 商品ID
	private User user;// 用户
	private ProductCategory productCategory;// 商品类型
	private Date addTime;// 添加时间
	private Date updateTime;// 更新时间
	private String name;// 名称
	private String code;// 型号
	private Double price;// 商品价格
	private String unit;// 计量单位
	private String content;// 内容
	private String img;// 图片地址
	private Integer count;// 访问次数
	private Integer sequence;// 序号
	private String website;// 网站
	private Boolean enabled;// 是否可用

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "productCategoryId")
	public ProductCategory getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}

	@Column(name = "addTime", length = 0, nullable = false)
	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	@Column(name = "updateTime")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "name", length = 40, nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "code", length = 50)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "price", scale = 2)
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Column(name = "unit")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "content")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "img", length = 200)
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Column(name = "count", length = 11)
	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	@Column(name = "sequence")
	public Integer getSequence() {
		return sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	@Column(name = "website", length = 20)
	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	@Column(name = "enabled")
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

		Product pojo = (Product) o;

		if (addTime != null ? !addTime.equals(pojo.addTime) : pojo.addTime != null)
			return false;
		if (name != null ? !name.equals(pojo.name) : pojo.name != null)
			return false;
		if (content != null ? !content.equals(pojo.content) : pojo.content != null)
			return false;
		if (img != null ? !img.equals(pojo.img) : pojo.img != null)
			return false;
		if (website != null ? !website.equals(pojo.website) : pojo.website != null)
			return false;
		if (count != null ? !count.equals(pojo.count) : pojo.count != null)
			return false;
		if (price != null ? !price.equals(pojo.price) : pojo.price != null)
			return false;
		if (code != null ? !code.equals(pojo.code) : pojo.code != null)
			return false;

		return true;
	}

	public int hashCode() {
		int result = 0;
		result = result + (addTime != null ? addTime.hashCode() : 0);
		result = 31 * result + (name != null ? name.hashCode() : 0);
		result = 31 * result + (content != null ? content.hashCode() : 0);
		result = 31 * result + (img != null ? img.hashCode() : 0);
		result = 31 * result + (website != null ? website.hashCode() : 0);
		result = 31 * result + (price != null ? price.hashCode() : 0);
		result = 31 * result + (count != null ? count.hashCode() : 0);
		result = 31 * result + (code != null ? code.hashCode() : 0);

		return result;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer(getClass().getSimpleName());

		sb.append(" [");
		sb.append("id").append("='").append(getId()).append("', ");
		sb.append("addTime").append("='").append(getAddTime()).append("', ");
		sb.append("name").append("='").append(getName()).append("', ");
		sb.append("content").append("='").append(getContent()).append("', ");
		sb.append("img").append("='").append(getImg()).append("', ");
		sb.append("updateTime").append("='").append(getUpdateTime()).append("', ");
		sb.append("website").append("='").append(getWebsite()).append("', ");
		sb.append("count").append("='").append(getCount()).append("', ");
		sb.append("price").append("='").append(getPrice()).append("', ");
		sb.append("code").append("='").append(getCode()).append("', ");
		sb.append("]");

		return sb.toString();
	}

}
