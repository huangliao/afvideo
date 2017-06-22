<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/Demo5/gl/update">
		<table>
			<tr>
				<td>username:</td>
				<td><input type="text" name="userName"
					value="${user.userName }" /></td>
			</tr>

			<tr>
				<td>password:</td>
				<td><input type="text" name="password"
					value="${user.password }" /></td>
			</tr>

			<tr>
				<td><input type="hidden" name="sid" value="${user.id }" /><input
					type="submit" value="submit" /></td>
				<td><input type="reset" value="reset" /></td>
			</tr>
		</table>
	</form>
</body>
</html>