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
								type="text" class="form-control" name="userNameAdd"
								id="userNameAdd">
								<div id="isExitsName" class="alert hidden  alert-dismissable">用户名已经存在!</div>
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">密码:</label> <input
								type="text" class="form-control" name="passwordAdd"
								id="passwordAdd">
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

	<!-- 模态框编辑（Modal） -->
	<div class="modal fade" id="myModalEdit" tabindex="-1" role="dialog"
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
								type="text" readonly="readonly" class="form-control" id="IDEdit"
								value="***">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">用户名:</label> <input
								type="text" class="form-control" id="userNameEdit">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">密码:</label> <input
								type="text" class="form-control" id="passwordEdit">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="editUser()">修改</button>
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


					</tbody>
				</table>
				<div class="pagination">
					<ul id="pagelist">

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
	 //是否数字
	function isInteger(obj) {
		return typeof obj === 'number' && obj % 1 === 0;
	}

	//页面加载时
	$(function() {

		loadUser(1);

		//当用户名失去焦点
		$("#userNameAdd").blur(function(){
			isExitsName();
		});
	//	$("#userNameAdd").focus(function(){
	//		$('#isExitsName').addClass('hidden');
	//	});
		
	});
	

	
	//用户名是否存在
	function isExitsName(){
		var userName = $('#userNameAdd').val();
		
		$.ajax({
			type : "post",
			url : "${base}/user/isExitsName",
			dataType : 'json',
			data : {
				'userName' : userName
			},
			success : function(data, text) {
				if (data.state) {
					$('#isExitsName').removeClass('alert-danger');
					$('#isExitsName').addClass('alert-success');
				}else{
					$('#isExitsName').removeClass('alert-success');
					$('#isExitsName').addClass('alert-danger');
				}
				$('#isExitsName').removeClass('hidden');
				$('#isExitsName').html(data.msg);

			}

		});
		
		
		
		
		
	}
	
	
	//查询用户 
	function loadUser(id) {
		//第几页
		var page = isInteger(id) ? id : $(id).text();
		
		$
				.ajax({
					type : "post",
					url : "${base}/user/getByPage",
					dataType : "json",
					data : {
						"page" : page,
						"size" : 3
					},
					success : function(data, text) {
						//console.log('2');
						//alert(eval("("+data+")"));
						console.log(JSON.stringify(data));
						//成功
						if (data.state) {
							var strVar = "";
							$
									.each(
											data.obj,
											function(k, v) {
												strVar += "<tr>\n";
												strVar += "	<td>" + v.id
														+ "<\/td>\n";
												strVar += "	<td>" + v.userName
														+ "<\/td>\n";
												strVar += "	<td>" + v.password
														+ "<\/td>\n";
												strVar += "	<td>-<\/td>\n";
												strVar += "	<td>\n";
												strVar += "		<button type='button' onclick='showEdit(this)' class='btn btn-default'>修改<\/button>\n";
												strVar += "		<button type='button' onclick='deleteUser(this)' class='btn btn-danger'>删除<\/button>\n";
												strVar += "	<\/td>\n";
												strVar += "<\/tr>\n";

											});
							$("#tbbody").html(strVar);

							//底部页数
							var pageVar = '<li class="disabled"><a href="javascript:void(0)">&laquo;</a></li>';
							for (i = 1; i <= data.msg; i++) {
								if (i == page) {
									pageVar += '<li class="active"><a href="#" onclick="loadUser(this)">'
											+ i + '</a></li>';
								} else {
									pageVar += '<li><a href="#" onclick="loadUser(this)">'
											+ i + '</a></li>';
								}
							}
							pageVar += '<li class="disabled"><a href="javascript:void(0)">&raquo;</a></li>';
							$("#pagelist").html(pageVar);

						} else {
							swal({
								title : "提示!",
								text : data.msg,
								type : 'warning'
							});
						}

					}
				});

	}
	
	function deleteUser(id){
		var index = $('#pagelist>.active').text();
		var uid = $(id).parents('tr').find('td:first').text();
		
		swal({
			title:'警告',
			text:'您确定要删除吗',
			type:'warning',
			showCancelButton:true,
			confirmButtonText:'确定',
			cancelButtonText:'取消',
			
		}).then(function(isConfirm){
			if(isConfirm){
				
				$.ajax({
					type:'post',
					url:'${base}/user/delete',
					dataType:'json',
					data:{
						'uid':uid
					},
					success:function(data,text){
						var state = data.state?'success':'warning';
						swal({
							title : "提示!",
							text : data.msg,
							type : state
						});
						
					}
				
				});
			}else{
				
			}
			
			
			
		});
		
		
		
		
	}
	
	
	function editUser() {

		//var index = $(id).find('td:first').text();
		//当前是第几页  
		//var index = $('#pagelist').find('li').querySelector('.active').text();
		//当前是第几页  修改完就查询第几页的内容
		var index = $('#pagelist>.active').text();
		var id = $('#IDEdit').val();
		var userName = $('#userNameEdit').val();
		var password = $('#passwordEdit').val();
		$.ajax({
			type : "post",
			url : "${base}/user/update",
			dataType : 'json',
			data : {
				'id' : id,
				'userName' : userName,
				'password' : password
			},
			success : function(data, text) {
				if (data.state) {
					$('#myModalEdit').modal('hide');
					loadUser(parseInt(index));
				}
				var state = data.state ? 'success' : 'warning';

				swal({
					title : "提示!",
					text : data.msg,
					type : state
				});

			}

		});

	}
	function showEdit(id) {
		$('#myModalEdit').modal();

		var uid = $(id).parents('tr').find('td:first').text();
		var uname = $(id).parents('tr').children('td').eq(1).text();
		var upwd = $(id).parents('tr').children('td').eq(2).text();
		$('#IDEdit').val(uid);
		$('#userNameEdit').val(uname);
		$('#passwordEdit').val(upwd);

	}

	function showModal() {

		$('#myModalAdd').modal();
		$('#isExitsName').addClass('hidden');
	}

	function addUser() {
		//$('#form').submit();
		//已经存在
		if($('#isExitsName').hasClass('alert-danger')){
			alert('用户名已注册');
			return false;
		}
		
		var name = $("#userNameAdd").val();
		var pwd = $("#passwordAdd").val();

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