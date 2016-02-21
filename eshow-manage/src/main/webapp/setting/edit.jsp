<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="user!view" id="view" executeResult="false" namespace="">
    <s:param name="id">${myid}</s:param>
</s:action>
<head>
    <title>个人用户_完善资料</title>
    <link rel="stylesheet" href="${ctx}/static/styles/setting.css"/>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="setbox clearfix">
            <div class="tabsnav clearfix">
                <a href="<c:url value='/setting/'/>"
                   style="cursor: pointer; text-decoration: none;"> 个人资料</a>
                <span>完善资料 </span>
                <a href="<c:url value='/setting/photo'/>"
                   style="cursor: pointer; text-decoration: none;">修改头像</a>
                <a href="<c:url value='/setting/password'/>"
                   style="cursor: pointer; text-decoration: none;">修改密码</a>
            </div>
            <s:form action="user!update.action" id="userForm" method="post"  validate="false" namespace="">
                <input type="hidden" name="id" value="${view.user.id}"/>
                <s:hidden name="user.username" value="%{#view.user.username}"></s:hidden>
                <s:hidden name="user.password" value="password"></s:hidden>
                <s:hidden name="user.confirmPassword" value="password"></s:hidden>
                <div class="control-group">
                     <label class="control-label"> 用户名：</label>
                         <span class="r">${view.user.username}</span>
                </div>
                <div class="control-group">
                <label class="control-label">真实姓名：</label>
                <span class="r">
                    <input class="inputtext" name="user.realname" id="realname" style="width: 150px" value="${view.user.realname}"
                    maxlength="20" type="text" onblur="this.className='inputtext';"  onfocus="this.className='inputtext2';"/>
                </span>
                </div>
                <div class="control-group">
                <label class="control-label"> 昵称：</label>
                <span class="r"><input
                            class="inputtext" name="user.nickname" id="nickname"
                            style="width: 150px" value="${view.user.nickname }"
                            maxlength="20" type="text"
                            onblur="this.className='inputtext';"
                            onfocus="this.className='inputtext2';"/> </span>
                  </div>
                <div class="control-group">
                <label class="control-label"> 性别：</label>
                    <span class="r">
                        <select id="male" style="width: 8em;" name="user.male">
                        <option value="true" ${view.user.male?"selected='selected'":" "}> 男  </option>
                        <option value="false" ${!view.user.male?"selected='selected'":" "}> 女 </option>
                        </select>
                    </span>
               </label>
                <div class="control-group">
                    <label class="control-label"> 出生日期：</label><span class="r"> <input  class="inputtext" name="user.birthday" id="birthday"
                        style="width: 100px" type="text" value="${view.user.birthday }" style="width:183px"
                        onblur="this.className='inputtext'" onfocus="this.className='inputtext2'"/>&nbsp; <a href="javascript:;">
                    <img id="triggerBirthdayTime"  src="<c:url value='/static/scripts/calendar/img.gif'/>" border="0" align="middle">
                </a> </span>
               </div>
                <div class="control-group">
                    <label class="control-label"> 年龄：</label>
                    <span class="r"><input
                        class="inputtext" name="user.age" id="age"
                        style="width: 100px" value="${view.user.age }"
                        maxlength="20" type="text"
                        onblur="this.className='inputtext';"
                        onfocus="this.className='inputtext2';"/> </span>
               </div>
                <div class="control-group">
                    <label class="control-label"> 血型：</label>
                    <span class="r"> <select
                        id="bloodType" style="width: 8em;" name="user.bloodType">
                    <option value="1" ${view.user.bloodType==1? "selected='selected'":""}>
                        A型
                    </option>
                    <option value="2" ${view.user.bloodType==2? "selected='selected'":""}>
                        B型
                    </option>
                    <option value="3" ${view.user.bloodType==3? "selected='selected'":""}>
                        AB型
                    </option>
                    <option value="4" ${view.user.bloodType==4? "selected='selected'":""}>
                        O型
                    </option>
                </select> </span>
                </div>
                <div class="control-group">
                    <label class="control-label"> 星座：</label>
                    <span class="r"> <select  id="constellation" style="width: 8em;"  name="user.constellation">
                    <option value="1" ${view.user.constellation==1? "selected='selected'":""}>
                        白羊座
                    </option>
                    <option value="2" ${view.user.constellation==2? "selected='selected'":""}>
                        金牛座
                    </option>
                    <option value="3" ${view.user.constellation==3? "selected='selected'":""}>
                        双子座
                    </option>
                    <option value="4" ${view.user.constellation==4?  "selected='selected'":""}>
                        巨蟹座
                    </option>
                    <option value="5" ${view.user.constellation==5? "selected='selected'":""}>
                        狮子座
                    </option>
                    <option value="6" ${view.user.constellation==6?  "selected='selected'":""}>
                        处女座
                    </option>
                    <option value="7" ${view.user.constellation==7? "selected='selected'":""}>
                        天秤座
                    </option>
                    <option value="8" ${view.user.constellation==8? "selected='selected'":""}>
                        天蝎座
                    </option>
                    <option value="9" ${view.user.constellation==9?  "selected='selected'":""}>
                        射手座
                    </option>
                    <option value="10" ${view.user.constellation==10? "selected='selected'":""}>
                        摩羯座
                    </option>
                    <option value="11" ${view.user.constellation==11? "selected='selected'":""}>
                        水瓶座
                    </option>
                    <option value="12" ${view.user.constellation==12? "selected='selected'":""}>
                        双鱼座
                    </option>
                </select> </span>
               </div>
                <div class="control-group">
                    <label class="control-label"> 生肖：</label>
                    <span class="r"> <select
                        id="birthAttrib" style="width: 8em;" name="user.birthAttrib">
                    <option value="1" ${view.user.birthAttrib==1? "selected='selected'":""}>
                        鼠
                    </option>
                    <option value="2" ${view.user.birthAttrib==2?  "selected='selected'":""}>
                        牛
                    </option>
                    <option value="3" ${view.user.birthAttrib==3? "selected='selected'":""}>
                        虎
                    </option>
                    <option value="4" ${view.user.birthAttrib==4? "selected='selected'":""}>
                        兔
                    </option>
                    <option value="5" ${view.user.birthAttrib==5? "selected='selected'":""}>
                        龙
                    </option>
                    <option value="6" ${view.user.birthAttrib==6? "selected='selected'":""}>
                        蛇
                    </option>
                    <option value="7" ${view.user.birthAttrib==7? "selected='selected'":""}>
                        马
                    </option>
                    <option value="8" ${view.user.birthAttrib==8? "selected='selected'":""}>
                        羊
                    </option>
                    <option value="9" ${view.user.birthAttrib==9? "selected='selected'":""}>
                        猴
                    </option>
                    <option value="10" ${view.user.birthAttrib==10? "selected='selected'":""}>
                        鸡
                    </option>
                    <option value="11" ${view.user.birthAttrib==11? "selected='selected'":""}>
                        狗
                    </option>
                    <option value="12" ${view.user.birthAttrib==12? "selected='selected'":""}>
                        猪
                    </option>
                </select> </span>
               </div>
                <div class="control-group">
                    <label class="control-label"> 婚烟状况：</label>
                    <span class="r"> <select
                        id="marital" style="width: 8em;" name="user.marital">
                    <option value="1" ${view.user.marital==1? "selected='selected'":""}>
                        单身
                    </option>
                    <option value="2" ${view.user.marital==2? "selected='selected'":""}>
                        已婚
                    </option>
                    <option value="3" ${view.user.marital==3?  "selected='selected'":""}>
                        恋爱
                    </option>
                    <option value="4" ${view.user.marital==4? "selected='selected'":""}>
                        离异
                    </option>
                </select> </span>
                </div>
                <div class="control-group">
                    <label class="control-label"> 自我介绍：</label>
                    <textarea cols="60" rows="6" id="intro" name="user.intro">${view.user.intro}</textarea>
                 </div>
                <div class="control-group">
                    <label class="control-label"> 爱好：</label>
                    <textarea cols="60" rows="6" id="hobby" name="user.hobby">${view.user.hobby}</textarea>

                </div>
              <span style="padding-left: 85px;"><input type="submit"
                    class="botton" value="保存设置"
                    onMouseOut="this.className='botton';"/>
              </span>


                </s:form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	var MINUTE = 60 * 1000;
	var HOUR = 60 * MINUTE;
	var DAY = 24 * HOUR;

	Calendar.setup( {
		inputField : "birthday",
		button : "triggerBirthdayTime"
	});
</script>
</body>
