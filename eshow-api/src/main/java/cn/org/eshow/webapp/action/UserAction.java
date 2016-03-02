package cn.org.eshow.webapp.action;

import cn.org.eshow.bean.query.UserQuery;
import cn.org.eshow.model.User;

import java.util.List;


public class UserAction extends ApiBaseAction {

	private static final long serialVersionUID = 6776558938712115191L;

	private List<User> users;
	private User user;
	private UserQuery query;





	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserQuery getQuery() {
		return query;
	}

	public void setQuery(UserQuery query) {
		this.query = query;
	}
}
