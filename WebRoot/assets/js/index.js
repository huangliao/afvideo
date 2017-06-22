/**
 * 5种弹出框 success(v) error(x) warning(!) info(i) question(?)
 */
var baseUrl = "http://localhost:8080/ClassManage/";
var imgUrl = "http://localhost:8080/ClassManage/icon/";
$(document).ready(function() {

	// 查询所有管理员

	findAll();
	// 头像选择
	$("#btnHead").click(function(){
		
		if($("#tbHead").hasClass("hidden")){
			$("#tbHead").removeClass("hidden");
		}else{
			$("#tbHead").addClass("hidden");
			
		}
	});
	
	// 头像选择2
	$("#btnHeadAdd").click(function(){
		
		if($("#tbHeadAdd").hasClass("hidden")){
			$("#tbHeadAdd").removeClass("hidden");
		}else{
			$("#tbHeadAdd").addClass("hidden");
			
		}
	});
	
	//头像表格点击
	
	$('#tbEditTb').find('tr').each(function(){
		$(this).find('td').each(function(){
			$(this).find('img').click(function(){
				
				var name = $(this).attr('name');
				$('#headValue').val(name);
				
				$("#btnHead").attr('src',imgUrl+name+".png"); 
				
				
			});
			
		});
		
		
		
		
	});
	//头像表格点击2
	
	$('#tbEditTbAdd').find('tr').each(function(){
		$(this).find('td').each(function(){
			$(this).find('img').click(function(){
				
				var name = $(this).attr('name');
				$('#headValueAdd').val(name);
				
				$("#btnHeadAdd").attr('src',imgUrl+name+".png"); 
				
				
			});
			
		});
		
		
		
		
	});
	

})
// 显示模态框
function showModal() {
	$('#myModal').modal('show');
}
function showModalAdd() {
	$('#myModalAdd').modal('show');
}
function addAdmin() {
	var name = $('#userNameAdd').val();
	var pwd = $('#userPwdAdd').val();
	var des = $('#userDesAdd').val();
	var head = $('#headValueAdd').val();
	$.ajax({
		type : "post",// 请求方式
		url : baseUrl + "AdminServlet",// 请求的地址
		dataType : "json",
		data : {
			"method" : 'add',
			"name" : name,
			"pwd" : pwd,
			"des" : des,
			"head":head
		},
		success : function(data, text) {

			if (data.code == 200) {
				// 修改成功
				$('#myModal').modal('hide');
				swal('成功!', data.msg, 'success');
				$('#myModalAdd').modal('hide');
				$('#userNameAdd').val('');
				$('#userPwdAdd').val('');
				$('#userDesAdd').val('');
				findAll();
				//

			} else {
				swal({
					title : "提示!",
					text : "添加失败!",
					type : "error"
				});
			}

		}
	})
}
function delAdmin(id) {
	var aid = $(id).parents("tr").find(".aid").text();

	swal({
		title : '删除提示!',
		text : "你要删除么,不可恢复哦!!",
		type : 'warning',
		showCancelButton : true,
		cancelButtonText : '╰（‵□′）╯留着',
		confirmButtonColor : '#3085d6',
		cancelButtonColor : '#d33',
		confirmButtonText : '对 删了!'
	}).then(function(isConfirm) {
		if (isConfirm) {
			$.ajax({
				type : "post",// 请求方式
				url : baseUrl + "AdminServlet",// 请求的地址
				dataType : "json",
				data : {
					"method" : 'delete',
					"aid" : aid

				},
				success : function(data, text) {

					if (data.code == 200) {
						// 删除成功
						swal('成功!', '删掉了.', 'success');
						findAll();
						//

					} else {
						swal({
							title : "提示!",
							text : "删除失败!",
							type : "error"
						});
					}

				}
			})
		}
	})

}

// 修改用户
function editSub() {
	var aid = $('#userID').val();
	var name = $('#userName').val();
	var pwd = $('#userPwd').val();
	var des = $('#userDes').val();
	var head = $('#headValue').val();
	$.ajax({
		type : "post",// 请求方式
		url : baseUrl + "AdminServlet",// 请求的地址
		dataType : "json",
		data : {
			"method" : 'editsub',
			"aid" : aid,
			"name" : name,
			"pwd" : pwd,
			"des" : des,
			"head":head
		},
		success : function(data, text) {

			if (data.code == 200) {
				// 修改成功
				$('#myModal').modal('hide');
				swal('成功!', data.msg, 'success');
				findAll();
				//

			} else {
				swal({
					title : "提示!",
					text : "修改失败!",
					type : "error"
				});
			}

		}
	})

}

// 查看信息
function editAdmin(id) {
	$('#userName').val('');
	$('#userPwd').val('');
	$('#userDes').val('');
	var aid = $(id).parents("tr").find(".aid").text();
	$.ajax({
		type : "post",// 请求方式
		url : baseUrl + "AdminServlet",// 请求的地址
		dataType : "json",
		data : {
			"method" : 'edit',
			"aid" : aid
		},
		success : function(data, text) {
			showModal();
			$('#userID').val(aid);
			$('#userName').val(data.obj.name);
			$('#userPwd').val(data.obj.pwd);
			$('#userDes').val(data.obj.des);
			$("#btnHead").attr('src',imgUrl+data.obj.head+".png"); 
		}
	})

}



function findAll() {
	$
			.ajax({
				type : "post",// 请求方式
				url : baseUrl + "AdminServlet",// 请求的地址
				dataType : "json",
				data : {
					"page" : 1,
					"method" : 'find'
				},
				success : function(data, text) {
					var ht = '';
					for (var i = 0; i < data.obj.length; i++) {

						var img = imgUrl + data.obj[i].head + ".png";

						ht = ht + '<tr>';
						ht = ht + '<td class=\'aid\'>' + data.obj[i].ID
								+ '</td>';
						ht = ht + '<td>' + data.obj[i].name + '</td>';
						ht = ht + '<td>' + data.obj[i].des + '</td>';
						ht = ht + '<td><img src="' + img + '"></td>';
						ht = ht
								+ '<td>'
								+ "<button type=\'button\' onclick=\'editAdmin(this)\' class=\'btn btn-default\'>修改</button>　<button type=\'button\' onclick=\'delAdmin(this)\' class=\'btn btn-danger\'>删除</button>"
								+ '</td>';
						ht = ht + '</tr>';
					}
					$("#tbbody").html(ht);
				}
			})

}


