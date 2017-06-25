<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="${base}/assets/css/bootstrap.css" rel="stylesheet">
<link href="${base}/assets/css/bootstrap-responsive.min.css"
	rel="stylesheet">
<link href="${base}/assets/css/site.css" rel="stylesheet">
<link href="${base}/assets/css/sweetalert2.min.css" rel="stylesheet">

</head>
<body>
	<form name="serForm" action="upload/fileUpload" method="post"
		enctype="multipart/form-data">
		<h1>采用流的方式上传文件</h1>
		<input type="file" name="file"> <input type="submit"
			value="upload" />
	</form>

	<form name="Form2" action="upload/fileUpload2" method="post"
		enctype="multipart/form-data">
		<h1>采用multipart提供的file.transfer方法上传文件</h1>
		<input type="file" name="file"> <input type="submit"
			value="upload" />
	</form>

	<form name="Form2" action="upload/fileUpload3" method="post"
		enctype="multipart/form-data">
		<h1>使用spring mvc提供的类的方法上传文件</h1>
		<input type="file" name="file"> <input type="submit"
			value="upload" />
	</form>
	<script src="${base}/assets/js/jquery.min.js"></script>
	<script src="${base}/assets/js/bootstrap.min.js"></script>

	<script src="${base}/assets/js/sweetalert2.min.js"></script>
</body>
</html>