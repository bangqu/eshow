package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.ProductQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Product;
import cn.org.eshow.service.ProductCategoryManager;
import cn.org.eshow.service.ProductManager;
import cn.org.eshow.util.PageUtil;
import cn.org.eshow.webapp.util.RenderUtil;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

@Results({@Result(name = "input", location = "add"),
        @Result(name = "list", type = "redirect", location = ""),
        @Result(name = "success", type = "redirect", location = "view/${id}"),
        @Result(name = "redirect", type = "redirect", location = "${redirect}")})
@AllowedMethods({"list","check","search","delete","view","update","save"})
public class ProductAction extends BaseAction {

    private static final long serialVersionUID = 1L;

    @Autowired
    private ProductManager productManager;
    @Autowired
    private ProductCategoryManager productCategoryManager;

    private List<Product> products;
    private Product product;
    private ProductQuery query=new ProductQuery();
    private Integer productCategoryId;

    /**
     *
     * @return
     */
    public String check() {
        product = productManager.check(query);
        return LIST;
    }

    public String search() {
        Page<Product> page = productManager.search(query);
        products = page.getDataList();
        saveRequest("page", PageUtil.conversion(page));
        saveRequest("query",query);
        return LIST;
    }

    public void delete() {
        product = productManager.get(id);
        product.setEnabled(Boolean.FALSE);
        productManager.save(product);
        RenderUtil.success("删除成功");
    }

    public String view() {
        if (id != null) {
            product = productManager.get(id);
        }
        saveMessage("没有这个用户");
        System.out.println("没有这个用户");
        return NONE;
    }

    public String update() throws Exception {
        Product old = productManager.get(id);
        old.setUpdateTime(new Date());
        old.setName(product.getName());
        old.setPrice(product.getPrice());
        old.setCode(product.getCode());
        old.setImg(product.getImg()!= null ? product.getImg() : old.getImg());
        old.setUnit(product.getUnit());
        old.setContent(product.getContent());
        if (productCategoryId != null) {
            old.setProductCategory(productCategoryManager.get(productCategoryId));
        }
        productManager.save(old);
        saveMessage("修改成功");
        return REDIRECT;
    }

    public String save() throws Exception {
        product.setAddTime(new Date());
        product.setUpdateTime(new Date());
        if (productCategoryId != null) {
            product.setProductCategory(productCategoryManager.get(productCategoryId));
        }
        product.setUser(getSessionUser());
        product.setCount(CommonVar.DEFAULT);
        product.setSequence(0);
        product.setEnabled(Boolean.TRUE);
        product = productManager.save(product);
        saveMessage("添加成功");
        id = product.getId();
        return REDIRECT;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public Integer getProductCategoryId() {
        return productCategoryId;
    }

    public void setProductCategoryId(Integer productCategoryId) {
        this.productCategoryId = productCategoryId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public ProductQuery getQuery() {
        return query;
    }

    public void setQuery(ProductQuery query) {
        this.query = query;
    }

}