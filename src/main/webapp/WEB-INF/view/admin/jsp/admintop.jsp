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
<title>后台管理页面top</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="<%=path%>/admin/jsp/images/style.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	background-color: #2286C2;
}
</style>
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="74" colspan="2"
				background="<%=path%>/admin/jsp/images/index1_03.gif">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="33%" rowspan="2"><img
							src="<%=path%>/admin/jsp/images/index1_01.gif" width="253"
							height="74" /></td>
						<td width="6%" rowspan="2">&nbsp;</td>
						<td width="61%" height="38" align="right">
							<table width="120" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td align="center"><img
										src="<%=path%>/admin/jsp/images/index1_06.gif" width="16"
										height="16" /></td>
									<td align="center" class="font2"><a class="font2"><strong>帮助</strong></a></td>
									<td align="center"><img
										src="<%=path%>/admin/jsp/images/index1_08.gif" width="16"
										height="16" /></td>
									<td align="center" class="font2"><a class="font2" href="<%=path%>/adminLoginServletUrl?task=exit" target="_top"><strong>退出</strong></a></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="right">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td align="right" class="font2"><a > <img
											src="<%=path%>/admin/jsp/images/index1_13.gif" width="84"
											height="24" border="0" align="absmiddle" /></a>
										&nbsp;|&nbsp;登陆用户：${tUserBean.tuser} &nbsp;|&nbsp;身份： ${tUserBean.trights=='0'?'超级管理员':'管理员'}
										&nbsp;|&nbsp;界面风格： <a ><img
											src="<%=path%>/admin/jsp/images/index1_16.gif" width="48"
											height="24" border="0" align="absmiddle" /></a>&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
