<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="user!view" id="view" executeResult="false">
    <s:param name="id">${myid}</s:param>
</s:action>
<head>
    <title>个人用户_修改密码</title>
    <link rel="stylesheet" href="${ctx}/static/styles/setting.css"/>
    <script>
		function validateForm()
		{
			if($("oldPassword").value.length == 0){
		            alert("请输入旧密码！");
		            $("oldPassword").focus();
		            return false;
		        }
		    if($("user.password").value.length == 0){
		            alert("请输入新密码！");
		            $("user.password").focus();
		            return false;
		        }
		    if($("user.confirmPassword").value.length == 0){
		            alert("请再次输入新密码！");
		            $("user.confirmPassword").focus();
		            return false;
		        }
		        if($("user.password").value!= $("user.confirmPassword").value){
		        	alert("确认新密码应和新密码相同！");
		            $("user.confirmPassword").focus();
		            return false;
		        }
		        return true;
		}

    </script>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="setbox clearfix">
            <div class="tabsnav clearfix">
                <a href="<c:url value='/setting/'/>"
                   style="cursor: pointer; text-decoration: none;">个人资料</a>
                <a href="<c:url value='/setting/edit'/>"
                   style="cursor: pointer; text-decoration: none;">完善资料</a>
                <a href="<c:url value='/setting/photo'/>"
                   style="cursor: pointer; text-decoration: none;">修改头像</a>
                <span> 修改密码</span>
            </div>
            <s:form action="user!password.action" id="userForm" method="post"  namespace=""
                    onsubmit="return validateForm();" cssClass="form-horizontal" validate="false">
                <input type="hidden" name="redirect" value="user/logout"/>
                <input type="hidden" name="id" value="${view.user.id}"/>
                <input type="hidden" name="user.username"
                       value="${view.user.username}"/>
                <input type="hidden" name="user.nickname"
                       value="${view.user.nickname}"/>

                <div id="profile_form">

                    <div class="control-group">
                        <label class="control-label" for="oldPassword">旧密码</label>

                        <div class="controls">
                            <input class="inputtext" name="oldPassword"
                                   id="oldPassword" style="width: 150px" maxlength="20"
                                   type="password" onblur="this.className='inputtext';"
                                   onfocus="this.className='inputtext2';"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="password">新密码</label>

                        <div class="controls">
                            <input class="inputtext" name="user.password"
                                   id="password" style="width: 150px" maxlength="20" type="password"
                                   onblur="this.className='inputtext';" onfocus="this.className='inputtext2';"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="confirmPassword">确认密码</label>

                        <div class="controls">
                            <input class="inputtext" name="user.confirmPassword"
                                   id="confirmPassword" style="width: 150px" maxlength="20" type="password"
                                   onblur="this.className='inputtext';" onfocus="this.className='inputtext2';"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for=""> </label>

                        <div class="controls">
                            <input type="submit" class="btn btn-danger" value="保存设置"/>
                        </div>
                    </div>


                </div>
            </s:form>
        </div>

    </div>
</div>
</body>
