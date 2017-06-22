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
<input type="hidden" value="${msg}" id="msg">
<form action="${base}/Node/NodeAddUser" method="post">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">用户名</td>
        <td><input type="text" name="userName" placeholder="用户名不能为空"/></td>
    </tr>
    <tr>
        <td class="tableleft">密码</td>
        <td><input type="text" name="password" placeholder="密码不能为空"/></td>
    </tr>   
    <tr>
        <td class="tableleft">状态</td>
        <td>
            <input type="radio" name="status" value="1" checked/> 男
            <input type="radio" name="status" value="0"/> 女
        </td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" class="btn btn-primary" type="button">保存</button>&nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
<script>
    $(function () {
    	if($("#msg").val()!=null&&$("#msg").val()!=''){
    		alert($("#msg").val());
    	}
		$('#backid').click(function(){
				window.location.href="${base}/Node/NodeIndex";
		 });

    });
</script>