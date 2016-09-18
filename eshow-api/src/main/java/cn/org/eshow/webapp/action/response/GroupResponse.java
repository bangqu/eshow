package cn.org.eshow.webapp.action.response;


import cn.org.eshow.model.Group;

/**
 * 群组返回对象
 */
public class GroupResponse {

    public Integer id = 0;//群组ID
    public String name = "";// 群组名称
    public String img = "";// 图片
    public Integer number = 0;// 成员数
    public Integer maxNumber = 0;// 成员上限
    public String easemobGroupId = "";//环信群组id
    public UserSimpleResponse user;// 用户返回对象

    public GroupResponse() {
    }

    public GroupResponse(Group group) {
        this.id = group.getId();
        this.name = group.getName() == null ? "" : group.getName();
        this.img = group.getImg() == null ? "" : group.getImg();
        this.number = group.getNumber() == null ? 0 : group.getNumber();
        this.maxNumber = group.getMaxNumber() == null ? 0 : group.getMaxNumber();
        this.easemobGroupId = group.getEasemobGroupId() == null ? "" : group.getEasemobGroupId();
        if (group.getUser() != null) {
            this.user = new UserSimpleResponse(group.getUser());
        }
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getMaxNumber() {
        return maxNumber;
    }

    public void setMaxNumber(Integer maxNumber) {
        this.maxNumber = maxNumber;
    }

    public String getEasemobGroupId() {
        return easemobGroupId;
    }

    public void setEasemobGroupId(String easemobGroupId) {
        this.easemobGroupId = easemobGroupId;
    }

    public UserSimpleResponse getUser() {
        return user;
    }

    public void setUser(UserSimpleResponse user) {
        this.user = user;
    }
}
