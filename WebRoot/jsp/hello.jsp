<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${base}/assets/css/bootstrap.css" rel="stylesheet">
<link href="${base}/assets/css/bootstrap-responsive.min.css"
	rel="stylesheet">
<link href="${base}/assets/css/site.css" rel="stylesheet">
<link href="${base}/assets/css/sweetalert2.min.css" rel="stylesheet">

</head>
<body>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">添加用户</h4>
				</div>
				<div class="modal-body">
					<form id="form" method="post" action="${base}/user/register">
						<div class="form-group">
							<label for="recipient-name" class="control-label">ID:</label> <input
								type="text" readonly="readonly" class="form-control"
								id="userIDAdd" value="***">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">用户名:</label> <input
								type="text" class="form-control" name="userName" id="userName">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">密码:</label> <input
								type="text" class="form-control" name="password" id="password">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="addUser()">添加</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<a class="btn btn-navbar" data-toggle="collapse"
						data-target=".nav-collapse"> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
					</a> <a target="_blank" class="brand" href="../index/index.jsp">前台</a>
					<div class="nav-collapse">
						<ul class="nav">
							<li class="active"><a href="index.jsp">系统管理</a></li>
							<li><a href="class.jsp">班级信息</a></li>


						</ul>

						<ul class="nav pull-right">
							<li><a href="#">@${userName}</a></li>
							<li><a href="login.jsp">注销</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="span3">
				<div class="well" style="padding: 8px 0;">
					<ul class="nav nav-list">
						<li class="nav-header">系统管理</li>
						<li class="active"><a href="index.jsp"><i
								class="icon-home"></i> 管理员列表</a></li>
						<li><a href="student.jsp"><i class="icon-folder-open"></i>
								学生管理</a></li>
						<li><a href="activity.jsp"><i class="icon-check"></i>
								活动管理</a></li>

						<li class="nav-header">班级信息</li>
						<li><a href="class.jsp"><i class="icon-user"></i> 班级信息</a></li>
						<li><a href="advice.jsp"><i class="icon-cog"></i> 用户反馈</a></li>
						<li class="divider"></li>
						<li><a href="help.jsp"><i class="icon-info-sign"></i> 帮助</a>
						</li>

					</ul>
				</div>
			</div>
			<div class="span9">
				<h1>
					管理员列表 <a class="btn btn-primary" onclick="showModal()">添加</a>
				</h1>
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>用户名</th>
							<th>个人简介</th>
							<th>头像</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="tbbody">
						<c:forEach items="${users}" var="user">
							<tr>
								<td>${user.id}</td>
								<td>${user.userName}</td>
								<td>${user.password}</td>
								<td>-</td>
								<td><button type='button' class='btn btn-default'>修改</button>
									<button type='button' onclick='delAdmin(this)'
										class='btn btn-danger'>删除</button></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				<div class="pagination">
					<ul>
						<li class="disabled"><a href="#">&laquo;</a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">&raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script src="${base}/assets/js/jquery.min.js"></script>
	<script src="${base}/assets/js/bootstrap.min.js"></script>

	<script src="${base}/assets/js/sweetalert2.min.js"></script>


</body>
<script>
	/*
	 * 5种弹出框 success(v) error(x) warning(!) info(i) question(?)
	 */
	//查询所有用户 
	function loadUser(){
		
		
	}
	 
	 
	function showModal() {

		$('#myModalAdd').modal();
	}

	function addUser() {
		//$('#form').submit();

		var name = $("#userName").val();
		var pwd = $("#password").val();

		$.ajax({
			type : "post",
			url : "${base}/user/add",
			dataType : "json",
			data : {
				"userName" : name,
				"password" : pwd
			},
			success : function(data, text) {
				console.log(data.msg);
				var state = data.state ? 'success' : 'warning';

				swal({
					title : "提示!",
					text : data.msg,
					type : state
				});
				if (data.state) {
					$('#myModalAdd').modal("hide");
				}

			}
		});

	}
</script>


</html>