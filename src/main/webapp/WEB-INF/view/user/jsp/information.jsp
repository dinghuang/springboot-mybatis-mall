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
<script src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
<script language="javascript">
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
			span.innerHTML = "&nbsp;*输入正确";
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
			span.innerHTML = "&nbsp;*输入正确";
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
			span.innerHTML = "&nbsp;*输入正确";
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
			span.innerHTML = "&nbsp;*输入正确";
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
		} else if (taddress.value.length<2||taddress.value.length>30) {
			taddress.focus();
			span.innerHTML = "&nbsp;*地址长度不合法";
			return false;
		} else {
			span.innerHTML = "&nbsp;*输入正确";
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
			span.innerHTML = "&nbsp;*输入正确";
			return true;
		}
	}
	function checkForm() {
		return checkTname() && checkTbirth() && checkTemail() && checkTphone()
				&& checkTaddress() && checkTcode();
	}
</script>
<jsp:include page="../../top.jsp"></jsp:include>
<body class="wide">

	<div class="fr u-4-5"
		style="position: absolute;top:180px;left:25%;font-family: Microsoft YaHei">
		<div class="myHome-unpay-record">
			<div
				style="margin-left:50px;border:1px solid #ccc;margin-top:5px;width:800px; min-height: 70px;height: auto;float: left;font-size: 14px">
				<form action="<%=path%>/personalServletUrl?task=informationSubmit"
					method="post" onSubmit="return checkForm()" name="userForm">
					<ul
						style="margin-left:50px;width:680px;min-height:50px;height: auto;margin-top: 8px;font-size: 13px">
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">用户名：

						</li>
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">
							<input type="text" value="${tUserBean.tuser}" readonly="readonly"
							style="border:0px;text-align:center" />
						</li>

					</ul>
					<ul
						style="margin-left:50px;width:680px;min-height:50px;height: auto;margin-top: 8px;font-size: 13px">
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">账户余额：

						</li>
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">
							<input type="text" value="${tUserBean.taccount}"
							readonly="readonly" style="border:0px ;text-align:center" />
						</li>

					</ul>
					<ul
						style="margin-left:50px;width:680px;min-height:50px;height: auto;margin-top: 8px;font-size: 13px">
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">姓名：

						</li>
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">
							<input type="text" value="${tUserBean.tname}" maxlength="10"
							style="text-align:center" name="tname" />
						</li>
						<li
							style="margin-left:70px;text-align: left;float: left;width: 200px;height: 50px;line-height: 50px;">
							<span id="tnameSpan"></span>
						</li>

					</ul>
					<ul
						style="margin-left:50px;width:680px;min-height:50px;height: auto;margin-top: 8px;font-size: 13px">
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">性别：
						</li>
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="tsex" value="男"
							${tUserBean.tsex=="男"?'checked':'' } />&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="radio" name="tsex" value="女"
							${tUserBean.tsex=="女"?'checked':'' } />女
						</li>

					</ul>
					<ul
						style="margin-left:50px;width:680px;min-height:50px;height: auto;margin-top: 8px;font-size: 13px">
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">出生日期：

						</li>
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">
							<input type="text" value="${tUserBean.tbirth}" name="tbirth"
							readonly="readonly" class="Wdate" onClick="WdatePicker()"
							style="height: 50px;text-align:center" />
						</li>
						<li
							style="margin-left:70px;text-align: left;float: left;width: 200px;height: 50px;line-height: 50px;">
							<span id="tbirthSpan"></span>
						</li>

					</ul>
					<ul
						style="margin-left:50px;width:680px;min-height:50px;height: auto;margin-top: 8px;font-size: 13px">
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">邮箱：

						</li>
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">
							<input type="text" value="${tUserBean.temail}" name="temail"
							maxlength="30" style="text-align:center" />
						</li>
						<li
							style="margin-left:70px;text-align: left;float: left;width: 200px;height: 50px;line-height: 50px;">
							<span id="temailSpan"></span>
						</li>

					</ul>
					<ul
						style="margin-left:50px;width:680px;min-height:50px;height: auto;margin-top: 8px;font-size: 13px">
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">电话：

						</li>
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">
							<input type="text" value="${tUserBean.tphone}" name="tphone"
							maxlength="15" style="text-align:center" />
						</li>
						<li
							style="margin-left:70px;text-align: left;float: left;width: 200px;height: 50px;line-height: 50px;">
							<span id="tphoneSpan"></span>
						</li>

					</ul>
					<ul
						style="margin-left:50px;width:680px;min-height:50px;height: auto;margin-top: 8px;font-size: 13px">
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">住址：

						</li>
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">
							<input type="text" value="${tUserBean.taddress}" name="taddress"
							maxlength="100" style="text-align:center" />
						</li>
						<li
							style="margin-left:70px;text-align: left;float: left;width: 200px;height: 50px;line-height: 50px;">
							<span id="taddressSpan"></span>
						</li>

					</ul>
					<ul
						style="margin-left:50px;width:680px;min-height:50px;height: auto;margin-top: 8px;font-size: 13px">
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">邮编：

						</li>
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">
							<input type="text" value="${tUserBean.tcode}" name="tcode"
							maxlength="10" style="text-align:center" />
						</li>
						<li
							style="margin-left:70px;text-align: left;float: left;width: 200px;height: 50px;line-height: 50px;">
							<span id="tcodeSpan"></span>
						</li>

					</ul>
					<ul
						style="margin-left:50px;width:680px;min-height:50px;height: auto;margin-top: 8px;font-size: 13px">
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">上次登录：

						</li>
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 50px;line-height: 50px;">
							<input type="text" value="${tUserBean.tlastdate}"
							readonly="readonly" style="border:0px;text-align:center" />
						</li>

					</ul>
					<ul
						style="margin-left:100px;width:680px;min-height:30px;height: auto;margin-top: 8px;font-size: 13px">

						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 30px;line-height: 30px;">
							<input type="submit" value="修改" style="height:30px;width:64px;" />&nbsp;&nbsp;&nbsp;

						</li>
						<li
							style="margin-left:30px;text-align: left;float: left;width: 100px;height: 30px;line-height: 30px;">

							<!-- <Button id="cancel" onclick="javascript:history.back();"
								style="height:30px;width:64px;">取消</button> -->
								<a href="personalServletUrl?task=informationCancel"><input type="button" value="取消" style="height:30px;width:64px;" /></a>
						</li>

					</ul>
				</form>
			</div>

			<div style="margin-left:150px;height:100px;float: left;"></div>

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
