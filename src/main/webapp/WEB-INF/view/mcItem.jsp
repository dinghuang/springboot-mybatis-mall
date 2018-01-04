<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="Content-Language" content="zh-cn">

<title>商品介绍</title>
<jsp:include page="top.jsp"></jsp:include>

<link href="<%=path%>/css/mcItem/ec.css" rel="stylesheet"
	type="text/css">
<link href="<%=path%>/css/mcItem/main.css" rel="stylesheet"
	type="text/css">

</head>
<script type="text/javascript">
	function reduceCount() {
		var sccount = document.getElementById("sccount").value;
		if (sccount > 1) {
			sccount--;
			document.getElementById("sccount").value = sccount;
		}
	}
	function addCount() {
		var sccount = document.getElementById("sccount").value;
		sccount++;
		document.getElementById("sccount").value = sccount;
	}

	$(function() {
		$("#xxxxxx").keyup(
				function() {
					//如果输入非数字，则替换为''，如果输入数字，则在每4位之后添加一个空格分隔
					this.value = this.value.replace(/[^\d]/g, '').replace(
							/(\d{4})(?=\d)/g, "$1 ");
				});
	});

	function submitData(url, mname) {
		var state = false;
		var sccount = parseInt(document.getElementById("sccount").value);
		//判断购物车中是否有相同商品数据
		<c:forEach items="${shoppingCartList}" var="shoppingCartBean">
		if ("${shoppingCartBean.mname}" == mname) {
			state = true;
			sccount = sccount + parseInt("${shoppingCartBean.sccount}");
			var newUrl = url + "&task=update" + "&scid="
					+ ${shoppingCartBean.scid} + "&sccount=" + sccount;
			window.location.href = newUrl;
		}
		</c:forEach>
		//拼接url
		if (state == false) {
			var newUrl = url + "&task=add"+"&sccount=" + sccount;
			window.location.href = newUrl;
		}
	}
	
</script>

<body class="wide detail">

	<div class="hr-10"></div>
	<div class="layout" style="width: 80%;">
		<!--商品简介 -->
		<div class="pro-summary-area clearfix">
			<div class="right-area">
				<!--商品简介-属性 -->
				<div class="pro-property-area clearfix">
					<div class="pro-meta-area">
						<h1 id="pro-name">${ mcListBean.mname }</h1>
						<!-- 插入 商品简介-广告语-->
						<div class="pro-slogan" id="skuPromWord">${ mcListBean.mdescription }</div>
						<div class="hr-10"></div>
						<div class="line"></div>
						<div class="pro-price">
							<span id="pro-price"> <label>商&nbsp;城&nbsp;&nbsp;价：</label>
								<b>￥&nbsp;${ mcListBean.mprice }</b></span>
						</div>
						<div class="pro-coding">
							<label>编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</label> <span
								id="pro-sku-code">${ mcListBean.mid }</span>
						</div>
						<div class="pro-freight">
							<label>运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费：</label>
							&nbsp;&nbsp;免运费
						</div>
						<div class="pro-service">
							<label>服&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务：</label>
							由商城负责发货，并提供售后服务
						</div>
						<div class="hr-10"></div>
						<div class="line"></div>
						<div class="hr-15"></div>

						<!-- 商品简介-SKU 
						<div id="pro-skus" class="pro-sku-area">
							<dl class="clearfix pro-sku-text">
								<dt>选择制式：</dt>
								<dd>
									<ol>
										<li class="tac pointer attr5514 attr5516 selected"
											data-attrname="制式" data-attrid="5514,5516"
											data-skuid="4328,4329">
											<div class="sku">
												<a title="移动/联通双4G版">移动/联通双4G版</a><s></s>
											</div>
										</li>
									</ol>
								</dd>
							</dl>

						</div> -->
						<!-- 20131215-商品简介-购买数量-start -->
						<div id="pro-quantity-area" class="pro-stock-area" style="margin-top: 20px">
							<dl class="clearfix">
								<dt>购买数量：</dt>
								<dd>
									<img src="<%=path%>/images/pay_images/reduce.jpg" name="reduce"
										onclick="reduceCount()" width="15" height="15" border="0"
										style="cursor:pointer" />&nbsp;&nbsp; <input type="text"
										style="width: 50px" maxlength="4"
										onkeyup="value=value.replace(/[^\d]/g,'')" id="sccount"
										value="1" />&nbsp;&nbsp; <img
										src="<%=path%>/images/pay_images/add.jpg" name="add"
										onclick=" addCount()" width="15" height="15" border="0"
										style="cursor:pointer" />
								</dd>
							</dl>
						</div>

						<div id="pro-select-sku" class="pro-selected"
							style="margin-top: 50px;">
							您选择了<b> ${mcListBean.mname }</b>
						</div>

						<div>
							<a href="javascript:submitData('<%=path%>/shoppingCartServletUrl?mid=${mcListBean.mid}','${mcListBean.mname}')"
								class="button-add-cart button-style-1"><span>加入购物车</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="left-area">
		<div class="pro-gallery-area">
			<div class="pro-gallery-img">
				<div style="top:50px;z-index:300;">
					<img style="display: block;"
						src="<%=path%>/images/mc_images/${mcListBean.mimg}" />
				</div>
			</div>
		</div>
	</div>

</body>
</html>