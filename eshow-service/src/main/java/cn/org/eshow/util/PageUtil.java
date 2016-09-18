package cn.org.eshow.util;

import cn.org.eshow.common.page.Page;
import cn.org.eshow.common.page.PageTool;

/**
 * @author leida
 */
public class PageUtil {

    /**
     * @param page
     * @return PageTool
     */
    public static PageTool conversion(Page<?> page) {
        PageTool pageTool = new PageTool(page.getCurrentPage(), page.getPageSize(), page.getTotal());
        return pageTool;
    }
}
