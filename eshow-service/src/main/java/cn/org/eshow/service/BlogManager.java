package cn.org.eshow.service;

import cn.org.eshow.bean.query.BlogQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Blog;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface BlogManager extends GenericManager<Blog, Integer> {

    /**
     * @param query
     * @return
     */
    List<Blog> list(BlogQuery query);

    /**
     * @param query
     * @return
     */
    Page<Blog> search(BlogQuery query);

    /**
     * 添加博文信息
     *
     * @param blog
     * @return
     */
    Blog saveBlog(Blog blog);

    /**
     * 更新博文信息
     *
     * @param old
     * @param blog
     * @return
     */
    Blog updateBlog(Blog old, Blog blog);

    /**
     * 访问次数+1
     *
     * @param blog
     * @return
     */
    Blog updateCount(Blog blog);

    /**
     * 更改博文是否可用
     *
     * @param blog
     * @return
     */
    Blog updateEnabled(Blog blog);

}
