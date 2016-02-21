package cn.org.eshow.service;

import cn.org.eshow.bean.query.PhotoCommentQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.PhotoComment;

import javax.jws.WebService;
import java.util.List;

@WebService
public interface PhotoCommentManager extends GenericManager<PhotoComment, Integer> {

    List<PhotoComment> list(PhotoCommentQuery query);

    Page<PhotoComment> search(PhotoCommentQuery query);
}