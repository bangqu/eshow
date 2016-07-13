# EShow Java Web 开源框架

www.eshow.org.cn 旗下 Java Web 开源框架
采用流行的J2EE轻量级框架（Struts2+Spring+Hibernate），基于国外开源框架Appfuse，我们可以简称Appfuse中文加强版。

####Maven工程介绍：
| 工程名称        | 描述                      | 
| --------------- | ------------------------- |
| eshow-api       |  EShow API接口系统        |
| eshow-www       |  EShow 主网站平台         |
| eshow-manage    |  ESHow 后台管理系统       |
| eshow-core      |  EShow 核心包             |
| eshow-model     |  EShow 实体类（Hibernate）|
| eshow-service   |  EShow 服务层             |
| eshow-dao       |  EShow 数据库操作层       |
| eshow-web-common|  EShow Web基础包          |
| eshow-component |  EShow 第三方组件包       |
| eshow-static    |  EShow静态资源库          |

####如何构建项目：

使用[IntelliJ IDEA the Java IDE](https://www.jetbrains.com/idea/download/)，点击File，Open，选择项目位置，按顺序使用Maven构建项目打开即可。会自动生成项目文件，配置文件不要上传到git或者svn服务器上。如下图：

![EShow Java Web Idea](http://eshow.u.qiniudn.com/eshow-web-idea.png!super.jpg)

####Idea使用Tomcat运行：
每个工程需要单独添加，图片的左侧，目前EShow已支持tomcat8.0，在Deployment中，要添加eshow-static访问，如果断开不同，eshow-static访问路径会在common/path.jsp在修改。
![Tomcat配置图](http://uploadgif.55.la/upload/temp/2016/07/13/10/7952918782.gif)
