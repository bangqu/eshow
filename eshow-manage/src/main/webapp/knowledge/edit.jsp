<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<s:action name="post!view" var="view" executeResult="false"/>
<head>
    <title>发现赛事修改</title>
    <%--<%@ include file="/common/style/fileupload.jsp" %>--%>
    <%@ include file="/common/style/validate.jsp" %>
</head>
<body>
<!-- banner -->
<c:set var="current">operation</c:set>

<div class="main">


    <div class="home_wrapper ">
        <%@ include file="/include/left.jsp" %>

        <div class="home_content">
            <div class="home_list">
                <ul class="home_navbar clearfix ">
                    <li><span>表单</span></li>
                    <li><span>></span></li>
                    <li><span>添加广告位</span></li>
                </ul>
            </div>
            <div class="home_block">
                <div class="container-fluid">
                    <s:form id="postForm" action="post!update.action" method="post"
                            namespace="">
                        <input type="hidden" name="id" value="${view.post.id}"/>
                        <input type="hidden" name="redirect" value="/post/"/>
                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label><span>*</span>标题：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <input type="text" name="post.title" class="input_md" placeholder="请输入标题">
                            </div>
                        </div>
                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label><span>*</span>内容:</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <textarea class="form-control" name="post.description" id="editor"></textarea>
                            </div>
                        </div>
                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label><span>*</span>类型：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <select name="post.type" data-placeholder="选择类型" style="width:300px;" id="dept"
                                        class="dept_select">
                                    <option value="3">知识</option>
                                </select>
                                <span class="input_tip">请选择类型！</span>
                            </div>
                        </div>
                        <div class="row input_row">
                            <div class="col-xs-2 home_left">
                                <label>标题栏图片：</label>
                            </div>
                            <div class="col-xs-10 home_right">
                                <img id="preview-img" height="110px;" width="110px;"
                                     src="http://7xv6yr.com1.z0.glb.clouddn.com/default.png">

                                <div class="upload_btn">
                                    <input id="upimg" type="hidden" name="post.img"
                                           value="http://7xv6yr.com1.z0.glb.clouddn.com/default.png">
                                    <a class="up_file upload_btn fileinput-button" href="javascript:;">上传图片
                                    </a>
                                    <input id="fileupload" name="file" class="hidden" type="file"/>

                                </div>
                            </div>
                        </div>
                        <div class="row input_row">
                            <div class="col-xs-offset-2 col-xs-10">
                                <input type="button" class="btn btn-primary btn_sm btn_blue btn_dis btn_border"
                                       value="发布"/>
                                <input type="button" class="btn btn-default btn_sm" value="取消"/>
                            </div>
                        </div>
                    </s:form>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="/common/scripts.jsp" %>
    <script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
    <%@ include file="/common/script/fileupload.jsp" %>
    <%@ include file="/common/script/validate.jsp" %>
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="${dll}/manage/scripts/jquery.cxcalendar.min.js"></script>
    <script type="text/javascript" src="${dll}/manage/scripts/jquery.cxcalendar.languages.js"></script>
    <script type="text/javascript" src="${dll}/manage/scripts/chosen.jquery.js"></script>
    <!-- <script type="text/javascript" src="scripts/bootstrap.min.js"></script> -->
    <script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
    <!-- 富文本 -->
    <script src="${dll}/manage/scripts/module.min.js"></script>
    <script src="${dll}/manage/scripts/hotkeys.min.js"></script>
    <script src="${dll}/manage/scripts/uploader.min.js"></script>
    <script src="${dll}/manage/scripts/simditor.min.js"></script>
    <!-- 排序 -->
    <script type="text/javascript" src="${dll}/manage/scripts/jquery.dataTables.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            $("#postForm").validationEngine("attach", {
                onSuccess: function () {
                    upp();
                }
            });
        })

        //展示图片上传
        var url = 'http://up.qiniu.com/';
        var key = "";
        $(".fileinput-button").on("click", function () {
            $("#progress").parent().removeClass("none");
            fileupload.click();
            var time = new Date();
            key = time.getFullYear() + '/' + (time.getMonth() + 1) + '/' + time.getDate() + '/' + Date.parse(time);
            $('#fileupload').fileupload({
                url: url,
                dataType: 'json',
                post: 'POST',
                formData: {
                    key: key,
                    token: "<%=cn.org.eshow.component.qiniu.QiniuUtil.uploadToken("wangqiu")%>"
                },
                done: function (e, data) {
                    $("#preview-img").attr("src", "http://7xv6yr.com2.z0.glb.qiniucdn.com/" + key + "!small.jpg");
                    $("#upimg").val("http://7xv6yr.com2.z0.glb.qiniucdn.com/" + key);
                },
                progressall: function (e, data) {
                    var progress = parseInt(data.loaded / data.total * 100, 10);
                    $('#progress').html(progress + '%');
                }
            }).prop('disabled', !$.support.fileInput)
                    .parent().addClass($.support.fileInput ? undefined : 'disabled');
        });


        if (${current=='operation'}) {
            $("[pr='operation']").addClass("active");
        }

        var ue = UM.getEditor('content', {
            lang: /^zh/.test(navigator.language || navigator.browserLanguage || navigator.userLanguage) ? 'zh-cn' : 'en',
            langPath: UMEDITOR_CONFIG.UMEDITOR_HOME_URL + "lang/",
            focus: true,
        });


        $(document).ready(function(){
            $("#btn_all").click(function(){
                $(":checkbox").attr("checked",true);   //设置所有复选框默认勾选
            });
            $("#btn_none").click(function(){
                $(":checkbox").attr("checked",false);   //设置所有复选框未勾选
            });

            $('#birth_start').cxCalendar({
                type: 'datetime',
                format: 'YYYY-MM-DD HH:mm:ss'
            });
            $('#birth_end').cxCalendar({
                type: 'datetime',
                format: 'YYYY-MM-DD HH:mm:ss'
            });
            $('.data-table').dataTable({
                "searching": false,  //是否允许Datatables开启本地搜索
                "paging": false,  //是否开启本地分页
                "lengthChange": false,  //是否允许用户改变表格每页显示的记录数
                "info": false,   //控制是否显示表格左下角的信息
                "columnDefs": [{
                    "targets": 'nosort',  //列的样式名
                    "orderable": false    //包含上样式名‘nosort’的禁止排序
                }],
                //跟数组下标一样，第一列从0开始，这里表格初始化时，第四列默认降序
                // "order": [4]  //asc升序   desc降序  "order": [[ 3, "desc" ]]默认第四列为降序排列
            });

        });
    </script>
</body>
