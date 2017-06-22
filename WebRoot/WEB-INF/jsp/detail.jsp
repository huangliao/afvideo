<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="base"
	value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table,td {
	font: 100% Arial, Helvetica, sans-serif;
	font-size: 14px;
}

.dd table {
	border-collapse: collapse;
	border: none;
}

.dd td {
	border: solid gray 1px;
	height: 25px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="dd">
		<table>

			<tr>
				<td width="30%">ID</td>
				<td width="10%">username</td>
				<td width="10%">password</td>
				<td width="30%">operation</td>
			</tr>

			<tr>
				<td>${user.id}</td>
				<td>${user.userName }</td>
				<td>${user.password }</td>
				<td><a href="/Demo5/gl/toupdate?id=${user.id}">update</a></td>
			</tr>
		</table>
	</div>
	<a href="/Demo5/gl">首页</a>
</body>
</html>