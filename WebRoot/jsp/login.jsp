<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>


<link href="${base}/assets/css/bootstrap.css" rel="stylesheet">
<link href="${base}/assets/css/bootstrap-responsive.min.css"
	rel="stylesheet">
<link href="${base}/assets/css/site.css" rel="stylesheet">
<link href="${base}/assets/css/sweetalert2.min.css" rel="stylesheet">
</head>
<body>


	<div id="login-page" class="container">
		<h1>管理员登录</h1>
		<div class="well">
			<form role="form" action="${base}/user/loginGo" id="form" method="post">
			<input id="userName" name="userName" type="text" class="span2" placeholder="用户名" /><br />
			<input id="password" name="password" type="password" class="span2" placeholder="密码" /><br />
			<label class="checkbox"> <input type="checkbox" /> 记住我
			</label>

			<button  class="btn btn-primary" onclick="doLogin()">登录</button>
			<button  class="btn">忘记密码</button>
						</form>
		</div>
	</div>
		
		
	<script src="${base}/assets/js/jquery.min.js"></script>
	<script src="${base}/assets/js/bootstrap.min.js"></script>

	<script src="${base}/assets/js/sweetalert2.min.js"></script>

</body>
<script type="text/javascript">
	function doLogin(){

		$("#form").submit();
	}

	function doReg() {

		var username = $('#userName').val();
		var password = $('#password').val();
		$.ajax({
			type : "post",// 请求方式
			url : '${base}/user/register',
			//dataType : "json",
			data : {
				'userName' : username,
				'password' : password
			},
			success : function(data, text) {
				alert('ok');
				window.location.href = "${base}/user/welcome";
			}
		});

	}

	function doRedirect(url) {
		window.location.replace('${base}' + url);
	}
</script>
</html>