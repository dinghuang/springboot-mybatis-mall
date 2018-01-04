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

<title>商品信息列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="<%=path%>/admin/jsp/images/style.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
body {
	margin-left: 5px;
	margin-top: 10px;
	margin-right: 5px;
	margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	background-color: #2286C2;
}
</style>
</head>
<script type="text/javascript">
	function subMitData(url) {
		//判断是否选中数据，获得选中数据的值
		var mids = document.getElementsByName("mid");
		var value = null;
		for (var i = 0; i < mids.length; i++) {
			if (mids[i].checked == true) {
				value = mids[i].value;
				break;
			}
		}
		if (value == null) {
			alert('请选择要条目!');
			return;
		}
		//拼接url
		var newUrl = url + "&mid=" + value;
		window.location.href = newUrl;
	}
</script>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="8" height="8"><img
				src="<%=path%>/admin/jsp/images/index1_28.gif" width="8" height="39" /></td>
			<td width="99%" background="<%=path%>/admin/jsp/images/index1_40.gif">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<table width="120" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="5"><img
										src="<%=path%>/admin/jsp/images/index1_35.gif" width="5"
										height="39" /></td>
									<td align="center"
										background="<%=path%>/admin/jsp/images/index1_36.gif"><a
										class="font3"><strong>商品信息管理</strong></a></td>
									<td width="5"><img
										src="<%=path%>/admin/jsp/images/index1_38.gif" width="5"
										height="39" /></td>
								</tr>
							</table>
						</td>
						<td>
							<table width="120" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="5"><img
										src="<%=path%>/admin/jsp/images/index1_29.gif" width="5"
										height="39" /></td>
									<td align="center"
										background="<%=path%>/admin/jsp/images/index1_30.gif"><a
										href="<%=path%>/tUserServletUrl?task=selectUser" class="font2"><strong>注册用户管理</strong></a></td>
									<td width="5"><img
										src="<%=path%>/admin/jsp/images/index1_33.gif" width="5"
										height="39" /></td>
								</tr>
							</table>
						</td>
						<td>
							<table width="120" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="5"><img
										src="<%=path%>/admin/jsp/images/index1_29.gif" width="5"
										height="39" /></td>
									<td align="center"
										background="<%=path%>/admin/jsp/images/index1_30.gif"><a
										href="<%=path%>/orderServletUrl" class="font2"><strong>订单管理</strong></a></td>
									<td width="5"><img
										src="<%=path%>/admin/jsp/images/index1_33.gif" width="5"
										height="39" /></td>
								</tr>
							</table>
						</td>
						<td>
							<table width="120" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="5"><img
										src="<%=path%>/admin/jsp/images/index1_29.gif" width="5"
										height="39" /></td>
									<td align="center"
										background="<%=path%>/admin/jsp/images/index1_30.gif"><a
										href="<%=path%>/rollingServletUrl?task=update" class="font2"><strong>滚动图片管理</strong></a></td>
									<td width="5"><img
										src="<%=path%>/admin/jsp/images/index1_33.gif" width="5"
										height="39" /></td>
								</tr>
							</table>
						</td>
						<td>
							<table width="120" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="5"><img
										src="<%=path%>/admin/jsp/images/index1_29.gif" width="5"
										height="39" /></td>
									<td align="center"
										background="<%=path%>/admin/jsp/images/index1_30.gif"><a
										href="<%=path%>/tUserServletUrl?task=update" class="font2"><strong>个人资料修改</strong></a></td>
									<td width="5"><img
										src="<%=path%>/admin/jsp/images/index1_33.gif" width="5"
										height="39" /></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td width="8" height="8"><img
				src="<%=path%>/admin/jsp/images/index1_43.gif" width="8" height="39" /></td>
		</tr>
		<tr>
			<td background="<%=path%>/admin/jsp/images/index1_45.gif"></td>
			<td bgcolor="#FFFFFF" style="height:490px; vertical-align:top;">
				<table width="100%" border="0" cellspacing="10" cellpadding="0">
					<tr>
						<td>
							<table width="100%" border="0" cellpadding="0" cellspacing="1"
								bgcolor="#C4E7FB">
								<tr>
									<td>
										<table width="100%" border="0" cellpadding="0" cellspacing="5"
											bgcolor="#FFFFFF">
											<tr>
												<td>&nbsp;<a href="<%=path%>/admin/jsp/adminright.jsp"
													class="font1">首页</a> &gt; <a class="font1">商品管理</a> &gt; <a
													class="font1"><strong>商品信息管理</strong></a></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width="100%" border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td>
										<center>
											<form action="<%=path%>/mcServletUrl" method="post"
												name="selectForm">
												商品编号:<input type="text" name="mid" value="${mid}"
													class="text" /> 商品名:<input type="text" name="mname"
													value="${mname}" class="text" /> 品牌名:<input type="text"
													name="sname" value="${sname}" class="text" /> 种类名:<input
													type="text" name="bname" value="${bname}" class="text" />
												<input type="submit" style="height=28px;width=64px;cursor:pointer"
													value="查询" />
											</form>
										</center>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%" border="0" cellpadding="0" cellspacing="1"
											bgcolor="#BBD3EB">
											<tr height="27px">
												<th background="<%=path%>/admin/jsp/images/index1_72.gif">选择</th>
												<th background="<%=path%>/admin/jsp/images/index1_72.gif">商品编号</th>
												<th background="<%=path%>/admin/jsp/images/index1_72.gif">商品名</th>
												<th background="<%=path%>/admin/jsp/images/index1_72.gif">品牌</th>
												<th background="<%=path%>/admin/jsp/images/index1_72.gif">种类</th>
												<th background="<%=path%>/admin/jsp/images/index1_72.gif">是否缺贷</th>
											</tr>
											<c:forEach items="${list}" var="mcListBean" varStatus="vs">
												<tr bgcolor="${vs.count%2==0?'#F7FAFF':''}">
													<td align="center"><input type="radio" name="mid"
														value=${ mcListBean.mid} /></td>
													<td align="center">${mcListBean.mid}</td>
													<td align="center">${mcListBean.mname}</td>
													<td align="center">${mcListBean.sname}</td>
													<td align="center">${mcListBean.bname}</td>
													<td align="center">${mcListBean.mstock==0?'否':'是'}</td>
												</tr>
											</c:forEach>
										</table>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>
										<div>${pageTools}</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td><hr /></td>
					</tr>
					<tr>
						<td><a
							href="javascript:subMitData('<%=path%>/mcServletUrl?task=look')">
								<img src="<%=path%>/admin/jsp/images/index1_88.gif" width="74"
								height="31" border="0" />
						</a>&nbsp; <a href="<%=path%>/mcServletUrl?task=add"> <img
								src="<%=path%>/admin/jsp/images/index1_86.gif" width="74"
								height="31" border="0" /></a>&nbsp; <a
							href="javascript:subMitData('<%=path%>/mcServletUrl?task=update')">
								<img src="<%=path%>/admin/jsp/images/index1_82.gif" width="74"
								height="31" border="0" />
						</a>&nbsp; <a
							href="javascript:subMitData('<%=path%>/mcServletUrl?task=delete')">
								<img src="<%=path%>/admin/jsp/images/index1_84.gif" width="74"
								height="31" border="0" />
						</a></td>
					</tr>
				</table>

			</td>
			<td background="<%=path%>/admin/jsp/images/index1_47.gif"></td>
		</tr>
		<tr>
			<td width="8" height="8"><img
				src="<%=path%>/admin/jsp/images/index1_91.gif" width="8" height="8" /></td>
			<td background="<%=path%>/admin/jsp/images/index1_92.gif"></td>
			<td width="8" height="8"><img
				src="<%=path%>/admin/jsp/images/index1_93.gif" width="8" height="8" /></td>
		</tr>
	</table>
</body>
</html>
