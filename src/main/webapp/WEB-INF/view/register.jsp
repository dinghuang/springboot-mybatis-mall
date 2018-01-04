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
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>会员注册</title>
<link href="<%=path%>/css/register/login.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" language="javascript"
	src='<%=path%>/js/register/reg_new.js'></script>

</head>
<script src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
<script language="javascript">
	function checkTUser() {
		var tuser = userForm.tuser;
		var span = document.getElementById("tuserSpan");
		var regex = /^\w{2,15}$/;
		if (tuser.value == '') {
			tuser.focus();
			span.innerHTML = "&nbsp;*用户名必填";
			return false;
		} else if (!regex.test(tuser.value)) {
			tuser.focus();
			span.innerHTML = "&nbsp;*真实姓名不合法，必须在2个字符以上";
			return false;
		} else {
			return true;
		}
	}
	function checkTpwd() {
		var tpwd = userForm.tpwd;
		var span = document.getElementById("tpwdSpan");
		var regex = /^\w{3,20}$/;
		if (tpwd.value == '') {
			tpwd.focus();
			span.innerHTML = "&nbsp;*密码必填";
			return false;
		} else if (!regex.test(tpwd.value)) {
			tpwd.focus();
			span.innerHTML = "&nbsp;*密码长度不合法，必须在3个字符以上";
			return false;
		} else {
			return true;
		}

	}
	function checkTpwd2() {
		var tpwd2 = userForm.tpwd2;
		var span = document.getElementById("tpwd2Span");
		var tpwd = userForm.tpwd;
		if (tpwd2.value == tpwd.value) {
			return true;
		} else {
			tpwd2.focus();
			span.innerHTML = "&nbsp;*与密码不一致";
			return false;
		}
	}

	function checkTname() {
		var tname = userForm.tname;
		var span = document.getElementById("tnameSpan");
		var regex = /^\w{2,}$/;
		if (tname.value == '') {
			tname.focus();
			span.innerHTML = "&nbsp;*真实姓名必填";
			return false;
		} else if (!regex.test(tname.value)) {
			tname.focus();
			span.innerHTML = "&nbsp;*真实姓名不合法，必须在2个字符以上";
			return false;
		} else {
			return true;
		}
	}
	function checkTbirth() {
		var tbirth = userForm.tbirth;
		var span = document.getElementById("tbirthSpan");
		if (tbirth.value == '') {
			tbirth.focus();
			span.innerHTML = "&nbsp;*出生日期必填";
			return false;
		} else {
			return true;
		}
	}
	function checkTemail() {
		var temail = userForm.temail;
		var span = document.getElementById("temailSpan");
		if (temail.value == '') {
			temail.focus();
			span.innerHTML = "&nbsp;*电子邮箱必填";
			return false;
		} else {
			return true;
		}
	}
	function checkTphone() {
		var tphone = userForm.tphone;
		var span = document.getElementById("tphoneSpan");
		var regex = /^[0-9]*$/;
		if (tphone.value == '') {
			tphone.focus();
			span.innerHTML = "&nbsp;*电话号码必填";
			return false;
		} else if (!regex.test(tphone.value)) {
			tphone.focus();
			span.innerHTML = "&nbsp;*电话号码不合法，必须全为数字";
			return false;
		} else {
			return true;
		}
	}
	function checkTaddress() {
		var taddress = userForm.taddress;
		var span = document.getElementById("taddressSpan");
		if (taddress.value == '') {
			taddress.focus();
			span.innerHTML = "&nbsp;*地址必填";
			return false;
		} else if (taddress.value.length<=2||taddress.value.length>30) {
			taddress.focus();
			span.innerHTML = "&nbsp;*地址长度不合法";
			return false;
		} else {
			return true;
		}
	}
	function checkTcode() {
		var tcode = userForm.tcode;
		var span = document.getElementById("tcodeSpan");
		var regex = /^\d{6}$$/;
		if (tcode.value == '') {
			tcode.focus();
			span.innerHTML = "&nbsp;*邮编必填";
			return false;
		} else if (!regex.test(tcode.value)) {
			tcode.focus();
			span.innerHTML = "&nbsp;*邮编不合法,必须是6为数字";
			return false;
		} else {
			return true;
		}
	}
	function checkForm() {
		return checkTUser() && checkTpwd() && checkTpwd2() && checkTname()
				&& checkTbirth() && checkTemail() && checkTphone()
				&& checkTaddress() && checkTcode();
	}
</script>
<body>
	<div id="login" class="bor">
		<h1>新用户注册</h1>
		<a class="back" href="<%=path%>">返回首页&gt;&gt;</a>
		<div class="theme">
			<form method="post"
				action="<%=path%>/tUserServletUrl?task=addSubmit&state=addTuser"
				onSubmit="return checkForm()" name="userForm">
				<ul>
					<li><span>用户名：</span> <input class="intxt w200" name="tuser"
						type="text" class="pwd_inp" /> <em id="tuserSpan"></em></li>

					<li><span>登陆密码：</span> <input type="password" maxlength="20"
						style="font-family: verdana;" class="intxt w200" name="tpwd" /><em
						id="tpwdSpan"></em></li>

					<li><span>确认密码：</span> <input type="password"
						class="intxt w200" maxlength="20" name="tpwd2" /> <em
						id="tpwd2Span"></em></li>

					<li><span>真实姓名：</span> <input type="text" class="intxt w200"
						name="tname" /><em id="tnameSpan"></em></li>


					<li><span>性别：</span> <input type="radio" value="男" name="tsex"
						checked="checked" />男 <input type="radio" value="女" name="tsex" />女
					</li>
					<li><span>出生日期：</span> <input type="text" class="intxt w200"
						name="tbirth" readonly="readonly" class="Wdate"
						onClick="WdatePicker()" value="" /> <em id="tbirthSpan"></em></li>

					<li><span>电子邮箱：</span> <input type="text" class="intxt w200"
						name="temail" /> <em id="temailSpan"></em></li>

					<li><span>电话号码：</span> <input type="text" class="intxt w200"
						name="tphone" /> <em id="tphoneSpan"></em></li>

					<li><span>住址：</span> <input type="text" class="intxt w200"
						name="taddress" /> <em id="taddressSpan"></em></li>
					<li><span>邮&nbsp;&nbsp;&nbsp;&nbsp;编：</span> <input
						name="tcode" type="text" class="intxt w200" /> <em id="tcodeSpan"></em></li>

					<li><input type="hidden" name="trights" value="2" /> <input
						type="hidden" name="taccount" value="0" /> <input type="hidden"
						name="tregdate" value="${tregdate}" /> <input type="hidden"
						name="tlock" value="0" /> <input type="hidden" name="tlastdate"
						value="${tregdate}" /> <input type="hidden" name="tlogin"
						value="1" /></li>

					<li><span>&nbsp;</span>
						<button type="submit" id="btnSignCheck" class="reg-btn">确定注册</button>
						<a class="regbt" href="<%=path%>/userlogin.jsp" rel="nofollow">已有账号？</a>
					</li>
				</ul>

			</form>
		</div>
		<br class="clear" />
	</div>
</body>
</html>