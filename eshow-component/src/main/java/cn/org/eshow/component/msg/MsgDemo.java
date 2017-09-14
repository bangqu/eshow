package cn.org.eshow.component.msg;

public class MsgDemo {
    public static void main(String[] args) {
        EShowMsg msg = new EShowMsg();
        msg.setContent("验证码：123456");
        msg.setPhone("13656171020");
        System.out.println(msg.send());//1 表示成功
    }
}
