/**
 * 5种弹出框 success(v) error(x) warning(!) info(i) question(?)
 */
var baseUrl = "http://localhost:8080/ClassManage/";
var imgUrl = "http://localhost:8080/ClassManage/eShop/upload/";
$(document).ready(function() {

	// 查询所有学生

	findAll();

})

// 显示模态框
function showModal() {
	$('#myModalEdit').modal('show');
}
function showModalAdd() {
	$('#myModalAdd').modal('show');
}

// 查看信息 然后可以编辑
function editAct(id) {
	$('#ActivityNameEdit').val('');
	$('#ActivityAddrEdit').val('');
	$('#ActivityDesEdit').val('');
	$('#ActivityTypeEdit').val('');
	$('#ActivityTimeEdit').val('');
	var aid = $(id).parents("tr").find(".aid").text();
	$.ajax({
		type : "post",// 请求方式
		url : baseUrl + "ActivityServlet",// 请求的地址
		dataType : "json",
		data : {
			"method" : 'edit',
			"aid" : aid
		},
		success : function(data, text) {
			showModal();
			$('#ActivityIDEdit').val(aid);
			$('#ActivityNameEdit').val(data.obj.name);
			$('#ActivityAddrEdit').val(data.obj.addr);
			$('#ActivityDesEdit').val(data.obj.des);
			$('#ActivityTypeEdit').val(data.obj.type);
			$('#ActivityTimeEdit').val(data.obj.time);

		}
	})

}
// 修改学生信息
function updateAct() {
	var aid = $('#ActivityIDEdit').val();
	var name = $('#ActivityNameEdit').val();
	var addr = $('#ActivityAddrEdit').val();
	var des = $('#ActivityDesEdit').val();
	var type = $('#ActivityTypeEdit').val();
	var time = $('#ActivityTimeEdit').val();
	$.ajax({
		type : "post",// 请求方式
		url : baseUrl + "ActivityServlet",// 请求的地址
		dataType : "json",
		fileElementId : 'uploadFile',
		data : {
			"method" : 'update',
			"aid" : aid,
			"name" : name,
			"addr" : addr,
			"des" : des,
			"type" : type,
			"time" : time,
			"uploadFile" : $('#uploadFile').val()
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
function addAct() {
	var name = $('#ActivityNameAdd').val();
	var addr = $('#ActivityAddrAdd').val();
	var des = $('#ActivityDesAdd').val();
	var type = $('#ActivityTypeAdd').val();
	var time = $('#ActivityTimeAdd').val();
	$.ajax({
		type : "post",// 请求方式
		url : baseUrl + "ActivityServlet",// 请求的地址
		dataType : "json",
		data : {
			"method" : 'add',
			"name" : name,
			"addr" : addr,
			"des" : des,
			"type" : type,
			"time" : time
		},
		success : function(data, text) {

			if (data.code == 200) {
				// 修改成功
				$('#myModal').modal('hide');
				swal('成功!', data.msg, 'success');
				$('#myModalAdd').modal('hide');
				$('#ActivityNameAdd').val('');
				$('#ActivityAddrAdd').val('');
				$('#ActivityDesAdd').val('');
				$('#ActivityTypeAdd').val('');
				$('#ActivityTimeAdd').val('');
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
function delAct(id) {
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
				url : baseUrl + "ActivityServlet",// 请求的地址
				dataType : "json",
				data : {
					"method" : 'del',
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
// 上传图片
function showUpload(id) {

	$('#myModalUpload').modal('show');
	var aid = $(id).parents("tr").find(".aid").text();

	$('#upaid').val(aid);

}

function findAll() {
	$
			.ajax({
				type : "post",// 请求方式
				url : baseUrl + "ActivityServlet",// 请求的地址
				dataType : "json",
				data : {
					"page" : 1,
					"method" : 'find'
				},
				success : function(data, text) {
					var ht = '';
					for (var i = 0; i < data.obj.length; i++) {
						var type;
						switch (data.obj[i].type) {
						case 1:
							type="集体活动";
							break;
						case 2:
							type="比赛项目";
							break;
						case 3:
							type="公益活动";
							break;
						default:
							break;
						}

						var img = imgUrl + data.obj[i].photo;
						ht = ht + '<tr>';
						ht = ht + '<td class=\'aid\'>' + data.obj[i].ID
								+ '</td>';
						ht = ht + '<td>' + data.obj[i].name + '</td>';
						ht = ht + '<td>' + data.obj[i].addr + '</td>';
						ht = ht + '<td>' + data.obj[i].des + '</td>';
						ht = ht + '<td>' + type + '</td>';
						ht = ht + '<td>' + data.obj[i].time + '</td>';
						ht = ht
								+ '<td><img onclick=\'showUpload(this)\' class=\'btn imgact\' src="'
								+ img + '"></td>';
						ht = ht
								+ '<td>'
								+ "<button type=\'button\' onclick=\'editAct(this)\' class=\'btn btn-default\'>修改</button>　<button type=\'button\' onclick=\'delAct(this)\' class=\'btn btn-danger\'>删除</button>"
								+ '</td>';
						ht = ht + '</tr>';
					}
					$("#tbbody").html(ht);
				}
			})

}