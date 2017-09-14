package cn.org.eshow.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 通知数量表
 */
@Entity
@Table(name = "notification_remind")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class NotificationRemind extends BaseObject implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;//通知数量ID

    @Column(name = "add_time", length = 0)
    private Date addTime = new Date();// 添加时间

    @Column(name = "update_time", length = 0)
    private Date updateTime = new Date();// 更新时间

    @Column(name = "friend_count")
    private Integer friendCount = 0;//新好友请求数量

    @Column(name = "notification_count")
    private Integer notificationCount = 0;//新通知数量

    @Column(name = "cart_count")
    private Integer cartCount = 0;//购物车商品数量

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;// 用户

    public NotificationRemind() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getFriendCount() {
        return friendCount;
    }

    public void setFriendCount(Integer friendCount) {
        this.friendCount = friendCount;
    }

    public Integer getNotificationCount() {
        return notificationCount;
    }

    public void setNotificationCount(Integer notificationCount) {
        this.notificationCount = notificationCount;
    }

    public Integer getCartCount() {
        return cartCount;
    }

    public void setCartCount(Integer cartCount) {
        this.cartCount = cartCount;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", this.id)
                .append("addTime", this.addTime)
                .append("updateTime", this.updateTime)
                .append("friendCount", this.friendCount)
                .append("notificationCount", this.notificationCount)
                .append("user", this.user)
                .toString();
    }

    public int hashCode() {
        int result = 0;
        result = result + (id != null ? id.hashCode() : 0);
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (friendCount != null ? friendCount.hashCode() : 0);
        result = 31 * result + (notificationCount != null ? notificationCount.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        return result;
    }

    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;

        NotificationRemind pojo = (NotificationRemind) o;
        if (id != null ? !id.equals(pojo.id) : pojo.id != null)
            return false;
        if (addTime != null ? !addTime.equals(pojo.addTime) : pojo.addTime != null)
            return false;
        if (updateTime != null ? !updateTime.equals(pojo.updateTime) : pojo.updateTime != null)
            return false;
        if (friendCount != null ? !friendCount.equals(pojo.friendCount) : pojo.friendCount != null)
            return false;
        if (notificationCount != null ? !notificationCount.equals(pojo.notificationCount) : pojo.notificationCount != null)
            return false;
        if (user != null ? !user.equals(pojo.user) : pojo.user != null)
            return false;

        return true;
    }


}