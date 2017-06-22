/**
 * 5种弹出框 success(v) error(x) warning(!) info(i) question(?)
 */
var baseUrl = "http://localhost:8080/ClassManage/";
var imgUrl = "http://localhost:8080/ClassManage/icon/";
$(document).ready(function() {

	// 查询所有学生

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
	$('#myModalEdit').modal('show');
}
function showModalAdd() {
	$('#myModalAdd').modal('show');
}

// 查看信息 然后可以编辑
function editStudent(id) {
	$('#studentNameEdit').val('');
	$('#studentSexEdit').val('');
	$('#studentAgeEdit').val('');
	$('#studentPhoneEdit').val('');
	$('#studentEmailEdit').val('');
	var sid = $(id).parents("tr").find(".sid").text();
	$.ajax({
		type : "post",// 请求方式
		url : baseUrl + "StudentServlet",// 请求的地址
		dataType : "json",
		data : {
			"method" : 'edit',
			"sid" : sid
		},
		success : function(data, text) {
			showModal();
			$('#studentIDEdit').val(sid);
			$('#studentNameEdit').val(data.obj.name);
			$('#studentSexEdit').val(data.obj.sex);
			$('#studentAgeEdit').val(data.obj.age);
			$('#studentPhoneEdit').val(data.obj.phone);
			$('#studentEmailEdit').val(data.obj.email);
			$("#btnHead").attr('src',imgUrl+data.obj.head+".png"); 
		}
	})

}
// 修改学生信息
function updateStu() {
	var sid = $('#studentIDEdit').val();
	var name = $('#studentNameEdit').val();
	var sex = $('#studentSexEdit').val();
	var age = $('#studentAgeEdit').val();
	var phone = $('#studentPhoneEdit').val();
	var email = $('#studentEmailEdit').val();
	var head = $('#headValue').val();
	$.ajax({
		type : "post",// 请求方式
		url : baseUrl + "StudentServlet",// 请求的地址
		dataType : "json",
		data : {
			"method" : 'update',
			"sid" : sid,
			"name" : name,
			"sex" : sex,
			"age" : age,
			"phone" : phone,
			"email" : email,
			"head":head
		},
		success : function(data, text) {

			if (data.code == 200) {
				// 修改成功
				$('#myModalEdit').modal('hide');
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

// 添加一个学生
function addStudent() {
	var name = $('#studentNameAdd').val();
	var sex = $('#studentSexAdd').val();
	var age = $('#studentAgeAdd').val();
	var phone = $('#studentPhoneAdd').val();
	var email = $('#studentEmailAdd').val();
	var head = $('#headValueAdd').val();
	alert(1);
	$.ajax({
		type : "post",// 请求方式
		url : baseUrl + "StudentServlet",// 请求的地址
		dataType : "json",
		data : {
			"method" : 'add',
			"name" : name,
			"sex" : sex,
			"age" : age,
			"phone" : phone,
			"email" : email,
			"head":head
		},
		success : function(data, text) {

			if (data.code == 200) {
				// 修改成功
				$('#myModal').modal('hide');
				swal('成功!', data.msg, 'success');
				$('#myModalAdd').modal('hide');
				$('#studentNameAdd').val('');
				$('#studentSexAdd').val('');
				$('#studentAgeAdd').val('');
				$('#studentPhoneAdd').val('');
				$('#studentEmailAdd').val('');
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
function delStu(id) {
	var sid = $(id).parents("tr").find(".sid").text();

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
				url : baseUrl + "StudentServlet",// 请求的地址
				dataType : "json",
				data : {
					"method" : 'del',
					"sid" : sid

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
function findAll() {
	$
			.ajax({
				type : "post",// 请求方式
				url : baseUrl + "StudentServlet",// 请求的地址
				dataType : "json",
				data : {
					"page" : 1,
					"method" : 'find'
				},
				success : function(data, text) {
					var ht = '';
					for (var i = 0; i < data.obj.length; i++) {
						var sex="";
						if(data.obj[i].sex==1){
							sex="男";
						}else{
							sex="女"
						}
						
						
						var img = imgUrl + data.obj[i].head + ".png";
						ht = ht + '<tr>';
						ht = ht + '<td class=\'sid\'>' + data.obj[i].ID
								+ '</td>';
						ht = ht + '<td>' + data.obj[i].name + '</td>';
						ht = ht + '<td>' + sex + '</td>';
						ht = ht + '<td>' + data.obj[i].age + '</td>';
						ht = ht + '<td>' + data.obj[i].phone + '</td>';
						ht = ht + '<td>' + data.obj[i].email + '</td>';
						ht = ht + '<td><img src="' + img + '"></td>';
						ht = ht
								+ '<td>'
								+ "<button type=\'button\' onclick=\'editStudent(this)\' class=\'btn btn-default\'>修改</button>　<button type=\'button\' onclick=\'delStu(this)\' class=\'btn btn-danger\'>删除</button>"
								+ '</td>';
						ht = ht + '</tr>';
					}
					$("#tbbody").html(ht);
				}
			})

}