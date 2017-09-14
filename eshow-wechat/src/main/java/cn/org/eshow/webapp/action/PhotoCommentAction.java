package cn.org.eshow.webapp.action;

import cn.org.eshow.webapp.action.BaseAction;
import cn.org.eshow.bean.query.PhotoCommentQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.model.Photo;
import cn.org.eshow.model.PhotoComment;
import cn.org.eshow.service.PhotoCommentManager;
import cn.org.eshow.service.PhotoManager;
import cn.org.eshow.util.CommonUtil;
import cn.org.eshow.util.PageUtil;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

/**
 *
 */
@Results({ @Result(name = "input", location = "add"),
		@Result(name = "list", type = "redirect", location = ""),
		@Result(name = "success", type = "redirect", location = "view/${id}"),
		@Result(name = "redirect", type = "redirect", location = "${redirect}") })
public class PhotoCommentAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	@Autowired
	private PhotoCommentManager photoCommentManager;
	@Autowired
	private PhotoManager photoManager;

	private List<PhotoComment> photoComments;
	private PhotoComment photoComment;
	private PhotoCommentQuery query;
	private Integer photoId;

	/**
	 *
	 * @return
     */
	public String list() {
		photoComments = photoCommentManager.list(query);
		return LIST;
	}

	/**
	 *
	 * @return
     */
	public String search() {
		Page<PhotoComment> page = photoCommentManager.search(query);
		photoComments = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	/**
	 *
	 * @return
     */
	public String delete() {
		PhotoComment old = photoCommentManager.get(id);
		if (old != null) {
			if (old.getPhoto().getUser().equals(getSessionUser())
					|| old.getUser().equals(getSessionUser())) {
				Photo photo = old.getPhoto();
				photo.setCommentSize(photo.getCommentSize() - CommonVar.STEP);
				photoManager.save(photo);
				photoCommentManager.remove(id);
				saveMessage("删除成功");

			} else {
				saveMessage("无权删除");
			}

		}
		return LIST;
	}

	/**
	 *
	 * @return
     */
	public String view() {
		if (id != null) {
			photoComment = photoCommentManager.get(id);
		} else {
			photoComment = new PhotoComment();
		}
		return NONE;
	}

	/**
	 *
	 * @return
	 * @throws Exception
     */
	public String update() throws Exception {
		PhotoComment old = photoCommentManager.get(id);
		old.setContent(photoComment.getContent());
		photoCommentManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	/**
	 *
	 * @return
	 * @throws Exception
     */
	public String save() throws Exception {
		photoComment.setAddTime(new Date());
		photoComment.setUser(getSessionUser());
		Photo photo = photoManager.get(photoId);
		photo.setCommentSize(CommonUtil.count(photo.getCommentSize()));
		photoComment.setPhoto(photo);
		photoCommentManager.save(photoComment);
		saveMessage("添加成功");
		id = photoId;
		return SUCCESS;
	}

	public List<PhotoComment> getPhotoComments() {
		return photoComments;
	}

	public void setPhotoComments(List<PhotoComment> photoComments) {
		this.photoComments = photoComments;
	}

	public PhotoComment getPhotoComment() {
		return photoComment;
	}

	public void setPhotoComment(PhotoComment photoComment) {
		this.photoComment = photoComment;
	}

	public PhotoCommentQuery getQuery() {
		return query;
	}

	public void setQuery(PhotoCommentQuery query) {
		this.query = query;
	}

	public Integer getPhotoId() {
		return photoId;
	}

	public void setPhotoId(Integer photoId) {
		this.photoId = photoId;
	}

}