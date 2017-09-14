package cn.org.eshow.webapp.action;

import cn.org.eshow.webapp.action.BaseAction;
import cn.org.eshow.bean.query.ProductCategoryQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.ProductCategory;
import cn.org.eshow.service.ProductCategoryManager;
import cn.org.eshow.service.ProductManager;
import cn.org.eshow.util.PageUtil;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 *
 */
@Results({ @Result(name = "input", location = "add"),
		@Result(name = "list", type = "redirect", location = ""),
		@Result(name = "success", type = "redirect", location = "view/${id}"),
		@Result(name = "redirect", type = "redirect", location = "${redirect}") })
public class ProductCategoryAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	@Autowired
	private ProductCategoryManager productCategoryManager;
	@Autowired
	private ProductManager productManager;

	private List<ProductCategory> productCategories;
	private ProductCategory productCategory;
	private ProductCategoryQuery query;

	/**
	 *
	 * @return
     */
	public String list() {
		productCategories = productCategoryManager.list(query);
		return LIST;
	}

	/**
	 *
	 * @return
     */
	public String search() {
		Page<ProductCategory> page = productCategoryManager.search(query);
		productCategories = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	/**
	 *
	 */
	public void delete() {
		ProductCategory productCategory = productCategoryManager.get(id);
		if (productCategory != null) {
			productManager.update(productCategory.getId());// 设置原产品的分类为空
			productCategory.setEnabled(Boolean.TRUE);
			productCategoryManager.save(productCategory);
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
			productCategory = productCategoryManager.get(id);
		}
		return NONE;
	}

	/**
	 *
	 * @return
	 * @throws Exception
     */
	public String update() throws Exception {
		ProductCategory old = productCategoryManager.get(id);
		old.setName(productCategory.getName());
		old.setDescription(productCategory.getDescription());
		productCategoryManager.save(old);
		saveMessage("修改成功");
		return LIST;
	}

	/**
	 *
	 * @return
	 * @throws Exception
     */
	public String save() throws Exception {
		productCategoryManager.save(productCategory);
		saveMessage("添加成功");
		return LIST;
	}

	public List<ProductCategory> getProductCategories() {
		return productCategories;
	}

	public void setProductCategories(List<ProductCategory> productCategories) {
		this.productCategories = productCategories;
	}

	public ProductCategory getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}

	public ProductCategoryQuery getQuery() {
		return query;
	}

	public void setQuery(ProductCategoryQuery query) {
		this.query = query;
	}

}