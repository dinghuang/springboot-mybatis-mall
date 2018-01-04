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
<title>修改商品信息</title>
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
<script src="<%=path%>/admin/js/My97DatePicker/WdatePicker.js"></script>
<script language="javascript">
	//定义一个全局的数组
	var arr = new Array();
	<c:forEach items="${smallMcList}" var="smallMcBean" varStatus="vs">
	arr[${vs.index}] = new Array(${smallMcBean.sid}, "${smallMcBean.sname}",
			${smallMcBean.bid});
	</c:forEach>
	
	function testChange(fileImage) {
		//document.all.imgId.src = filePath;
		//获得浏览器的版本
		var browserVersion = window.navigator.userAgent.toUpperCase();
		var imageRegex = /^(jpg|gif|png|bmp|JPG|GIF|BMP|PNG){1}$/;
		var fileValue = fileImage.value;
		if (fileValue == '') {
			return;
		}
		var ext = fileValue.substring(fileValue.lastIndexOf(".") + 1);
		if (!imageRegex.test(ext)) {
			alert("附件文件格式错误!必须为jpg|gif|png|bmp格式的图片哦!");
			fileImage.value = "";
			if (browserVersion.indexOf("MSIE") > -1) {
				//兼容低版本的IE
				fileImage.select();
				document.selection.clear();
			}
			//fileImage.outerHTML = fileImage.outerHTML;
			return;
		}

		if (fileImage.files) {//兼容chrome、火狐7+、360浏览器5.5+等，应该也兼容ie10，HTML5实现预览
			if (window.FileReader) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById("imgId").setAttribute("src",
							e.target.result);
				};
				reader.readAsDataURL(fileImage.files[0]);
			} else if (browserVersion.indexOf("SAFARI") > -1) {
				alert("不支持Safari浏览器6.0以下版本的图片预览!");
			} else {
				alert("不支持您当前使用的浏览器的图片预览!");
			}
		} else if (browserVersion.indexOf("MSIE") > -1) {//ie、360低版本预览
			if (browserVersion.indexOf("MSIE 6") > -1) {//ie6
				document.getElementById('imgId').setAttribute("src",
						fileImage.value);
			} else {
				alert("抱歉，您使用的浏览器版本太低，暂不支持您的浏览器的图片预览功能!");
			}
		} else if (browserVersion.indexOf("FIREFOX") > -1) {//firefox
			var firefoxVersion = parseFloat(browserVersion.toLowerCase().match(
					/firefox\/([\d.]+)/)[1]);
			if (firefoxVersion < 7) {//firefox7以下版本
				document.getElementById('imgId').setAttribute("src",
						fileImage.files[0].getAsDataURL());
			} else {//firefox7.0+    
				document.getElementById('imgId').setAttribute("src",
						window.URL.createObjectURL(fileImage.files[0]));
			}
		} else {
			alert("抱歉，系统暂不支持您当前使用的浏览器的图片预览功能!");
		}
		//ie中
		// alert(fileImage.value);
		//$("#imgId").attr("src", fileImage.value);
		//火狐7以下版本
		//$("#imgId").attr("src",fileImage.files[0].getAsDataURL());
		//火狐 7以上版本
		//$("#imgId").attr("src", window.URL.createObjectURL(fileImage.files[0]));
	}
	
	function changeBigMc(bid) {a
		//-1没有选中
		var sid = document.getElementsByName("sid")[0];
		sid.options.length = 1;
		if (bid != -1) {
			for (var i = 0; i < arr.length; i++) {
				if (bid == arr[i][2]) {
					var opt = new Option(arr[i][1], arr[i][0]);
					sid.options.add(opt);
				}
			}
		}
	}

	function checkMname() {
		var mname = mcForm.mname;
		var span = document.getElementById("mnameSpan");
		if (mname.value == '') {
			mname.focus();
			span.innerHTML = "&nbsp;*名称必填";
			return false;
		} else {
			return true;
		}
	}
	function checkBid() {
		var bid = mcForm.bid;
		var span = document.getElementById("bidSpan");
		if (bid.value == -1) {
			bid.focus();
			span.innerHTML = "&nbsp;*种类必选";
			return false;
		} else {
			return true;
		}
	}
	function checkSid() {
		var sid = mcForm.sid;
		var span = document.getElementById("sidSpan");
		if (sid.value == -1) {
			sid.focus();
			span.innerHTML = "&nbsp;*品牌必选";
			return false;
		} else {
			return true;
		}
	}
	function checkMprice() {
		var mprice = mcForm.mprice;
		var span = document.getElementById("mpriceSpan");
		var regex = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
		if (mprice.value == '') {
			mprice.focus();
			span.innerHTML = "&nbsp;*价格必填";
			return false;
		} else if (!regex.test(mprice.value)) {
			mprice.focus();
			span.innerHTML = "&nbsp;*价格不合法";
			return false;
		} else {
			return true;
		}
	}
	function checkMtotal() {
		var mtotal = mcForm.mtotal;
		var span = document.getElementById("mtotalSpan");
		var regex = /^[0-9]*$/;
		if (mtotal.value == '') {
			mtotal.focus();
			span.innerHTML = "&nbsp;*总数必填";
			return false;
		} else if (!regex.test(mtotal.value)) {
			mtotal.focus();
			span.innerHTML = "&nbsp;*数量不合法，必须全为数字";
			return false;
		} else {
			return true;
		}
	}
	function checkForm() {
		return checkMname() && checkBid() && checkSid() && checkMprice()
				&& checkMtotal();
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
													class="font1">首页</a> &gt; <a class="font1">商品管理</a> &gt;
													&gt; <a href="<%=path%>/mcServletUrl" class="font1">商品信息管理</a>
													&gt;<a class="font1"><strong> 商品信息修改</strong></a></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<form action="<%=path%>/mcServletUrl?task=updateSubmit"
								enctype="multipart/form-data" method="post"
								onSubmit="return checkForm()" name="mcForm">
								<table width="85%" border="0" cellspacing="0" align="center">
									<tr>
										<td width="40%" align="right">商品编号：</td>
										<td width="60%"><input type="text" name="mid"
											style="width:180px" value="${mcListBean.mid}"
											readonly="readonly" /></td>
									</tr>
									<tr>
										<td align="right">商品名称：</td>
										<td><input type="text" name="mname" style="width:180px"
											value="${mcListBean.mname}" /> <span id="mnameSpan"></span></td>
									</tr>
									<tr>
										<td align="right">种类：</td>
										<td><select name="bid" onChange="changeBigMc(this.value)">
												<option value="-1">==选择种类==</option>
												<c:forEach items="${bigMcList}" var="bigMcBean"
													varStatus="vs">
													<option value="${bigMcBean.bid}"
														${mcListBean.bname==bigMcBean.bname?'selected':''}>${bigMcBean.bname }</option>
												</c:forEach>
										</select> <span id="bidSpan"></span></td>
									</tr>
									<tr>
										<td align="right">品牌：</td>
										<td><select name="sid">
												<option value="-1">==选择品牌==</option>
												<c:forEach items="${smallMcList}" var="smallMcBean"
													varStatus="vs">
													<option value="${smallMcBean.sid}"
														${smallMcBean.sname==mcListBean.sname?'selected':''}>${smallMcBean.sname}</option>
												</c:forEach>
										</select> <span id="sidSpan"></span></td>
									</tr>
									<tr>
										<td align="right">商品价格：</td>
										<td><input type="text" name="mprice" style="width:180px"
											value="${mcListBean.mprice}" /> <span id="mpriceSpan"></span></td>
									</tr>
									<tr>
										<td align="right">商品总数量：</td>
										<td><input type="text" name="mtotal" style="width:180px"
											value="${mcListBean.mtotal}" /> <span id="mtotalSpan"></span></td>
									</tr>
									<tr>
										<td align="right">商品添加日期：</td>
										<td><input type="text" name="mdate" style="width:180px"
											value="${mcListBean.mdate}" class="Wdate"
											onclick="WdatePicker()" readonly="readonly" /> <span
											id="mdateSpan"></span></td>
									</tr>
									<tr>
										<td align="right">商品描述：</td>
										<td><textarea cols="20" rows="10" style="width:180px"
												name="mdescription">${mcListBean.mdescription}
									</textarea><span id="mdescriptionSpan"></span></td>
									</tr>
									<tr>
										<td align="right">商品图片：</td>
										<td><input type="hidden" name="${mcListBean.mid}"
											value="${mcListBean.mimg }" /> <input type="file"
											name="mimg" onchange="testChange(this)" readonly="readonly" /><span
											id="mimgSpan"></span></td>
									</tr>
									<tr>
										<td></td>
										<td><img title="显示图片" id="imgId"
											src="<%=path%>/images/mc_images/${mcListBean.mimg}"
											width="200px" height="200px"></td>
									</tr>
									<tr>
										<td colspan="2" align="center"><input type="submit"
											value="修改" style="height=28px;width=64px;" />&nbsp;&nbsp;&nbsp;
											<a href="javascript:history.back(0);"><input
								type="button" value="取消" style="height=28px;width=64px;" /></a></td>

									</tr>
								</table>
							</form>
						</td>
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
