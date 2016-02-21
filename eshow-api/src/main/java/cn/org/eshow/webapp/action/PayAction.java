package cn.org.eshow.webapp.action;


import org.apache.commons.lang.StringUtils;


public class PayAction extends ApiBaseAction<Blog> {

    private static final long serialVersionUID = 1L;


    private String no;


    public void pay() {
        if (StringUtils.isEmpty(no)){
            failure("非法参数");
            return;
        }
        success("支付成功");
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }
}