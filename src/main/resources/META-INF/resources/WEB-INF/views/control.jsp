<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>校园购物平台</title>
    <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${cp}/css/style.css" rel="stylesheet">

    <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${cp}/js/ajaxfileupload.js" type="text/javascript"></script>
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
        <!-- 控制栏 -->
        <div class="col-sm-3 col-md-2 sidebar sidebar-1">
            <ul class="nav nav-sidebar">
                <li class="list-group-item-diy"><a href="#section1">查看所有用户<span class="sr-only">(current)</span></a>
                </li>
                <li class="list-group-item-diy"><a href="#section2">查看所有商品</a></li>
                <li class="list-group-item-diy"><a href="#section3">添加商品</a></li>
            </ul>
        </div>
        <!-- 控制内容 -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="col-md-12">
                <hr/>
                <h1><a name="section1">用户信息</a></h1>
                <hr/>
                <table class="table table-hover center" id="userTable">
                </table>
            </div>

            <div class="col-md-12">
                <hr/>
                <h1><a name="section2">商品信息</a></h1>
                <hr/>
                <div class="col-lg-12 col-md-12 col-sm-12" id="productArea"></div>
                <br/>
            </div>

            <div class="col-md-12">
                <hr/>
                <h1><a name="section3">添加商品</a></h1>
                <hr/>
                <div class="col-sm-offset-2 col-md-offest-2">
                    <!-- 表单输入 -->
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="productName" class="col-sm-2 col-md-2 control-label">商品名称</label>
                            <div class="col-sm-6 col-md-6">
                                <input type="text" class="form-control" id="productName" placeholder="商品名称"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productDescribe" class="col-sm-2 col-md-2 control-label">商品描述</label>
                            <div class="col-sm-6 col-md-6">
                                <textarea type="text" class="form-control" id="productDescribe"
                                          placeholder="商品描述"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="keyWord" class="col-sm-2 col-md-2 control-label">关键词</label>
                            <div class="col-sm-6 col-md-6">
                                <textarea type="text" class="form-control" id="keyWord" placeholder="关键词"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productPrice" class="col-sm-2 col-md-2 control-label">商品价格</label>
                            <div class="col-sm-6 col-md-6">
                                <input type="text" class="form-control" id="productPrice" placeholder="1"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productCount" class="col-sm-2 col-md-2 control-label">商品数量</label>
                            <div class="col-sm-6 col-md-6">
                                <input type="text" class="form-control" id="productCount" placeholder="1"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productType" class="col-sm-2 col-md-2 control-label">商品类别</label>
                            <div class="col-sm-6 col-md-6">
                                <select name="productType" class="form-control" id="productType">
                                    <option value="衣服配饰">衣服配饰</option>
                                    <option value="数码产品">数码产品</option>
                                    <option value="书籍办公">书籍办公</option>
                                    <option value="游戏周边">游戏周边</option>
                                    <option value="生活用品">生活用品</option>
                                    <option value="化妆用品">化妆用品</option>
                                    <option value="运动用品">运动用品</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productImgUpload" class="col-sm-2 col-md-2 control-label" accept="image/jpg">商品图片</label>
                            <div class="col-sm-6 col-md-6">
                                <input name="productImgUpload" type="file" id="productImgUpload"/>
                                <p class="help-block">上传的图片大小应为280*160大小</p>
                            </div>
                            <%--<button class="btn btn-primary col-sm-2 col-md-2" onclick="fileUpload()">上传图片</button>--%>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-6" id="imgPreSee">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-6">
                                <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="addProduct()">
                                    添加商品
                                </button>
                            </div>
                        </div>
                    </div>
                    <br/>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 尾部 -->
