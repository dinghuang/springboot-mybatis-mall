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

<title>注册失败</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="<%=path%>/css/register/login.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div id="login" class="bor">
		<h1>抱歉，注册失败！</h1>
		<a class="back" href="<%=path%>">返回首页&gt;&gt;</a>
		<div class="theme">
			<p class="success">
				用户名已存在，注册失败！<br />
				<a href="<%=path%>/tUserServletUrl?task=add&state=addTuser">返回重新注册</a>&nbsp;&nbsp;<a
					href="<%=path%>">返回网站首页</a>
			</p>
		</div>
		<br class="clear" />
	</div>
</body>
</html>
