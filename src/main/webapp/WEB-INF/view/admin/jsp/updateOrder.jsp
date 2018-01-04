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

<title>修改订单</title>

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
	function checkOMsg() {
		var omsg = orderForm.omsg;
		var span = document.getElementById("omsgSpan");
		if (omsg.value.length>100) {
			omsg.focus();
			span.innerHTML = "&nbsp;*字段过长";
			return false;
		}
		return true;

	}
	function checkOName() {
		var oname = orderForm.oname;
		var span = document.getElementById("onameSpan");
		if (oname.value == '') {
			oname.focus();
			span.innerHTML = "&nbsp;*必填项";
			return false;
		} else if(oname.value.length>10){
			oname.focus();
			span.innerHTML = "&nbsp;*字段过长";
			return false;
			
		}else {
			return true;
		}
	}
	function checkOAddress() {
		var oaddress = orderForm.oaddress;
		var span = document.getElementById("oaddressSpan");
		if (oaddress.value == '') {
			oaddress.focus();
			span.innerHTML = "&nbsp;*必填项";
			return false;
		}  else if(oaddress.value.length>80){
			oaddress.focus();
			span.innerHTML = "&nbsp;*字段过长";
			return false;
			
		}else {
			return true;
		}
	}
	function checkOCode() {
		var ocode = orderForm.ocode;
		var span = document.getElementById("ocodeSpan");
		if (ocode.value == '') {
			ocode.focus();
			span.innerHTML = "&nbsp;*必填项";
			return false;
		}else if(ocode.value.length>10){
			ocode.focus();
			span.innerHTML = "&nbsp;*字段过长";
			return false;
			
		} else {
			return true;
		}
	}
	function checkOPhone() {
		var ophone = orderForm.ophone;
		var span = document.getElementById("ophoneSpan");
		if (ophone.value == '') {
			ophone.focus();
			span.innerHTML = "&nbsp;*必填项";
			return false;
		} else if(ophone.value.length>20){
			ophone.focus();
			span.innerHTML = "&nbsp;*字段过长";
			return false;
			
		}else {
			return true;
		}
	}
	function checkOEmail() {
		var oemail = orderForm.oemail;
		var span = document.getElementById("oemailSpan");
		if (oemail.value == '') {
			oemail.focus();
			span.innerHTML = "&nbsp;*必填项";
			return false;
		} else if(oemail.value.length>30){
			oemail.focus();
			span.innerHTML = "&nbsp;*字段过长";
			return false;
			
		} else {
			span.innerHTML = "&nbsp;*输入正确";
			return true;
		}
	}
	function checkForm() {
		return checkOMsg()&&checkOName() && checkOAddress() && checkOCode() && checkOPhone()
				&& checkOEmail();
	}
