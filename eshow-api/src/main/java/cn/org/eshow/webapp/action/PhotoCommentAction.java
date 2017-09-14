package cn.org.eshow.webapp.action;

import cn.org.eshow.model.PhotoComment;
import org.apache.struts2.convention.annotation.AllowedMethods;

/**
 * 照片评论API接口
 */
@AllowedMethods({"check", "login", "singup", "third", "mobile", "password", "update", "cancel", "view"})
public class PhotoCommentAction extends ApiBaseAction<PhotoComment> {

    private static final long serialVersionUID = 1L;


}