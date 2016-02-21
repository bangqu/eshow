package cn.org.eshow.bean.query;

import java.util.Date;

/**
 * Album 查询Bean
 * 
 * @author leida
 * 
 */
public class AlbumQuery extends BaseQuery {

	public Date addTime;//
    public Date updateTime;// 更新时间
    public Integer photoSize;// 照片的总数
    public Integer count;// 访问次数
    public String website;// 网站
    public Boolean enabled;//是否可用
    public String name;//
	public String description;//
    public String img;//
	public Integer userId;//

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getPhotoSize() {
        return photoSize;
    }

    public void setPhotoSize(Integer photoSize) {
        this.photoSize = photoSize;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
}