package cn.org.eshow.service;

import cn.org.eshow.bean.query.BlogCommentQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.BlogComment;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface BlogCommentManager extends GenericManager<BlogComment, Integer> {

    /**
     *
     * @param query
     * @return
     */
    List<BlogComment> list(BlogCommentQuery query);

    /**
     *
     * @param query
     * @return
     */
    Page<BlogComment> search(BlogCommentQuery query);
}