</script>
<body>
	<form action="<%=path%>/orderServletUrl?task=updateSubmit"
		method="post" onSubmit="return checkForm()" name="orderForm">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="8" height="8"><img
					src="<%=path%>/admin/jsp/images/index1_28.gif" width="8"
					height="39" /></td>
				<td width="99%"
					background="<%=path%>/admin/jsp/images/index1_40.gif">
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
											href="<%=path%>/tUserServletUrl?task=selectUser"
											class="font2"><strong>注册用户管理</strong></a></td>
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
					src="<%=path%>/admin/jsp/images/index1_43.gif" width="8"
					height="39" /></td>
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
											<table width="100%" border="0" cellpadding="0"
												cellspacing="5" bgcolor="#FFFFFF">
												<tr>
													<td>&nbsp;<a href="<%=path%>/admin/jsp/adminright.jsp"
														class="font1">首页</a> &gt; <a class="font1">订单管理</a> &gt;
														&gt; <a href="<%=path%>/orderServletUrl" class="font1">订单信息管理</a>
														&gt;<a class="font1"><strong> 修改订单信息</strong></a></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>

								<table width="85%" border="0" cellspacing="0" align="center"
									style="font-size:20px">
									<tr>
										<td align="right">订单编号：</td>
										<td><input type="text" style="width:180px" name="oid"
											value="${tOrderBean.oid}" readonly="readonly" /></td>

										<td align="right">用户名：</td>
										<td><input type="text" style="width:180px"
											value="${tOrderBean.tuser}" readonly="readonly" /></td>
									</tr>

									<tr>
										<td align="right">付款方式：</td>
										<td><input type="text" style="width:180px"
											value="${tOrderBean.opaymethod}" readonly="readonly" /></td>
										<td align="right">发货方式：</td>
										<td><input type="text" style="width:180px"
											value="${tOrderBean.osendmethod}" readonly="readonly" /></td>
									</tr>

									<tr>
										<td align="right">商品种类数：</td>
										<td><input type="text" style="width:180px"
											value="${tOrderBean.omctypesize}" readonly="readonly" /></td>

										<td align="right">商品总个数：</td>
										<td><input type="text" style="width:180px"
											value="${tOrderBean.omcsize}" readonly="readonly" /></td>

									</tr>
									<tr>
										<td align="right">订单总金额：</td>
										<td><input type="text" style="width:180px"
											value="${tOrderBean.ototalprice}" readonly="readonly" /></td>
										<td align="right">审核状态：</td>
										<td><input type="text" style="width:180px"
											value="${tOrderBean.ostatus==0?'未审核':'审核通过'}"
											readonly="readonly" /></td>
									</tr>

									<tr>
										<td align="right" rowspan="2">订单反馈：</td>
										<td rowspan="2"><textarea cols="20" rows="10" name="omsg"
												style="width:180px;height: 80px">${tOrderBean.omsg}</textarea><span
											id="omsgSpan"></span></td>

										<td align="right">审核人：</td>
										<td><input type="text" style="width:180px"
											value="${tOrderBean.oeuser}" readonly="readonly" /></td>

									</tr>
									<tr>
										<td align="right">审核时间：</td>
										<td><input type="text" style="width:180px"
											value="${tOrderBean.oedate}" readonly="readonly" /></td>

									</tr>
									<tr>
										<td align="right">收货人：</td>
										<td><input type="text" style="width:180px" name="oname"
											value="${tOrderBean.oname}" /><span id="onameSpan"></span></td>
										<td align="right">收货人住址：</td>
										<td><input type="text" style="width:180px"
											name="oaddress" value="${tOrderBean.oaddress}" /><span
											id="oaddressSpan"></span></td>
									</tr>

									<tr>
										<td align="right">收货人邮编：</td>
										<td><input type="text" style="width:180px" name="ocode"
											value="${tOrderBean.ocode}" /><span id="ocodeSpan"></span></td>

										<td align="right">收货人联系电话：</td>
										<td><input type="text" style="width:180px" name="ophone"
											value="${tOrderBean.ophone}" /><span id="ophoneSpan"></span></td>
									</tr>
									<tr>
										<td align="right">收货人email：</td>
										<td><input type="text" style="width:180px" name="oemail"
											value="${tOrderBean.oemail}" /><span id="oemailSpan"></span></td>
									</tr>


								</table>
							</td>
						</tr>
						<tr>
							<td><hr /></td>
						</tr>
						<tr>
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="1"
									bgcolor="#BBD3EB">
									<tr height="27px">
										<th background="<%=path%>/admin/jsp/images/index1_72.gif">商品名称</th>
										<th background="<%=path%>/admin/jsp/images/index1_72.gif">商品数量</th>

									</tr>
									<c:forEach items="${orderItemList}" var="orderItemListBean">
										<tr bgcolor="${vs.count%2==0?'#F7FAFF':''}">
											<td align="center">${orderItemListBean.mname}</td>
											<td align="center">${orderItemListBean.oicount}</td>

										</tr>
									</c:forEach>
								</table>

							</td>
						</tr>
						<tr>

							<td colspan="2" align="center"><input type="submit"
								value="修改" style="height=28px;width=64px;" />&nbsp;&nbsp;&nbsp;
								<a href="javascript:history.back(0);"><input
								type="button" value="取消" style="height=28px;width=64px;" /></a></td>

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
	</form>
</body>
</html>