<jsp:include page="include/foot.jsp"/>
<script type="text/javascript">

    var loading = layer.load(0);
    listAllUser();
    listAllProduct();
    layer.close(loading);
    //列出所有用户
    function listAllUser() {
        var userTable = document.getElementById("userTable");
        var allUser = getAllUsers();
        userTable.innerHTML = '<tr>' +
            '<th> 用户ID </th>' +
            '<th> 用户名</th>' +
            '<th> 昵称</th>' +
            '<th> 邮箱</th>' +
            '<th> 是否删除</th>' +
            '</tr>';
        var html = "";
        for (var i = 0; i < allUser.length; i++) {
            html += '<tr>' +
                '<td>' + allUser[i].id + '</td>' +
                '<td>' + allUser[i].name + '</td>' +
                '<td>' + allUser[i].nickName + '</td>' +
                '<td>' + allUser[i].email + '</td>' +
                '<td>' +
                '<button class="btn btn-primary btn-sm" type="submit" onclick="deleteUser(' + allUser[i].id + ')">删除</button>' +
                '</td>' +
                '</tr>';
        }
        userTable.innerHTML += html;
    }

    function getAllUsers() {
        var allUsers = "";
        $.ajax({
            async: false, //设置同步
            type: 'GET',
            url: '${cp}/mall/user_main',
            dataType: 'json',
            success: function (result) {
                allUsers = result;
            },
            error: function (resoult) {
                layer.alert('查询所有用户错误');
            }
        });
        return allUsers;
    }


    function listAllProduct() {
        var productArea = document.getElementById("productArea");
        var allProduct = getAllProducts();
        var html = "";
        productArea.innerHTML = '';
        for (var i = 0; i < allProduct.length; i++) {
            var imgURL = "${cp}/img/" + allProduct[i].id + ".jpg";
            html += '<div class="col-sm-4 col-md-4 pd-5">' +
                '<div class="boxes">' +
                '<div class="big bigimg">' +
                '<img src="' + imgURL + '">' +
                '</div>' +
                '<p class="font-styles center">' + allProduct[i].name + '</p>' +
                '<p class="pull-right">价格：' + allProduct[i].price + '</p>' +
                '<p class="pull-left">库存：' + allProduct[i].counts + '</p>' +
                '<div class = "row">' +
                '<button class="btn btn-primary delete-button" type="submit" onclick="deleteProduct(' + allProduct[i].id + ')">删除商品</button>' +
                '</div>' +
                '</div>' +
                '</div>';
        }
        productArea.innerHTML += html;
    }
    //列出所有商品

    function getAllProducts() {
        var allProducts = null;
        var nothing = {};
        $.ajax({
            async: false, //设置同步
            type: 'GET',
            url: '${cp}/mall/product/query_products',
            data: nothing,
            dataType: 'json',
            success: function (result) {
                allProducts = result;
            },
            error: function (resoult) {
                layer.alert('查询所有商品错误');
            }
        });
        return allProducts;
    }

    function deleteUser(id) {
        $.ajax({
            async: false,
            type: 'DELETE',
            url: '${cp}/mall/user_main/' + id + '',
            dataType: 'json',
            success: function (result) {
                if (!result) {
                    layer.alert("删除用户出错");
                }
            },
            error: function (result) {
                layer.alert('查询用户错误');
            }
        });

        listAllUser()
    }

    function deleteProduct(id) {
        $.ajax({
            async: false,
            type: 'DELETE',
            url: '${cp}/mall/product/' + id + '',
            dataType: 'json',
            success: function (result) {
                layer.msg("删除成功", {icon: 1});
            },
            error: function (result) {
                layer.alert('用户正在使用此商品，不能删除');
            }
        });
        listAllProduct();
    }

    function addProduct() {
        var loadings = layer.load(0);
        var product = {};
        product.name = document.getElementById("productName").value;
        product.description = document.getElementById("productDescribe").value;
        // product.accessCode = document.getElementById("accessCode").value;
        product.keyWord = document.getElementById("keyWord").value;
        product.price = document.getElementById("productPrice").value;
        product.counts = document.getElementById("productCount").value;
        product.type = document.getElementById("productType").value;
        $.ajax({
            async: false,
            type: 'PUT',
            url: '${cp}/mall/product',
            data: JSON.stringify(product),
            contentType: 'application/json',
            success: function (result) {
                fileUpload();
                layer.msg('添加商品成功', {icon: 1, time: 1000});
                layer.close(loadings);
                listAllProduct();
            },
            error: function (result) {
                layer.alert('添加商品失败');
            }
        });
    }

    function fileUpload() {
        var name = document.getElementById("productName").value;
        $.ajaxFileUpload({
                url: '${cp}/mall/product/upload?name=' + name,
                secureuri: false,
                fileElementId: 'productImgUpload',
                type: 'POST',
                dataType: 'text',
                success: function (result) {
                    layer.msg("图片上传成功", {icon: 1});
                    window.location.href = "${cp}/control";
                },
                error: function (result) {
                    layer.msg("图片上传失败", {icon: 0});
                }
            }
        );
    }
</script>
</body>
</html>