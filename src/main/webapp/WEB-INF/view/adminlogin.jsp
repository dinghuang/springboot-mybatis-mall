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

<title>µÇÂ½Ò³Ãæ</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="<%=path%>/css/admin/style.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	background-image: url(/css/admin/login1_08.gif);
	background-repeat: repeat-x;
	margin-bottom: 0px;
	font-family: "ËÎÌå";
	font-size: 12px;
	line-height: 1.5;
	font-weight: normal;
	color: #546D87;
	background-color: #BBD9F5;
}
</style>
</head>

<body>
	<form action="<%=path%>/adminLogin" method="post">
		<table width="990" height="650" border="0" align="left"
			cellpadding="0" cellspacing="0">
			<tr>
				<td width="318" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="299" align="right"><img
								src="<%=path%>/images/adminlogin_images/login1_01.gif"
								width="318" height="299" /></td>
						</tr>
						<tr>
							<td height="351" align="right"><img
								src="<%=path%>/images/adminlogin_images/login1_04.gif"
								width="318" height="351" /></td>
						</tr>
					</table>
				</td>
				<td width="366" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="299"
								background="<%=path%>/images/adminlogin_images/login_6.gif"><img
								src="<%=path%>/images/adminlogin_images/login1_02.gif"
								width="366" height="299" /></td>
						</tr>
						<tr>
							<td height="96" valign="top"
								background="<%=path%>/images/adminlogin_images/login_9.gif">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="25%" height="25">&nbsp;</td>
										<td width="48%" valign="top"><label> <input
												name="name" type="text" class="txt" size="25" />
										</label></td>
										<td width="27%" rowspan="2"><input type="image"
											src="<%=path%>/images/adminlogin_images/login_2.gif"
											width="57" height="55" border="0" /></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td><input name="password"
											type="password" class="txt" size="25"  /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="255"
								background="<%=path%>/images/adminlogin_images/login1_07.gif">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="129">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td width="318" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="299" align="left"
								background="<%=path%>/images/adminlogin_images/login1_03.gif">&nbsp;</td>
						</tr>
						<tr>
							<td height="351" align="left"
								background="<%=path%>/images/adminlogin_images/login1_06.gif">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
