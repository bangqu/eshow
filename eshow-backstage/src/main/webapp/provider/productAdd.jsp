<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<head>
    <title>添加商品</title>
    <%@ include file="/common/style/validate.jsp" %>
</head>
<body>
<div class="home_wrapper ">
    <%@ include file="/include/providerLeft.jsp" %>
    <div class="home_content">
        <div class="home_list">
            <ul class="home_navbar clearfix ">
                <li><a href="${ctx}/">首页概况</a></li>
                <li><span>></span></li>
                <li><a href="">供应商管理</a></li>
            </ul>
        </div>

        <div class="home_block clearfix">
            <div class="sort_cond">

    <div class="form-comm">

        <form class="form-horizontal">
                <div class="form-group">
                    <label  class="col-sm-2 control-label"><Span class="color-danger">*</Span> 供应商名称</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label"><Span class="color-danger">*</Span> 详细说明</label>
                    <div class="col-sm-10">
                         <textarea class="form-control" rows="3"></textarea>
                    </div>
                </div>
    <div class="form-group">
            <label  class="col-sm-2 control-label"><Span class="color-danger">*</Span> 商品价格</label>
            <div class="col-sm-2">
            <input type="text" class="form-control" id="">
            </div>
    </div>
    <div class="form-group">
    <label  class="col-sm-2 control-label"><Span class="color-danger">*</Span> 商品分类</label>
    <div class="col-sm-2">
    <select class="form-control">
    <option>1</option>
    <option>2</option>
    <option>3</option>
    <option>4</option>
    <option>5</option>
    </select>
    </div>
    <div class="col-sm-2">
    <select class="form-control">
    <option>1</option>
    <option>2</option>
    <option>3</option>
    <option>4</option>
    <option>5</option>
    </select>
    </div>
    </div>

    <div class="form-group">
    <label  class="col-sm-2 control-label"><Span class="color-danger">*</Span> 剩余库存</label>
    <div class="col-sm-2">
    <input type="text" class="form-control" id="">
    </div>
    </div>

    <div class="form-group">
    <label  class="col-sm-2 control-label"><Span class="color-danger">*</Span> 单位</label>
    <div class="col-sm-2">
    <input type="text" class="form-control" id="">
    </div>
    </div>


    <div class="form-group">
    <label  class="col-sm-2 control-label"><Span class="color-danger">*</Span> 运费</label>
    <div class="col-sm-2">
        <input type="text" class="form-control" id="">
    </div>
    </div>

    <div class="form-group">
    <label  class="col-sm-2 control-label"><Span class="color-danger">*</Span> 商品缩略图</label>
    <div class="col-sm-6 smimg">

    <p> <img src="https://img10.360buyimg.com/n2/jfs/t3229/256/2993312408/397759/329d47ae/57ea0b0fN3e5e0ec2.jpg"></p>
    <a href="" class="btn btn-info btn-xs margin-sm-top">+ 上传</a>
    <p class="color-gray tip">注：单列和双列布局使用的图片，尺寸为150*150像素，格式为jpg、png，图片大小不可大于1M。</p>
    </div>
    </div>


    <div class="form-group">
    <label  class="col-sm-2 control-label"><Span class="color-danger">*</Span> 商品介绍图</label>
    <div class="col-sm-6 ">
        <ul class="upimgs">
            <li>
            <img src="https://img10.360buyimg.com/n2/jfs/t3229/256/2993312408/397759/329d47ae/57ea0b0fN3e5e0ec2.jpg">
            <i>x</i>
            </li>
            <li>
                <img src="https://img10.360buyimg.com/n2/jfs/t3229/256/2993312408/397759/329d47ae/57ea0b0fN3e5e0ec2.jpg">
                <i>x</i>
            </li>
            <li>
                <a href="">+</a>
            </li>
        </ul>

    <p class="color-gray tip">注：单列和双列布局使用的图片，尺寸为150*150像素，格式为jpg、png，图片大小不可大于1M。</p>
    </div>
    </div>

    <div class="form-group">
    <label  class="col-sm-2 control-label"><Span class="color-danger">*</Span> 商品详情图</label>
    <div class="col-sm-6 ">
    <ul class="upimgs">
    <li>
    <img src="https://img10.360buyimg.com/n2/jfs/t3229/256/2993312408/397759/329d47ae/57ea0b0fN3e5e0ec2.jpg">
    <i>x</i>
    </li>
    <li>
    <img src="https://img10.360buyimg.com/n2/jfs/t3229/256/2993312408/397759/329d47ae/57ea0b0fN3e5e0ec2.jpg">
    <i>x</i>
    </li>
    <li>
    <a href="">+</a>
    </li>
    </ul>

    <p class="color-gray tip">注：单列和双列布局使用的图片，尺寸为150*150像素，格式为jpg、png，图片大小不可大于1M。</p>
    </div>
    </div>


    <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
    <button type="submit" class="btn btn-info">发 布</button>
    </div>
    </div>

        </form>
    </div>

            </div>
        </div>
    </div>
</div>
<%@ include file="/common/scripts.jsp" %>
<script type="text/javascript" src="${dll}/manage/scripts/js.js"></script>
<script type="text/javascript" src="${dll}/layer/layer.js"></script>
<%@ include file="/common/script/validate.jsp" %>
<script type="text/javascript">

</script>
</body>

