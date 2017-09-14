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
 * 消息通知
 */
@Entity
@Table(name = "notification")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Notification extends BaseObject implements Serializable {

    private static final long serialVersionUID = 1L;

    public enum Category {
        系统消息, 平台公告
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;//消息通知ID

    @Column(name = "add_time")
    private Date addTime = new Date();//添加时间

    @Column(name = "update_time")
    private Date updateTime = new Date();//添加时间

    @Column
    private String category;//分类（系统消息，平台公告）

    @Column
    private String img;//图片

    @Column
    private String title;//标题

    @Column
    private String content;//内容

    @Column
    private String model;//模型

    @Column(name = "model_val")
    private String modelVal;//模型值

    @Column
    private Integer state = 0;//状态（1已读，0未读）

    @Column
    private Boolean enabled = Boolean.TRUE;//是否可用

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;//用户

    public Notification() {
    }

    public Notification(String category, String img, String title, String content, String model, String modelVal) {
        this.category = category;
        this.img = img;
        this.title = title;
        this.content = content;
        this.model = model;
        this.modelVal = modelVal;
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
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

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getModelVal() {
        return modelVal;
    }

    public void setModelVal(String modelVal) {
        this.modelVal = modelVal;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
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
                .append("category", this.category)
                .append("img", this.img)
                .append("title", this.title)
                .append("content", this.content)
                .append("model", this.model)
                .append("state", this.state)
                .append("enabled", this.enabled)
                .append("user", this.user)
                .toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Notification that = (Notification) o;

        if (addTime != null ? !addTime.equals(that.addTime) : that.addTime != null) return false;
        if (category != null ? !category.equals(that.category) : that.category != null) return false;
        if (img != null ? !img.equals(that.img) : that.img != null) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;
        if (enabled != null ? !enabled.equals(that.enabled) : that.enabled != null) return false;
        if (model != null ? !model.equals(that.model) : that.model != null) return false;
        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (state != null ? !state.equals(that.state) : that.state != null) return false;
        if (updateTime != null ? !updateTime.equals(that.updateTime) : that.updateTime != null) return false;
        if (user != null ? !user.equals(that.user) : that.user != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (category != null ? category.hashCode() : 0);
        result = 31 * result + (img != null ? img.hashCode() : 0);
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (model != null ? model.hashCode() : 0);
        result = 31 * result + (state != null ? state.hashCode() : 0);
        result = 31 * result + (enabled != null ? enabled.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        return result;
    }
}
