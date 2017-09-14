package cn.org.eshow.service;

import cn.org.eshow.bean.query.UserQuery;
import cn.org.eshow.common.page.Page;
import cn.org.eshow.dao.UserDao;
import cn.org.eshow.model.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;

/**
 * Business Service Interface to handle communication between web and persistence layer.
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 *         Modified by <a href="mailto:dan@getrolling.com">Dan Kibler </a>
 */
public interface UserManager extends GenericManager<User, Integer> {

    /**
     * Convenience method for testing - allows you to mock the DAO and set it on an interface.
     *
     * @param userDao the UserDao implementation to use
     */
    void setUserDao(UserDao userDao);

    /**
     * Convenience method for testing - allows you to mock the PasswordEncoder and set it on an interface.
     *
     * @param passwordEncoder the PasswordEncoder implementation to use
     */
    void setPasswordEncoder(PasswordEncoder passwordEncoder);

    /**
     * Retrieves a user by userId.  An exception is thrown if user not found
     *
     * @param userId the identifier for the user
     * @return User
     */
    User getUser(Integer userId);

    /**
     * Finds a user by their username.
     *
     * @param username the user's username used to login
     * @return User a populated user object
     * @throws org.springframework.security.core.userdetails.UsernameNotFoundException exception thrown when user not found
     */
    User getUserByUsername(String username) throws UsernameNotFoundException;

    /**
     * @param query
     * @return
     */
    List<User> list(UserQuery query);

    /**
     * Retrieves a list of users, filtering with parameters on a user object
     *
     * @param query parameters to filter on
     * @return Page
     */
    Page<User> search(UserQuery query);

    /**
     * 修改密码是否成功
     */
    boolean password(String oldPassword, String password, User user) throws UserExistsException;

    /**
     * Saves a user's information.
     *
     * @param user the user's information
     * @return user the updated user object
     * @throws UserExistsException thrown when user already exists
     */
    User saveUser(User user) throws UserExistsException;

    /**
     * Removes a user from the database by their userId
     *
     * @param userId the user's id
     */
    void removeUser(Integer userId);

    /**
     * Search a user for search terms.
     *
     * @param searchTerm the search terms.
     * @return a list of matches, or all if no searchTerm.
     */
    List<User> search(String searchTerm);

    /**
     * Builds a recovery password url by replacing placeholders with username and generated recovery token.
     * UrlTemplate should include two placeholders '{username}' for username and '{token}' for the recovery token.
     *
     * @param user
     * @param urlTemplate template including two placeholders '{username}' and '{token}'
     * @return String
     */
    String buildRecoveryPasswordUrl(User user, String urlTemplate);

    /**
     * @param user
     * @return String
     */
    String generateRecoveryToken(User user);

    /**
     * @param username
     * @param token
     * @return boolean
     */
    boolean isRecoveryTokenValid(String username, String token);

    /**
     * @param user
     * @param token
     * @return boolean
     */
    boolean isRecoveryTokenValid(User user, String token);

    /**
     * Sends a password recovery email to username.
     *
     * @param username
     * @param urlTemplate url template including two placeholders '{username}' and '{token}'
     */
    void sendPasswordRecoveryEmail(String username, String urlTemplate);

    /**
     * @param username
     * @param currentPassword
     * @param recoveryToken
     * @param newPassword
     * @param applicationUrl
     * @return User
     * @throws UserExistsException
     */
    User updatePassword(String username, String currentPassword, String recoveryToken, String newPassword, String applicationUrl) throws UserExistsException;

    /**
     * @param user
     * @param password
     * @return
     */
    boolean login(User user, String password);

    /**
     * @param query
     * @return
     */
    User check(UserQuery query);

    /**
     * 更新用户信息
     *
     * @param oldUser 原用户信息
     * @param user    用户新信息
     * @return
     */
    User updateUser(User oldUser, User user);

    /**
     * 更新用户个推信息
     *
     * @param user
     * @param old
     * @return
     */
    User updateGetuiInfo(User user, User old);

    /**
     * 用户退出
     *
     * @param user 用户新信息
     * @return
     */
    User logout(User user);

}
