package cn.org.eshow.bean.query;

/**
 * Info 查询Bean
 * 
 * @author leida
 * 
 */
public class InfoQuery extends BaseQuery {
	
	public String type;//
	public String url;//
	public String title;//
	public String content;//
	public String website;//
	public Boolean enabled;//

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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