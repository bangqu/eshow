package cn.org.eshow.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 订单表
 *
 * @author alicas
 */
@Entity
@Table(name = "order", catalog = "eshow")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Order extends BaseObject implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;//订单ID

    @Column(name = "add_time", length = 0)
    private Date addTime = new Date();//添加时间

    @Column(name = "update_time", length = 0)
    private Date updateTime = new Date();//更新时间

    @Column(length = 100)
    private String title;//标题

    @Column(length = 20)
    private String no;//订单号

    @Column(length = 255)
    private String channel;//支付渠道

    @Column(length = 10)
    private Double price = 0.00;//金额

    @Column
    private Integer state;//状态（0 待付款，1已付款 ）

    @Column(name = "ping_id")
    private String pingId;//Ping++支付回调ID

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;//用户

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getPingId() {
        return pingId;
    }

    public void setPingId(String pingId) {
        this.pingId = pingId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Order order = (Order) o;

        if (id != null ? !id.equals(order.id) : order.id != null) return false;
        if (addTime != null ? !addTime.equals(order.addTime) : order.addTime != null) return false;
        if (updateTime != null ? !updateTime.equals(order.updateTime) : order.updateTime != null) return false;
        if (title != null ? !title.equals(order.title) : order.title != null) return false;
        if (no != null ? !no.equals(order.no) : order.no != null) return false;
        if (channel != null ? !channel.equals(order.channel) : order.channel != null) return false;
        if (price != null ? !price.equals(order.price) : order.price != null) return false;
        if (state != null ? !state.equals(order.state) : order.state != null) return false;
        if (pingId != null ? !pingId.equals(order.pingId) : order.pingId != null) return false;
        return user != null ? user.equals(order.user) : order.user == null;

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (no != null ? no.hashCode() : 0);
        result = 31 * result + (channel != null ? channel.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (state != null ? state.hashCode() : 0);
        result = 31 * result + (pingId != null ? pingId.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this)
                .append("id", id)
                .append("addTime", addTime)
                .append("updateTime", updateTime)
                .append("title", title)
                .append("no", no)
                .append("channel", channel)
                .append("price", price)
                .append("state", state)
                .append("pingId", pingId)
                .append("user", user)
                .toString();
    }
}
