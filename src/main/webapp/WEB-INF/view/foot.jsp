<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>底部</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="<%=path%>/css/front/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link rel="stylesheet" href="<%=path%>/css/front/style.css"
	type="text/css" media="all" />
<link href="<%=path%>/css/front/nav.css" rel="stylesheet"
	type="text/css" media="all" />

</head>
<body>
	<div class="footer">
		<div class="container">
			<div class="col-md-3 stores-grid">
				<div class="stores">
					<h3 style="color: gray">关于商城</h3>
					<ul>
						<li>客服热线: 400 820 8820</li>
						<li>传真: +1 800 658 5784</li>
						<li>E-mail: info@buyshop.com</li>
						<span>
							<li class="drive">商城已向全国2050个区县提供自营</li>
							<li>配送服务，支持货到付款、POS机</li>
							<li>刷卡和售后上门服务</li>
						</span>
					</ul>
				</div>

			</div>
			<div class="col-md-3 blog">
				<div class="stores">
					<h3 style="color: gray">购物指南</h3>
					<ul>
						<li>配送方式</li>
						<li>&nbsp;&nbsp;上门自提</li>
						<li>&nbsp;&nbsp;211限时达</li>
						<li>&nbsp;</li>
						<li>&nbsp;</li>
						<li>支付方式</li>
						<li>&nbsp;&nbsp;货到付款</li>
						<li>&nbsp;&nbsp;在线支付</li>
						<li>&nbsp;&nbsp;分期付款</li>
					</ul>
				</div>
			</div>
			<div class="col-md-3 support">
				<h3 style="color: gray">产品支持</h3>
				<div class="support-grids">
					<div class="support-left">
						<ul>
							<li><a>服务条款</a></li>
							<li><a>常见问题</a></li>
							<li><a>支付问题</a></li>
							<li><a>退款维权</a></li>
							<li><a>订单查询</a></li>
							<li><a>售后服务</a></li>
						</ul>
					</div>
					<div class="support-left support-right">
						<ul>
							<li><a>关于我们</a></li>
							<li><a>联系我们</a></li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
