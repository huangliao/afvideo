<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.role/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>后台模板</title>
    <link  rel="stylesheet" href="${base}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${base}/assets/css/plugins/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="${base}/assets/css/sb-admin-2.css">
    <link rel="stylesheet" href="${base}/assets/font-awesome-4.1.0/css/font-awesome.min.css">
</head>
<body>
<a name="zhuce">注册</a>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">登陆信息</h3>
                    </div>
                    <div class="panel-body">
                        <form id="from" role="form" action="${base}/user/loginGo" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="用户名" name="userName" type="name" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="密码" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">记住我
                                    </label>
                                </div>
                                <a onclick="submit()" class="btn btn-lg btn-success btn-block">登陆</a>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${base}/assets/js/jquery-1.11.0.js"></script>
    <script src="${base}/assets/js/bootstrap.min.js"></script>
    <script src="${base}/assets/js/plugins/metisMenu/metisMenu.min.js"></script>
    <script src="${base}/assets/js/sb-admin-2.js"></script>
</body>
<script type="text/javascript">
function submit() {
	$("#from").submit();
}
</script>
</html>
