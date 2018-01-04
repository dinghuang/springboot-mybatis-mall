<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>个人中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="<%=path%>/css/personal/main.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="<%=path%>/css/personal/ec.css" rel="stylesheet"
	type="text/css" media="all" />
</head>
<jsp:include page="../../top.jsp"></jsp:include>
<body class="wide">


	<div class="fr u-4-5" style="position: absolute;top:180px;left:25%;font-family: Microsoft YaHei">
		<div class="myHome-unpay-record">
			<c:if test="${list.size()!=0 }">
				<div
					style="margin-left:50px;margin-top:5px;background-color:#FAFAFA;border:1px solid #ccc;width:800px; min-height: 50px;height: auto;float: left;">
					<ul
						style="margin-left:50px;width:680px;min-height:30px;height: auto;margin-top: 8px;">
						<li
							style="text-align: left;float: left; width: 100px;height: 50px;line-height: 50px;">
							商品</li>
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">商品名
						</li>
						<li
							style="margin-left:50px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">单价
						</li>
						<li
							style="margin-left:50px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">
							数量</li>
						<li
							style="margin-left:50px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">
							小计</li>
					</ul>
				</div>
				<!-- <div style="margin-left:50px;">我的订单</div> -->
				<c:forEach items="${list}" var="tOrderBean" varStatus="vs">
					<div
						style="margin-left:50px;margin-top:5px;border:1px solid #ccc;width:800px; min-height: 70px;height: auto;float: left;font-size: 14px">
						<p style="background-color: #FAFAFA;height: 30px;line-height:30px">&nbsp;&nbsp;&nbsp;&nbsp;${tOrderBean.oorderdate}&nbsp;&nbsp;&nbsp;订单号：${tOrderBean.oid}
							&nbsp;&nbsp;&nbsp;&nbsp;${tOrderBean.ostatus==0?'审核中':'审核通过，已发货'}
						</p>

						<c:forEach items="${itemList}" var="orderItemListBean">
							<c:if test="${orderItemListBean.oid==tOrderBean.oid }">
								<c:forEach items="${mcList}" var="mcBean">
									<c:if test="${orderItemListBean.mname==mcBean.mname }">
										<ul
											style="margin-left:50px;border-bottom: 1px #ccc solid;width:680px;min-height:50px;height: auto;margin-top: 8px;font-size: 13px">
											<li
												style="text-align: left;float: left; width: 100px;height: 50px;">
												<img src="<%=path%>/images/mc_images/${mcBean.mimg }"
												width="60" height="50" />
											</li>
											<li
												style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">${orderItemListBean.mname }
											</li>
											<li
												style="margin-left:50px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">${mcBean.mprice }
											</li>
											<li
												style="margin-left:50px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">
												${orderItemListBean.oicount }</li>
											<li
												style="margin-left:50px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">
												${orderItemListBean.oitotalprice }</li>
										</ul>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>

					</div>
				</c:forEach>
				<div style="margin-left:150px;margin-top:20px;float: left;">${pageTools}</div>
				<div style="height: 150px;float: left;">&nbsp;</div>
			</c:if>
			<c:if test="${list.size()==0 }">
				<div style="margin-left:150px;margin-top:20px;float: left;line-height: 200px;font-size: 20px;">无数据记录,快去<a href="<%=path%>">购物</a>吧!</div>
			</c:if>

		</div>
	</div>




	<div class="fl u-1-5" style="position: absolute;top:180px;left:8%">
		<!--左边菜单 -->
		<div class="mc-menu-area">
			<div class="h">
				<a href="<%=path%>" class="button-go-mc"><span>我的商城</span></a>
			</div>
			<div class="b">
				<ul>
					<li>
						<h3>
							<span>订单中心</span>
						</h3>
						<ol>
							<li id="li-order"><a
								href="<%=path%>/personalServletUrl?task=myorder"><span>我的订单</span></a></li>
							<li id="li-exchange"><a
								href="<%=path%>/personalServletUrl?task=myorder&ostatus=1"><span>已审核的订单</span></a></li>
							<li id="li-groupBuyRecord"><a
								href="<%=path%>/personalServletUrl?task=myorder&ostatus=0"><span>未审核的订单</span></a></li>
						</ol>
					</li>
					<li>
						<h3>
							<span>个人中心</span>
						</h3>
						<ol>
							<li id="li-notification"><a
								href="<%=path%>/personalServletUrl?task=changepwd"><span>密码修改</span></a></li>
							<li id="li-point"><a 
								href="<%=path%>/personalServletUrl?task=information"><span>我的资料</span></a></li>
						</ol>
					</li>
					<li>
						<h3>
							<span>社区中心</span>
						</h3>
						<ol>
							<li id="li-msg"><a href="personalServletUrl?task=exit"><span>退出</span></a></li>
						</ol>
					</li>
				</ul>
			</div>
			<div class="f"></div>
		</div>
	</div>

</body>
</html>
