package cn.org.eshow.service.impl;

import cn.org.eshow.bean.query.UserQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.component.getui.GetuiUtil;
import cn.org.eshow.dao.UserDao;
import cn.org.eshow.model.User;
import cn.org.eshow.service.PasswordTokenManager;
import cn.org.eshow.service.UserExistsException;
import cn.org.eshow.service.UserManager;
import cn.org.eshow.service.UserService;
import cn.org.eshow.util.JacksonUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.orm.jpa.JpaSystemException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.jws.WebService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Implementation of UserManager interface.
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 */
@WebService(serviceName = "UserService", endpointInterface = "cn.org.eshow.service.UserService")
@Service("userManager")
public class UserManagerImpl extends GenericManagerImpl<User, Integer> implements UserManager, UserService {

    private PasswordEncoder passwordEncoder;

    private UserDao userDao;

    private PasswordTokenManager passwordTokenManager;

    public UserManagerImpl() {
    }

    @Override
    @Autowired
    public void setUserDao(final UserDao userDao) {
        this.dao = userDao;
        this.userDao = userDao;
    }

    @Autowired
    @Qualifier("passwordEncoder")
    public void setPasswordEncoder(final PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Autowired(required = false)
    public void setPasswordTokenManager(final PasswordTokenManager passwordTokenManager) {
        this.passwordTokenManager = passwordTokenManager;
    }

    /**
     * {@inheritDoc}
     */
    public User getUser(Integer userId) {
        return userDao.get(userId);
    }


    public List<User> list(UserQuery query) {
        return userDao.list(query);
    }

    /**
     * {@inheritDoc}
     */
    public Page<User> search(UserQuery query) {
        return userDao.search(query);
    }

    /**
     * {@inheritDoc}
     */
    public User saveUser(User user) throws UserExistsException {

        if (user.getVersion() == null) {
            // if new user, lowercase userId
            user.setUsername(user.getUsername().toLowerCase());
        }

        // Get and prepare password management-related artifacts
        boolean passwordChanged = false;
        if (passwordEncoder != null) {
            // Check whether we have to encrypt (or re-encrypt) the password
            if (user.getVersion() == null) {
                // New user, always encrypt
                passwordChanged = true;
            } else {
                // Existing user, check password in DB
                String currentPassword = userDao.getUserPassword(user.getUsername());
                if (currentPassword == null) {
                    passwordChanged = true;
                } else {
                    if (!currentPassword.equals(user.getPassword())) {
                        passwordChanged = true;
                    }
                }
            }

            // If password was changed (or new user), encrypt it
            if (passwordChanged) {
                user.setPassword(passwordEncoder.encode(user.getPassword()));
            }
        } else {
            log.warn("PasswordEncoder not set, skipping password encryption...");
        }

        try {
            return userDao.saveUser(user);
        } catch (DataIntegrityViolationException e) {
            // e.printStackTrace();
            log.warn(e.getMessage());
            throw new UserExistsException("User '" + user.getUsername() + "' already exists!");
        } catch (JpaSystemException e) { // needed for JPA
            // e.printStackTrace();
            log.warn(e.getMessage());
            throw new UserExistsException("User '" + user.getUsername() + "' already exists!");
        }
    }

    /**
     * {@inheritDoc}
     */
    public void removeUser(Integer userId) {
        log.debug("removing user: " + userId);
        userDao.remove(userId);
    }

    /**
     * {@inheritDoc}
     *
     * @param username the login name of the human
     * @return User the populated user object
     * @throws UsernameNotFoundException thrown when username not found
     */
    public User getUserByUsername(String username) throws UsernameNotFoundException {
        return (User) userDao.loadUserByUsername(username);
    }

    /**
     * {@inheritDoc}
     */
    public boolean password(String oldPasswd, String password, User user) throws UserExistsException {
        // 加密传来的旧密码和数据库中的密码对比
        if (passwordEncoder != null) {
            if (passwordEncoder.matches(oldPasswd, user.getPassword())) {
                user.setPassword(passwordEncoder.encode(password));
                userDao.saveUser(user);
                return true;
            }
        }
        return false;
    }


    /**
     * {@inheritDoc}
     */
    public List<User> search(String searchTerm) {
        return super.search(searchTerm, User.class);
    }

    @Override
    public String buildRecoveryPasswordUrl(User user, String urlTemplate) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public String generateRecoveryToken(User user) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public boolean isRecoveryTokenValid(String username, String token) {
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public boolean isRecoveryTokenValid(User user, String token) {
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void sendPasswordRecoveryEmail(String username, String urlTemplate) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public User updatePassword(String username, String currentPassword, String recoveryToken, String newPassword, String applicationUrl) throws UserExistsException {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    public boolean login(User user, String password) {
        if (passwordEncoder != null) {
            if (passwordEncoder.matches(password, user.getPassword())) {
                return true;
            }
        }
        return false;
    }

    public User check(UserQuery query) {
        List<User> users = list(query);
        if (!users.isEmpty()) {
            return users.get(0);
        }
        return null;
    }

    @Override
    public User updateUser(User oldUser, User user) {
        if (StringUtils.isNotEmpty(user.getPhoto())) {
            oldUser.setPhoto(user.getPhoto());//更新头像
        }
        if (StringUtils.isNotEmpty(user.getRealname())) {
            oldUser.setRealname(user.getRealname());//更新姓名
        }
        if (user.getAge() != null) {
            oldUser.setAge(user.getAge());//更新年龄
        }
        if (user.getMale() != null) {
            oldUser.setMale(user.getMale());//更新性别
        }
        if (StringUtils.isNotEmpty(user.getNickname())) {
            oldUser.setNickname(user.getNickname());//更新昵称
        }
        if (StringUtils.isNotEmpty(user.getEmail())) {
            oldUser.setEmail(user.getEmail());//更新邮箱
        }
        if (user.getBirthday() != null) {
            oldUser.setBirthday(user.getBirthday());//更新生日
        }
        if (StringUtils.isNotEmpty(user.getIntro())) {
            oldUser.setIntro(user.getIntro());//更新简介
        }
        return userDao.save(oldUser);
    }

    @Override
    public User updateGetuiInfo(User user, User old) {
        if (!StringUtils.isEmpty(user.getClientId())) {
            if (!StringUtils.isEmpty(old.getClientId()) && !old.getClientId().equals(user.getClientId())) {
                //推送透传消息到旧设备上
                Map map = new HashMap();
                map.put("repeat_login", 1);
                map.put("username", old.getUsername());
                GetuiUtil.pushTransmissionMessageToSingle(old.getClientId(), "", "", JacksonUtil.toJson(map));
            }
            old.setClientId(user.getClientId());
            old.setDeviceToken(user.getDeviceToken() == null ? old.getDeviceToken() : user.getDeviceToken());
            old = userDao.save(old);
        }
        return old;
    }

    @Override
    public User logout(User user) {
        user.setClientId(null);
        user.setDeviceToken(null);
        return userDao.save(user);
    }

}
