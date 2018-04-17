<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品详情</title>

    <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${cp}/css/style.css" rel="stylesheet">

    <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${cp}/js/layer.js" type="text/javascript"></script>

    <!--[if lt IE 9]>
    <script src="${cp}/js/html5shiv.min.js"></script>
    <script src="${cp}/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!--导航栏部分-->
<jsp:include page="include/header.jsp"/>

<!-- 中间内容 -->
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-1 col-md-1"></div>
        <div class="col-sm-10 col-md-10">
            <h1>${productDetail.name}</h1>
            <hr/>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-1 col-md-1"></div>
        <div class="col-sm-5 col-md-5">
            <img class="detail-img" src="${cp}/img/${productDetail.id}.jpg">
        </div>
        <div class="col-sm-5 col-md-5 detail-x">
            <table class="table table-striped">
                <tr>
                    <th>商品名称</th>
                    <td>${productDetail.name}</td>
                </tr>
                <tr>
                    <th>商品价格</th>
                    <td>${productDetail.price}</td>
                </tr>
                <tr>
                    <th>商品描述</th>
                    <td>${productDetail.description}</td>
                </tr>
                <tr>
                    <th>商品类别</th>
                    <td>${productDetail.type}</td>
                </tr>
                <tr>
                    <th>商品库存</th>
                    <td>${productDetail.counts}</td>
                </tr>
                <tr>
                    <th>购买数量</th>
                    <td>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-default" onclick="subCounts()">-</button>
                            <button id="productCounts" type="button" class="btn btn-default">1</button>
                            <button type="button" class="btn btn-default" onclick="addCounts(1)">+</button>
                        </div>
                    </td>
                </tr>
            </table>
            <div class="row">
                <div class="col-sm-1 col-md-1 col-lg-1"></div>
                <button class="btn btn-danger btn-lg col-sm-4 col-md-4 col-lg-4"
                        onclick="addToShoppingCar(${productDetail.id})">添加购物车
                </button>
                <div class="col-sm-2 col-md-2 col-lg-2"></div>
                <button class="btn btn-danger btn-lg col-sm-4 col-md-4 col-lg-4"
                        onclick="buyConfirm(${productDetail.id})">购买
                </button>

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-1 col-md-1 col-lg-1"></div>
        <div class="col-sm-10 col-md-10 col-lg-10">
            <hr class="division"/>
            <table class="table evaluationTable" border="0" id="evaluation">
            </table>
            <hr/>
            <div id="inputArea"></div>
        </div>
    </div>
</div>

