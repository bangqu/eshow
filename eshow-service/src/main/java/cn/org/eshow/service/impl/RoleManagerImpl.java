package cn.org.eshow.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.org.eshow.dao.RoleDao;
import cn.org.eshow.model.Role;
import cn.org.eshow.service.RoleManager;

/**
 * Implementation of RoleManager interface.
 * 
 * @author <a href="mailto:dan@getrolling.com">Dan Kibler</a>
 */
@Service("roleManager")
public class RoleManagerImpl extends GenericManagerImpl<Role, Integer> implements RoleManager {

	@Autowired
	RoleDao roleDao;

	@Autowired
	public RoleManagerImpl(RoleDao roleDao) {
		super(roleDao);
		this.roleDao = roleDao;
	}

	/**
	 * {@inheritDoc}
	 */
	public List<Role> getRoles() {
		return dao.getAll();
	}

	/**
	 * {@inheritDoc}
	 */
	public Role getRole(String rolename) {
		return roleDao.getRoleByName(rolename);
	}

	/**
	 * {@inheritDoc}
	 */
	public Role saveRole(Role role) {
		return dao.save(role);
	}

	/**
	 * {@inheritDoc}
	 */
	public void removeRole(String rolename) {
		roleDao.removeRole(rolename);
	}

}