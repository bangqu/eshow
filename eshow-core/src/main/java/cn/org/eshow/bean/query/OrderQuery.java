package cn.org.eshow.bean.query;

/**
 * App 查询Bean
 * 
 * @author leida
 * 
 */
public class OrderQuery extends BaseQuery {

	public String no;
	public String channel;
	public String state;

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}