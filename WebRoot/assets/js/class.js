/**
 * 5种弹出框 success(v) error(x) warning(!) info(i) question(?)
 */
var baseUrl = "http://localhost:8080/ClassManage/";
$(document).ready(function() {

	// 查询所有学生

	editClass();
	

})




// 查看信息 然后可以编辑
function editClass() {

	$.ajax({
		type : "post",// 请求方式
		url : baseUrl + "ClassServlet",// 请求的地址
		dataType : "json",
		data : {
			"method" : 'getinfo',
		},
		success : function(data, text) {
			$('#className').val(data.obj.name);
			$('#classSchool').val(data.obj.school);
			$('#classWord').val(data.obj.word);
			$('#classBoy').val(data.obj.boy);
			$('#classGril').val(data.obj.gril);
//			$('#classLogo').val(data.obj.logo);
			$('#classDes').val(data.obj.des);

		}
	})

}
// 修改学生信息
function updateClass() {
	var name = $('#className').val();
	var school = $('#classSchool').val();
	var word = $('#classWord').val();
	var boy = $('#classBoy').val();
	var gril = $('#classGril').val();
//	var logo = $('#classLogo').val();
	var des = $('#classDes').val();
	$.ajax({
		type : "post",// 请求方式
		url : baseUrl + "ClassServlet",// 请求的地址
		dataType : "json",
		data : {
			"method" : 'update',
			"name" : name,
			"school" : school,
			"word" : word,
			"boy" : boy,
			"gril" : gril,
			"logo" : "",
			"des" : des
		},
		success : function(data, text) {

			if (data.state) {
				// 修改成功

				swal('成功!', data.msg, 'success');
				editClass();
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
