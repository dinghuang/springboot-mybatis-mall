<!--
$(document).ready(function()
{
	//checkSubmit
	$('#regUser').submit(function ()
	{
		if($('#txtUsername').val()==""){
			$('#txtUsername').focus();
			alert("用户名不能为空！");
			return false;
		}
		if($('#txtPassword').val()=="")
		{
			$('#txtPassword').focus();
			alert("登陆密码不能为空！");
			return false;
		}
		if($('#userpwdok').val()!=$('#txtPassword').val())
		{
			$('#userpwdok').focus();
			alert("两次密码不一致！");
			return false;
		}
	})
	
	//AJAX changChickValue
	$("#txtUsername").change( function() {
		$.ajax({type: reMethod,url: "index_do.php",
		data: "dopost=checkuser&fmdo=user&cktype=1&uid="+$("#txtUsername").val(),
		dataType: 'html',
		success: function(result){$("#_userid").html(result);}}); 
	});
	
	
	$("#email").change( function() {
		var sEmail = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
		if(!sEmail.exec($("#email").val()))
		{
			$('#_email').html("<font color='red'><b>×Email格式不正确</b></font>");
			$('#email').focus();
		}else{
			$.ajax({type: reMethod,url: "join.php",
			data: "dopost=checkmail&fmdo=user&email="+$("#email").val(),
			dataType: 'html',
			success: function(result){$("#_email").html(result);}}); 
		}
	});	
	
	$('#txtPassword').change( function(){
		if($('#txtPassword').val().length < pwdmin)
		{
			$('#_userpwdok').html("<font color='red'><b>×密码不能小于"+pwdmin+"位</b></font>");
		}
		else if($('#userpwdok').val()!=$('txtPassword').val())
		{
			$('#_userpwdok').html("<font color='red'><b>×两次输入密码不一致</b></font>");
		}
		else if($('#userpwdok').val().length < pwdmin)
		{
			$('#_userpwdok').html("<font color='red'><b>×密码不能小于"+pwdmin+"位</b></font>");
		}
		else
		{
			$('#_userpwdok').html("<font color='#4E7504'><b>√</b></font>");
		}
	});
	
	$('#userpwdok').change( function(){
		if($('#txtPassword').val().length < pwdmin)
		{
			$('#_userpwdok').html("<font color='red'><b>×密码不能小于"+pwdmin+"位</b></font>");
		}
		else if($('#userpwdok').val()=='')
		{
			$('#_userpwdok').html("<b>请填写确认密码</b>");
		}
		else if($('#userpwdok').val()!=$('#txtPassword').val())
		{
			$('#_userpwdok').html("<font color='red'><b>×两次输入密码不一致</b></font>");
		}
		else
		{
			$('#_userpwdok').html("<font color='#4E7504'><b>√</b></font>");
		}
	});
	
});
-->