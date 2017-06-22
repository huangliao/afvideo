/**
 * 5种弹出框 success(v) error(x) warning(!) info(i) question(?)
 */
var baseUrl = "http://localhost:8080/ClassManage/";
var imgUrl = "http://localhost:8080/ClassManage/icon/";
$(document).ready(function() {

	// 查询所有学生

	findAll();

	
	
	
})




function delAdvice(id) {
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
				url : baseUrl + "AdviceServlet",// 请求的地址
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
function findAll() {
	$
			.ajax({
				type : "post",// 请求方式
				url : baseUrl + "AdviceServlet",// 请求的地址
				dataType : "json",
				data : {
					"method" : 'find'
				},
				success : function(data, text) {
					var ht = '';
					for (var i = 0; i < data.obj.length; i++) {
						ht = ht + '<tr>';
						ht = ht + '<td class=\'aid hidden\'>' + data.obj[i].id
								+ '</td>';
						ht = ht + '<td>' + data.obj[i].name + '</td>';
						ht = ht + '<td>' + data.obj[i].email + '</td>';
						ht = ht + '<td>' + data.obj[i].classname + '</td>';
						ht = ht + '<td>' + data.obj[i].time + '</td>';
						ht = ht + '<td>' + data.obj[i].advice + '</td>';
						ht = ht
								+ '<td>'
								+ "<button type=\'button\' onclick=\'delAdvice(this)\' class=\'btn btn-danger\'>删除</button>"
								+ '</td>';
						ht = ht + '</tr>';
					}
					$("#tbbody").html(ht);
				}
			})

}