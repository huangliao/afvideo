<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.role/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${base}/assets/Css1/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${base}/assets/Css1/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${base}/assets/Css1/style.css" />
    <script type="text/javascript" src="${base}/assets/Js1/jquery.js"></script>
    <script type="text/javascript" src="${base}/assets/Js1/jquery.sorted.js"></script>
    <script type="text/javascript" src="${base}/assets/Js1/bootstrap.js"></script>
    <script type="text/javascript" src="${base}/assets/Js1/ckform.js"></script>
    <script type="text/javascript" src="${base}/assets/Js1/common.js"></script>
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<body>
<form class="form-inline definewidth m20" action="${base}/Node/NodeSelectUser" method="get">用户名：
    <input type="text" name="userName" id="userName"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增机构</button>
</form>
<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th>ID</th>
        <th>用户</th>
        <th>密码</th>
        <th>管理操作</th>
    </tr>
    </thead>
    <c:if test="${user.size()!=0}">
    <c:forEach items="${user}" var="user">
	     <tr>
            <td>${user.id}</td>
            <td>${user.userName}</td>
            <td>${user.password}</td>
            <td><a href="${base}/Node/NodeEdit?id=${user.id}">编辑</a></td>
        </tr>
        </c:forEach>
        </c:if>
        </table>
<div class="inline pull-right page">
         10122 条记录 1/507 页  <a href='#'>下一页</a>     <span class='current'>1</span><a href='#'>2</a><a href='#'>3</a><a href='#'>4</a><a href='#'>5</a>  <a href='#' >下5页</a> <a href='#' >最后一页</a>    </div>
</body>
</html>
<script>
    $(function () {
		$('#addnew').click(function(){
				window.location.href="${base}/Node/NodeAdd";
		 });
    });
	function del(id)
	{
		if(confirm("确定要删除吗？"))
		{
			var url = "index.html";
			window.location.href=url;		
		}
	}
</script>