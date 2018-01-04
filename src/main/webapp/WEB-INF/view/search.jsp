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
<link href="<%=path%>/css/front/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link rel="stylesheet" href="<%=path%>/css/front/style.css"
	type="text/css" media="all" />
<link href="<%=path%>/css/front/nav.css" rel="stylesheet"
	type="text/css" media="all" />
<script type="text/javascript">
	function submitData(url, mname) {
		var state = false;
		//判断购物车中是否有相同商品数据
		<c:forEach items="${shoppingCartList}" var="shoppingCartBean">
			if ("${shoppingCartBean.mname}" == mname) {
				state = true;
				var sccount = parseInt("${shoppingCartBean.sccount}") + 1;
				var newUrl = url + "&task=update" + "&scid="
						+ ${shoppingCartBean.scid} + "&sccount=" + sccount;
				window.location.href = newUrl;
			}
		</c:forEach>
		//拼接url
		if(state==false){
			var newUrl = url + "&task=add";
			window.location.href = newUrl;
		}
	}
	

</script>
<title>查找结果</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>

<body>
	<jsp:include page="top.jsp"></jsp:include>
	<div class="products">
		<div class="container">
			<div class="products-heading">
				<h3>POPULAR PRODUCTS</h3>
			</div>
			<div class="products-grids">
				<c:forEach items="${list}" var="mcListBean">
					<div class="col-md-3 product-left-grid">
						<div class="product-grid">
							<div class="product-grid-text">
								<a href="<%=path%>/mcItemServletUrl?mid=${mcListBean.mid}"><img
									src="<%=path%>/images/mc_images/${mcListBean.mimg}"
									height="265" /></a>
								<div class="products-grid-info">
									<h3>${mcListBean.mname }</h3>
									<%-- <h4>${mcListBean.mdescription }&nbsp;</h4> --%>
									<div class="price">
										<p>￥ ${mcListBean.mprice }</p>
									</div>
									<div class="like">
										<a
											href="javascript:submitData('<%=path%>/shoppingCartServletUrl?mid=${mcListBean.mid}&mname=${mname}','${mcListBean.mname}')"><img
											src="<%=path%>/images/front_images/like.png" alt="" /></a>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="plus">
									<a href="<%=path%>/mcItemServletUrl?mid=${mcListBean.mid}"><img
										src="<%=path%>/images/front_images/plus.png" alt="" /></a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div>${pageTools}</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
