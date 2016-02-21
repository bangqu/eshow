package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.PhotoQuery;
import cn.org.eshow.common.CommonVar;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.component.upyun.UpYunUtil;
import cn.org.eshow.model.Album;
import cn.org.eshow.model.Photo;
import cn.org.eshow.model.User;
import cn.org.eshow.service.AlbumManager;
import cn.org.eshow.service.PhotoManager;
import cn.org.eshow.util.CommonUtil;
import cn.org.eshow.util.PageUtil;
import cn.org.eshow.webapp.action.response.BlogResponse;
import cn.org.eshow.webapp.action.response.PhotoResponse;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class PhotoAction extends BaseFileUploadAction<Photo> {

	private static final long serialVersionUID = 1L;

	@Autowired
	private PhotoManager photoManager;
	@Autowired
	private AlbumManager albumManager;

	private List<Photo> photos;
	private Photo photo;
	private PhotoQuery query = new PhotoQuery();
	private Integer albumId;


	public void search() {
		Page<Photo> page = photoManager.search(query);
		photos = page.getDataList();

		if (photos.isEmpty()) {
			failure("暂无数据");
			return;
		}
		List<PhotoResponse> responses = new ArrayList<PhotoResponse>();
		for (Photo obj : photos) {
			PhotoResponse response = new PhotoResponse(obj);
			responses.add(response);
		}
		Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "获取成功" + "\",\"" + "photos" + "\":" + JacksonUtil.toJson(responses) + "}");
	}

	public void delete() {
		Photo photo = photoManager.get(id);
		if (photo.getUser().equals(getSessionUser())) {
			Album album = photo.getAlbum();
			album.setPhotoSize(album.getPhotoSize() - CommonVar.STEP);
			albumManager.save(album);
			photoManager.remove(id);
			success("删除成功");
		} else {
			failure("无权删除");
		}
		return ;
	}

	public void view() {
		if (id != null) {
			photo = photoManager.get(id);

			Struts2Utils.renderText("{\"status\":\"1\",\"msg\":\"" + "获取成功" + "\",\"" + "photo" + "\":" + JacksonUtil.toJson(new PhotoResponse(photo)) + "}");

			return;
		}
		return ;
	}

	public void update() throws Exception {
		Photo old = photoManager.get(id);
		old.setName(photo.getName());
		old.setDescription(photo.getDescription());
		if (albumId != null) {
			old.setAlbum(albumManager.get(albumId));
		}
		if (file != null) {
			old.setImg(UpYunUtil.upload(file));
		}
		photoManager.save(old);
		success("图片修改成功");
	}

	public void save() throws Exception {
		photo.setAddTime(new Date());
		Album album = albumManager.get(albumId);
		photo.setAlbum(album);
		photo.setCommentSize(CommonVar.DEFAULT);
		User user = getSessionUser();
		photo.setUser(user);

		if (file != null) {
			photo.setImg(UpYunUtil.upload(file));
			album.setPhotoSize(CommonUtil.count(album.getPhotoSize()));
			album.setUpdateTime(new Date());
			photo.setAlbum(album);

		}
		photoManager.save(photo);
		success("新图片上传成功");

	}

	public List<Photo> getPhotos() {
		return photos;
	}

	public void setPhotos(List<Photo> photos) {
		this.photos = photos;
	}

	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

	public PhotoQuery getQuery() {
		return query;
	}

	public void setQuery(PhotoQuery query) {
		this.query = query;
	}

	public Integer getAlbumId() {
		return albumId;
	}

	public void setAlbumId(Integer albumId) {
		this.albumId = albumId;
	}

}