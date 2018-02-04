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
<title>后台管理页面</title>
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
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	background-color: #2286C2;
}
</style>
</head>
<frameset rows="74,*" border="0">
	<frame src="<%=path%>/admintop" name="topFrame"
		scrolling="No" id="topFrame" noresize="noresize" />
	<frameset cols="248,*">
		<frame src="<%=path%>adminleft" name="leftFrame"
			scrolling="No" id="leftFrame" noresize="noresize" />
		<frame src="<%=path%>adminright" name="rightFrame"
			id="rightFrame" noresize="noresize" />
	</frameset>
</frameset>

<noframes>
	<body>
	</body>
</noframes>
</html>