<!-- 尾部 -->
<jsp:include page="include/foot.jsp"/>
<script type="text/javascript">
    judgeIsLogin();
    listEvaluations();

    function addToShoppingCar(productId) {
        judgeIsLogin();
        var productCounts = document.getElementById("productCounts");
        var counts = parseInt(productCounts.innerHTML);
        var shoppingCar = {};
        shoppingCar.userId = ${currentUser.id};
        shoppingCar.productId = productId;
        shoppingCar.counts = counts;
        var addResult = "";
        $.ajax({
            async: false,
            type: 'PUT',
            url: '${cp}/mall/shopping_car',
            data: JSON.stringify(shoppingCar),
            contentType: 'application/json',
            success: function (result) {
                layer.confirm('前往购物车？', {icon: 1, title: '添加成功', btn: ['前往购物车', '继续浏览']},
                    function () {
                        window.location.href = "${cp}/shopping_car";
                    },
                    function (index) {
                        layer.close(index);
                    }
                );
            },
            error: function (result) {
                layer.alert('添加购物车失败');
            }
        });
    }

    function judgeIsLogin() {
        if ("${currentUser.id}" == null || "${currentUser.id}" == undefined || "${currentUser.id}" == "") {
            window.location.href = "${cp}/login";
        }
    }

    function subCounts() {
        var productCounts = document.getElementById("productCounts");
        var counts = parseInt(productCounts.innerHTML);
        if (counts >= 2)
            counts--;
        productCounts.innerHTML = counts;
    }

    function addCounts() {
        var productCounts = document.getElementById("productCounts");
        var counts = parseInt(productCounts.innerHTML);
        if (counts <${productDetail.counts})
            counts++;
        productCounts.innerHTML = counts;
    }

    function buyConfirm(productId) {
        var address = getUserAddress(${currentUser.id});
        var phoneNumber = getUserPhoneNumber(${currentUser.id});
        var productCounts = document.getElementById("productCounts");
        var counts = parseInt(productCounts.innerHTML);
        var product = getProductById(productId);
        var html = '<div class="col-sm-1 col-md-1 col-lg-1"></div>' +
            '<div class="col-sm-10 col-md-10 col-lg-10">' +
            '<table class="table confirm-margin">' +
            '<tr>' +
            '<th>商品名称：</th>' +
            '<td>' + product.name + '</td>' +
            '</tr>' +
            '<tr>' +
            '<th>商品单价：</th>' +
            '<td>' + product.price + '</td>' +
            '</tr>' +
            '<tr>' +
            '<th>购买数量：</th>' +
            '<td>' + counts + '</td>' +
            '</tr>' +
            '<tr>' +
            '<th>总金额：</th>' +
            '<td>' + counts * product.price + '</td>' +
            '</tr>' +
            '<tr>' +
            '<th>收货地址：</th>' +
            '<td>' + address + '</td>' +
            '</tr>' +
            '<tr>' +
            '<th>联系电话：</th>' +
            '<td>' + phoneNumber + '</td>' +
            '</tr>' +
            '</table>' +
            '<div class="row">' +
            '<div class="col-sm-4 col-md-4 col-lg-4"></div>' +
            '<button class="btn btn-danger col-sm-4 col-md-4 col-lg-4" onclick="addToShoppingRecords(' + productId + ')">确认购买</button>' +
            '</div>' +
            '</div>';
        layer.open({
            type: 1,
            title: '请确认订单信息：',
            content: html,
            area: ['650px', '350px'],
        });
    }

    function getProductById(id) {
        var productResult = "";
        $.ajax({
            async: false, //设置同步
            type: 'GET',
            url: '${cp}/mall/product/' + id + '',
            dataType: 'json',
            success: function (result) {
                productResult = result;
            },
            error: function (result) {
                layer.alert('查询错误');
            }
        });
        return productResult;
    }

    function getUserAddress(id) {
        var address = "";
        $.ajax({
            async: false, //设置同步
            type: 'GET',
            url: '${cp}/mall/user_main/query_user_address_and_phone_number/' + id + '',
            dataType: 'json',
            success: function (result) {
                address = result.address;
            },
            error: function (result) {
                layer.alert('查询错误');
            }
        });
        return address;
    }

    function getUserPhoneNumber(id) {
        var phoneNumber = "";
        $.ajax({
            async: false, //设置同步
            type: 'GET',
            url: '${cp}/mall/user_main/query_user_address_and_phone_number/' + id + '',
            dataType: 'json',
            success: function (result) {
                phoneNumber = result.phoneNumber;
            },
            error: function (result) {
                layer.alert('查询错误');
            }
        });
        return phoneNumber;
    }

    function addToShoppingRecords(productId) {
        judgeIsLogin();
        var productCounts = document.getElementById("productCounts");
        var counts = parseInt(productCounts.innerHTML);
        var shoppingRecord = {};
        shoppingRecord.userId = ${currentUser.id};
        shoppingRecord.productId = productId;
        shoppingRecord.counts = counts;
        $.ajax({
            async: false,
            type: 'PUT',
            url: '${cp}/mall/shopping_record',
            data: JSON.stringify(shoppingRecord),
            contentType: 'application/json',
            success: function (result) {
                if (result) {
                    layer.confirm('前往订单状态？', {icon: 1, title: '购买成功', btn: ['前往订单', '继续购买']},
                        function () {
                            window.location.href = "${cp}/shopping_record";
                        },
                        function (index) {
                            layer.close(index);
                        }
                    );
                } else {
                    layer.alert("库存不足，购买失败")
                }
            },
            error: function (result) {
                layer.alert('购买错误');
            }
        });
    }

    function listEvaluations() {
        var evaluations = getEvaluations();
        var evaluationTable = document.getElementById("evaluation");
        var html = "";
        for (var i = 0; i < evaluations.length; i++) {
            var user = getUserById(evaluations[i].userId);
            html += '<tr>' +
                '<th>' + user.nickName + '</th>' +
                '<td>' + evaluations[i].content + '</td>' +
                '</tr>';
        }
        evaluationTable.innerHTML += html;

        if (getUserProductRecord() == "true") {
            var inputArea = document.getElementById("inputArea");
            html = '<div class="col-sm-12 col-md-12 col-lg-12">' +
                '<textarea class="form-control" rows="4" id="evaluationText"></textarea>' +
                '</div>' +
                '<div class="col-sm-12 col-md-12 col-lg-12">' +
                '<div class="col-sm-4 col-md-4 col-lg-4"></div>' +
                '<button class="btn btn-primary btn-lg evaluationButton col-sm-4 col-md-4 col-lg-4" onclick="addToEvaluation()">评价</button>' +
                '</div>';
            inputArea.innerHTML += html;
        }

    }

    function getUserProductRecord() {
        var results = "";
        var userId = ${currentUser.id};
        var productId = ${productDetail.id};
        $.ajax({
            async: false, //设置同步
            type: 'GET',
            url: '${cp}/mall/shopping_recordquery_user_product_record/' + userId + '/' + productId + '',
            dataType: 'json',
            success: function (result) {
                results = result;
            },
            error: function (result) {
                layer.alert('查询错误');
            }
        });
        return results;
    }

    function getEvaluations() {
        var evaluations = "";
        var product = {};
        product.productId = ${productDetail.id};
        $.ajax({
            async: false, //设置同步
            type: 'GET',
            url: '${cp}/mall/evaluation/query_evaluations/${productDetail.id}',
            data: product,
            dataType: 'json',
            success: function (result) {
                console.log(result);
                evaluations = result;
                return evaluations;
            },
            error: function (result) {
                layer.alert('查询错误');
            }
        });
        return evaluations;
    }

    function getUserById(id) {
        var userResult = "";
        $.ajax({
            async: false, //设置同步
            type: 'GET',
            url: '${cp}/mall/user_main/'+id+'',
            dataType: 'json',
            success: function (result) {
                userResult = result;
            },
            error: function (result) {
                layer.alert('查询错误');
            }
        });
        return userResult;
    }

    function addToEvaluation() {
        var inputText = document.getElementById("evaluationText").value;
        var evaluation = {};
        evaluation.userId = ${currentUser.id};
        evaluation.productId = ${productDetail.id};
        evaluation.content = inputText;
        $.ajax({
            async: false,
            type: 'PUT',
            url: '${cp}/mall/evaluation',
            data: JSON.stringify(evaluation),
            contentType: 'application/json',
            success: function (result) {
                layer.msg("评价成功", {icon: 1});
                window.location.href = "${cp}/product_detail";
            },
            error: function (result) {
                layer.alert('查询用户错误');
            }
        });
    }

</script>
</body>
</html>