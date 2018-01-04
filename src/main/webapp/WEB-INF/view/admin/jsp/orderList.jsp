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

<title>商品订单管理</title>

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
		var oids = document.getElementsByName("oid");
		var value = null;
		for (var i = 0; i < oids.length; i++) {
			if (oids[i].checked == true) {
				value = oids[i].value;
				break;
			}
		}
		if (value == null) {
			alert('请选择要条目!');
			return;
		}
		//拼接url
		var newUrl = url + "&oid=" + value;
		window.location.href = newUrl;
	}
</script>
<script src="<%=path %>/js/My97DatePicker/WdatePicker.js"></script>
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
										src="<%=path%>/admin/jsp/images/index1_29.gif" width="5"
										height="39" /></td>
									<td align="center"
										background="<%=path%>/admin/jsp/images/index1_30.gif"><a
										href="<%=path%>/mcServletUrl" class="font2"><strong>商品信息管理</strong></a></td>
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
										src="<%=path%>/admin/jsp/images/index1_35.gif" width="5"
										height="39" /></td>
									<td align="center"
										background="<%=path%>/admin/jsp/images/index1_36.gif"><a
										class="font3"><strong>订单管理</strong></a></td>
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
													class="font1">首页</a> &gt; <a class="font1">订单信息管理</a> &gt;
													<a class="font1"><strong>订单管理</strong></a></td>
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
											<form action="<%=path%>/orderServletUrl" method="post"
												name="selectForm">
												订单编号:<input type="text" name="oid" value="${oid}" class="text" style="width: 200px"/> 
												用户名:<input type="text" name="tuser" value="${tuser}" class="text" />
												 订单日期:<input type="text" name="oorderdate" value="${oorderdate}" readonly="readonly" class="Wdate" onClick="WdatePicker()"/> 
												 <input type="submit" style="height=28px;width=64px; cursor:pointer" value="查询" />

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
												<th background="<%=path%>/admin/jsp/images/index1_72.gif">订单编号</th>
												<th background="<%=path%>/admin/jsp/images/index1_72.gif">用户名</th>
												<th background="<%=path%>/admin/jsp/images/index1_72.gif">下单时间</th>
												<th background="<%=path%>/admin/jsp/images/index1_72.gif">总金额</th>
												<th background="<%=path%>/admin/jsp/images/index1_72.gif">审核状态</th>
												
											</tr>
											<c:forEach items="${list}" var="tOrderBean" varStatus="vs">
												<tr bgcolor="${vs.count%2==0?'#F7FAFF':''}">
													<td align="center"><input type="radio" name="oid"
														value=${ tOrderBean.oid} /></td>
													<td align="center">${tOrderBean.oid}</td>
													<td align="center">${tOrderBean.tuser}</td>
													<td align="center">${tOrderBean.oorderdate}</td>
													<td align="center">${tOrderBean.ototalprice}</td>
													<c:if test="${tOrderBean.ostatus==0}">
														<td align="center">未审核</td>
													</c:if>
													<c:if test="${tOrderBean.ostatus==1}">
														<td align="center">审核通过</td>
													</c:if>
													<c:if test="${tOrderBean.ostatus==2}">
														<td align="center">审核未通过</td>
													</c:if>
													
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
						<td><a href="javascript:subMitData('<%=path%>/orderServletUrl?task=look')"> <img
								src="<%=path%>/admin/jsp/images/index1_88.gif" width="74"
								height="31" border="0" /></a>&nbsp; <a
							href="javascript:subMitData('<%=path%>/orderServletUrl?task=update')">
								<img src="<%=path%>/admin/jsp/images/index1_82.gif" width="74"
								height="31" border="0" />
						</a>&nbsp; <a
							href="javascript:subMitData('<%=path%>/orderServletUrl?task=delete')">
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
