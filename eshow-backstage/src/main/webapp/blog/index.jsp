<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
         contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<head>
    <title>日志列表</title>
</head>
<body>
<div id="wrapper">

    <%@ include file="/include/left.jsp" %>

    <div id="page-wrapper" class="gray-bg sidebar-content">

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>列表</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="${ctx}">首页</a>
                    </li>
                    <li>
                        <a>新闻</a>
                    </li>
                    <li class="active">
                        <strong>列表</strong>
                    </li>
                </ol>
            </div>
        </div>

        <div class="wrapper wrapper-content animated fadeInRight ecommerce">
            <div class="ibox-content m-b-sm border-bottom">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label" for="product_name">Product Name</label>
                            <input type="text" id="product_name" name="product_name" value="" placeholder="Product Name" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="price">Price</label>
                            <input type="text" id="price" name="price" value="" placeholder="Price" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label class="control-label" for="quantity">Quantity</label>
                            <input type="text" id="quantity" name="quantity" value="" placeholder="Quantity" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="control-label" for="status">Status</label>
                            <select name="status" id="status" class="form-control">
                                <option value="1" selected="">Enabled</option>
                                <option value="0">Disabled</option>
                            </select>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-content">

                            <table class="footable table table-stripped toggle-arrow-tiny default breakpoint footable-loaded" data-page-size="15">
                                <thead>
                                <tr>

                                    <th data-toggle="true" class="footable-visible footable-first-column footable-sortable">Product Name<span class="footable-sort-indicator"></span></th>
                                    <th data-hide="phone" class="footable-visible footable-sortable">Model<span class="footable-sort-indicator"></span></th>
                                    <th data-hide="all" class="footable-sortable" style="display: none;">Description<span class="footable-sort-indicator"></span></th>
                                    <th data-hide="phone" class="footable-visible footable-sortable">Price<span class="footable-sort-indicator"></span></th>
                                    <th data-hide="phone,tablet" class="footable-visible footable-sortable footable-sorted-desc">Quantity<span class="footable-sort-indicator"></span></th>
                                    <th data-hide="phone" class="footable-visible footable-sortable">Status<span class="footable-sort-indicator"></span></th>
                                    <th class="text-right footable-visible footable-last-column" data-sort-ignore="true">Action</th>

                                </tr>
                                </thead>
                                <tbody>






















                                <tr class="footable-even" style="">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 5
                                    </td>
                                    <td class="footable-visible">
                                        Model 5
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $76.00
                                    </td>
                                    <td class="footable-visible">
                                        800
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-primary">Enable</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-odd" style="">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 5
                                    </td>
                                    <td class="footable-visible">
                                        Model 5
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $76.00
                                    </td>
                                    <td class="footable-visible">
                                        800
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-warning">Low stock</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-even" style="">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 10
                                    </td>
                                    <td class="footable-visible">
                                        Model 10
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $43.00
                                    </td>
                                    <td class="footable-visible">
                                        7600
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-primary">Enable</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-odd" style="">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 10
                                    </td>
                                    <td class="footable-visible">
                                        Model 10
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $43.00
                                    </td>
                                    <td class="footable-visible">
                                        7600
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-primary">Enable</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-even" style="">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 7
                                    </td>
                                    <td class="footable-visible">
                                        Model 7
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $32.00
                                    </td>
                                    <td class="footable-visible">
                                        700
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-primary">Enable</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-odd" style="">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 7
                                    </td>
                                    <td class="footable-visible">
                                        Model 7
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $32.00
                                    </td>
                                    <td class="footable-visible">
                                        700
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-danger">Disabled</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-even" style="">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 6
                                    </td>
                                    <td class="footable-visible">
                                        Model 6
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $60.00
                                    </td>
                                    <td class="footable-visible">
                                        6000
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-primary">Enable</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-odd" style="">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 6
                                    </td>
                                    <td class="footable-visible">
                                        Model 6
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $60.00
                                    </td>
                                    <td class="footable-visible">
                                        6000
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-danger">Disabled</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-even" style="">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 8
                                    </td>
                                    <td class="footable-visible">
                                        Model 8
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $86.00
                                    </td>
                                    <td class="footable-visible">
                                        5180
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-primary">Enable</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-odd" style="">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 8
                                    </td>
                                    <td class="footable-visible">
                                        Model 8
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $86.00
                                    </td>
                                    <td class="footable-visible">
                                        5180
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-primary">Enable</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-even" style="">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 9
                                    </td>
                                    <td class="footable-visible">
                                        Model 9
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $97.00
                                    </td>
                                    <td class="footable-visible">
                                        450
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-primary">Enable</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-odd" style="">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 9
                                    </td>
                                    <td class="footable-visible">
                                        Model 9
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $97.00
                                    </td>
                                    <td class="footable-visible">
                                        450
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-primary">Enable</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-even" style="">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 2
                                    </td>
                                    <td class="footable-visible">
                                        Model 2
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $40.00
                                    </td>
                                    <td class="footable-visible">
                                        4300
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-primary">Enable</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-odd" style="">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 2
                                    </td>
                                    <td class="footable-visible">
                                        Model 2
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $40.00
                                    </td>
                                    <td class="footable-visible">
                                        4300
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-primary">Enable</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-even" style="">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 3
                                    </td>
                                    <td class="footable-visible">
                                        Model 3
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $22.00
                                    </td>
                                    <td class="footable-visible">
                                        300
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-warning">Low stock</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-odd" style="display: none;">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 3
                                    </td>
                                    <td class="footable-visible">
                                        Model 3
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $22.00
                                    </td>
                                    <td class="footable-visible">
                                        300
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-danger">Disabled</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-even" style="display: none;">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 4
                                    </td>
                                    <td class="footable-visible">
                                        Model 4
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $67.00
                                    </td>
                                    <td class="footable-visible">
                                        2300
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-primary">Enable</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-odd" style="display: none;">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 4
                                    </td>
                                    <td class="footable-visible">
                                        Model 4
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $67.00
                                    </td>
                                    <td class="footable-visible">
                                        2300
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-primary">Enable</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-even" style="display: none;">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 1
                                    </td>
                                    <td class="footable-visible">
                                        Model 1
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $50.00
                                    </td>
                                    <td class="footable-visible">
                                        1000
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-primary">Enable</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr><tr class="footable-odd" style="display: none;">
                                    <td class="footable-visible footable-first-column"><span class="footable-toggle"></span>
                                        Example product 1
                                    </td>
                                    <td class="footable-visible">
                                        Model 1
                                    </td>
                                    <td style="display: none;">
                                        It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is
                                        that it has a more-or-less normal distribution of letters, as opposed to using
                                        'Content here, content here', making it look like readable English.
                                    </td>
                                    <td class="footable-visible">
                                        $50.00
                                    </td>
                                    <td class="footable-visible">
                                        1000
                                    </td>
                                    <td class="footable-visible">
                                        <span class="label label-primary">Enable</span>
                                    </td>
                                    <td class="text-right footable-visible footable-last-column">
                                        <div class="btn-group">
                                            <button class="btn-white btn btn-xs">View</button>
                                            <button class="btn-white btn btn-xs">Edit</button>
                                        </div>
                                    </td>
                                </tr></tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="6" class="footable-visible">
                                        <ul class="pagination pull-right"><li class="footable-page-arrow disabled"><a data-page="first" href="#first">«</a></li><li class="footable-page-arrow disabled"><a data-page="prev" href="#prev">‹</a></li><li class="footable-page active"><a data-page="0" href="#">1</a></li><li class="footable-page"><a data-page="1" href="#">2</a></li><li class="footable-page-arrow"><a data-page="next" href="#next">›</a></li><li class="footable-page-arrow"><a data-page="last" href="#last">»</a></li></ul>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>


        </div>


        <div class="footer">
            <div class="pull-right">
                10GB of <strong>250GB</strong> Free.
            </div>
            <div>
                <strong>Copyright</strong> Example Company &copy; 2014-2017
            </div>
        </div>

    </div>

</div>

<%@ include file="/common/scripts.jsp" %>
</body>

