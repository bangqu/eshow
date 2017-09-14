<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>上传相册</title>

</head>
<body>
<div class="home_wrapper ">
    <%@ include file="/include/left.jsp" %>
    <div class="home_content">
        <div class="home_list">
            <ul class="home_navbar clearfix ">
                <li><a href="${ctx}/album">相册管理</a></li>
                <li><span>></span></li>
                <li>上传相册</li>
            </ul>
        </div>
        <div class="home_dis">
            <div class="home_block product_cont">
                <div class="add_info clearfix">
                    <p class="add_info_txt fl"><b class="color-red">*</b><span>相册名：</span></p>
                    <input class="add_info_input fl add_info_input1" type="text" placeholder="请输入相册名" value="" name="album.name"/>
                </div>
                <div class="add_info clearfix add_info1">
                    <p class="add_info_txt fl upload_text"><b class="color-red">*</b><span>相册图片：</span></p>
                    <ul class="upload_imgs f1">
                        <li>
                            <img src="../manage/images/upload_img1.png">
                            <div class="album_bd_img">
                                <i class="iconfont icon-shanchu fr"></i>
                            </div>
                        </li>
                        <li>
                            <img src="../manage/images/upload_img1.png">
                            <div class="album_bd_img">
                                <i class="iconfont icon-shanchu fr"></i>
                            </div>
                        </li>
                        <li>
                            <img src="../manage/images/upload_img1.png">
                            <div class="album_bd_img">
                                <i class="iconfont icon-shanchu fr"></i>
                            </div>
                        </li>
                        <li>
                            <img src="../manage/images/upload_img1.png">
                            <div class="album_bd_img">
                                <i class="iconfont icon-shanchu fr"></i>
                            </div>
                        </li>
                        <li>
                            <img src="../manage/images/upload_img1.png">
                            <div class="album_bd_img">
                                <i class="iconfont icon-shanchu fr"></i>
                            </div>
                        </li>
                        <li>
                            <img src="../manage/images/upload_img1.png">
                            <div class="album_bd_img">
                                <i class="iconfont icon-shanchu fr"></i>
                            </div>
                        </li>
                        <li>
                            <img src="../manage/images/upload_img1.png">
                            <div class="album_bd_img">
                                <i class="iconfont icon-shanchu fr"></i>
                            </div>
                        </li>
                        <li>
                            <img src="../manage/images/upload_img1.png">
                            <div class="album_bd_img">
                                <i class="iconfont icon-shanchu fr"></i>
                            </div>
                        </li>
                        <li>
                            <img src="../manage/images/upload_img1.png">
                            <div class="album_bd_img">
                                <i class="iconfont icon-shanchu fr"></i>
                            </div>
                        </li>
                        <li>
                            <img src="../manage/images/upload_img1.png">
                            <div class="album_bd_img">
                                <i class="iconfont icon-shanchu fr"></i>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="add_log_btn">
                    <input type="button" value="上传"/>
                    <button class="btn" onclick="javascript:history.back();">取消</button>
                </div>
            </div>
        </div>
    </div>
</div>
    </div>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
</body>

