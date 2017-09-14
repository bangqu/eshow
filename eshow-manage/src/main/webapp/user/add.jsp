<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>用户</title>
    <link rel="stylesheet" href="<c:url value='/styles/profile.css'/>"
          type="text/css"/>
    <link rel="stylesheet" type="text/css" media="all"
          href="<c:url value='/scripts/calendar/calendar-blue.css'/>"
          title="calendar-win2k-1"/>
    <script type="text/javascript"
            src="<c:url value='/scripts/calendar/calendar.js'/>"></script>
    <script type="text/javascript"
            src="<c:url value='/scripts/calendar/lang/calendar-zh_utf8.js'/>"></script>
    <script type="text/javascript"
            src="<c:url value='/scripts/calendar/calendar-setup.js'/>"></script>

</head>
<body>
<div class="container mt">
    <div class="row-fluid">
        <s:include value="../left.jsp"></s:include>
        <div class="span10">
            <ul class="breadcrumb">
                <li><a href="${ctx}/index">首页</a> <span class="divider">/</span>
                </li>
                <li><a href="${ctx}/user/">用户管理</a> <span
                        class="divider">/</span></li>
                <li class="active">添加用户</li>
            </ul>
            <div class="well com">
                <div class="page-header">
                    <div class="page-header">
                        <div class="pull-right">
                            <a href="<c:url value='/user/add'/>"
                               class="btn btn-primary">添加</a>
                        </div>
                        <h3 class="yahei">修改资料</h3>
                    </div>
                    <ul id="myTab" class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="<c:url value='/user'/>">用户列表</a>
                        </li>
                        <li><a data-toggle="tab"
                               href="<c:url value='/user/password'/>">修改密码</a></li>
                        <li><a data-toggle="tab"
                               href="<c:url value='/user/setphoto'/>">修改头像</a></li>
                    </ul>
                    <%@ include file="/common/messages.jsp" %>


                    <form class="form-horizontal" action="user!save" id="userForm"
                          method="post" validate="false">
                        <fieldset>
                            <div class="control-group">
                                <label class="control-label" for="input01">登录名称</label>

                                <div class="controls">
                                    <input onblur="this.className='inputtext'"
                                           onfocus="this.className='inputtext2'" type="text"
                                           class="input-xlarge" id="username" name="user.username">&nbsp;&nbsp;&nbsp;必填，填写后不能修改
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="input01">密 码</label>

                                <div class="controls">
                                    <input type="password" class="input-xlarge"
                                           onblur="this.className='inputtext'"
                                           onfocus="this.className='inputtext2'" id="password"
                                           name="user.password">&nbsp;&nbsp;&nbsp;必填
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="input01">确认密码 </label>

                                <div class="controls">
                                    <input type="password" class="input-xlarge"
                                           onblur="this.className='inputtext'"
                                           onfocus="this.className='inputtext2'" id="password"
                                           name="user.confirmPassword"">&nbsp;&nbsp;&nbsp;和密码一致
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="input01">昵称</label>

                                <div class="controls">
                                    <input type="text" class="input-xlarge"
                                           onblur="this.className='inputtext'"
                                           onfocus="this.className='inputtext2'" id="nickname"
                                           name="user.nickname">&nbsp;&nbsp;&nbsp;必填
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="input01">真实姓名</label>

                                <div class="controls">
                                    <input type="text" class="input-xlarge"
                                           onblur="this.className='inputtext'"
                                           onfocus="this.className='inputtext2'" id="realname"
                                           name="user.realname">&nbsp;&nbsp;&nbsp;必填
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="fileInput">头像更改</label>

                                <div class="controls">
                                    <input class="input-file" id="fileInput" type="file"
                                           name="user.photo" value="${view.user.photo }">
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="select01">性别</label>

                                <div class="controls">
                                    <select id="male" style="width: 8em;" name="user.male">
                                        <option value="true">男</option>
                                        <option value="false" }>女</option>

                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="input01">出生日期</label>

                                <div class="controls">
                                    <input type="text" onblur="this.className='inputtext'"
                                           onfocus="this.className='inputtext2'" class="input-xlarge"
                                           name="user.birthday" id="birthday" name="user.birthday"
                                           value="${view.user.birthday}"><a href="javascript:;"><img
                                        id="triggerBirthdayTime"
                                        src="<c:url value='/scripts/calendar/img.gif'/>" border="0"
                                        align="middle"> </a>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="input01">年龄</label>

                                <div class="controls">
                                    <input type="text" class="input-xlarge"
                                           onblur="this.className='inputtext';"
                                           onfocus="this.className='inputtext2';" id="age"
                                           name="user.age" value="${view.user.age}">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="select01">血型</label>

                                <div class="controls">
                                    <select id="bloodType" style="width: 8em;" name="user.bloodType">
                                        <option value="1" ${view.user.marital==1?
                                                "selected='selected'":""}>A型
                                        </option>
                                        <option value="2" ${view.user.marital==2?
                                                "selected='selected'":""}>B型
                                        </option>
                                        <option value="3" ${view.user.marital==3?
                                                "selected='selected'":""}>AB型
                                        </option>
                                        <option value="4" ${view.user.marital==4?
                                                "selected='selected'":""}>O型
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="select01">星座</label>

                                <div class="controls">
                                    <select id="constellation" style="width: 8em;"
                                            name="user.constellation">
                                        <option value="1" ${view.user.constellation==1?
                                                "selected='selected'":""}>白羊座
                                        </option>
                                        <option value="2" ${view.user.constellation==2?
                                                "selected='selected'":""}>金牛座
                                        </option>
                                        <option value="3" ${view.user.constellation==3?
                                                "selected='selected'":""}>双子座
                                        </option>
                                        <option value="4" ${view.user.constellation==4?
                                                "selected='selected'":""}>巨蟹座
                                        </option>
                                        <option value="5" ${view.user.constellation==5?
                                                "selected='selected'":""}>狮子座
                                        </option>
                                        <option value="6" ${view.user.constellation==6?
                                                "selected='selected'":""}>处女座
                                        </option>
                                        <option value="7" ${view.user.constellation==7?
                                                "selected='selected'":""}>天秤座
                                        </option>
                                        <option value="8" ${view.user.constellation==8?
                                                "selected='selected'":""}>天蝎座
                                        </option>
                                        <option value="9" ${view.user.constellation==9?
                                                "selected='selected'":""}>射手座
                                        </option>
                                        <option value="10" ${view.user.constellation==10?
                                                "selected='selected'":""}>摩羯座
                                        </option>
                                        <option value="11" ${view.user.constellation==11?
                                                "selected='selected'":""}>水瓶座
                                        </option>
                                        <option value="12" ${view.user.constellation==12?
                                                "selected='selected'":""}>双鱼座
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="select01">属相</label>

                                <div class="controls">
                                    <select id="birthAttrib" style="width: 8em;"
                                            name="user.birthAttrib">
                                        <option value="1" ${view.user.birthAttrib==1?
                                                "selected='selected'":""}>鼠
                                        </option>
                                        <option value="2" ${view.user.birthAttrib==2?
                                                "selected='selected'":""}>牛
                                        </option>
                                        <option value="3" ${view.user.birthAttrib==3?
                                                "selected='selected'":""}>虎
                                        </option>
                                        <option value="4" ${view.user.birthAttrib==4?
                                                "selected='selected'":""}>兔
                                        </option>
                                        <option value="5" ${view.user.birthAttrib==5?
                                                "selected='selected'":""}>龙
                                        </option>
                                        <option value="6" ${view.user.birthAttrib==6?
                                                "selected='selected'":""}>蛇
                                        </option>
                                        <option value="7" ${view.user.birthAttrib==7?
                                                "selected='selected'":""}>马
                                        </option>
                                        <option value="8" ${view.user.birthAttrib==8?
                                                "selected='selected'":""}>羊
                                        </option>
                                        <option value="9" ${view.user.birthAttrib==9?
                                                "selected='selected'":""}>猴
                                        </option>
                                        <option value="10" ${view.user.birthAttrib==10?
                                                "selected='selected'":""}>鸡
                                        </option>
                                        <option value="11" ${view.user.birthAttrib==11?
                                                "selected='selected'":""}>狗
                                        </option>
                                        <option value="12" ${view.user.birthAttrib==12?
                                                "selected='selected'":""}>猪
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="select01">婚烟状况</label>

                                <div class="controls">
                                    <select id="marital" style="width: 8em;" name="user.marital">
                                        <option value="1" ${view.user.marital==1?
                                                "selected='selected'":""}>单身
                                        </option>
                                        <option value="2" ${view.user.marital==2?
                                                "selected='selected'":""}>已婚
                                        </option>
                                        <option value="3" ${view.user.marital==3?
                                                "selected='selected'":""}>恋爱
                                        </option>
                                        <option value="4" ${view.user.marital==4?
                                                "selected='selected'":""}>离异
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="textarea">自我介绍</label>

                                <div class="controls">
										<textarea class="input-xlarge" id="intro" rows="3"
                                                  name="user.intro">${view.user.intro }</textarea>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="textarea">爱好</label>

                                <div class="controls">
										<textarea class="input-xlarge" id="intro" rows="3"
                                                  name="user.hobby">${view.user.hobby }</textarea>
                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="submit" class="btn btn-primary">添加</button>
                                <button class="btn">取消</button>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var MINUTE = 60 * 1000;
        var HOUR = 60 * MINUTE;
        var DAY = 24 * HOUR;

        Calendar.setup({
            inputField: "birthday",
            button: "triggerBirthdayTime"
        });
    </script>
</div>
</body>
