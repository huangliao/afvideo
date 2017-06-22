<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.role/TR/html4/loose.dtd">
<html>
<head>
    <title>后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${base}/assets/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="${base}/assets/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="${base}/assets/assets/css/main-min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="header">
    <div class="dl-title">
        <%-- <img src="${base}/assets/assets/Public/img/top.png"> --%>
    </div>
    <div class="dl-log">欢迎您，<span class="dl-log-user">root</span><a href="${base}/" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">系统管理</div></li>		<li class="nav-item dl-selected"><div class="nav-item-inner nav-order">业务管理</div></li>

        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
</div>
<script type="text/javascript" src="${base}/assets/assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="${base}/assets/assets/js/bui-min.js"></script>
<script type="text/javascript" src="${base}/assets/assets/js/common/main-min.js"></script>
<script type="text/javascript" src="${base}/assets/assets/js/config-min.js"></script>
<script>
BUI.use('common/main',
		function() {
		    var config = [{
		        id: '1',
		        menu: [{
		            text: '系统管理',
		            items: [{
		                id: '10',
		                text: '机构管理',
		                href: 'Mech/index.html'
		            },
		            {
		                id: '11',
		                text: '角色管理',
		                href: 'Role/index.html'
		            },
		            {
		                id: '12',
		                text: '用户管理',
		                href: 'User/index.html'
		            },
		            {
		                id: '13',
		                text: '菜单管理',
		                href: 'Menu/index.html'
		            }]
		        }]
		    },
		    {
		        id: '2',
		        menu: [{
		            text: '业务管理',
		            items: [{
		                id: '21',
		                text: '查询业务',
		                href: '${base}/Node/NodeIndex'
		            },
		            {
		                id: '22',
		                text: '用户管理',
		                href: '${base}/Node/NodeIndex'
		            }]
		        }]
		    }];
		    new PageUtil.MainPage({
		        modulesConfig: config
		    });
		});
</script>
<div style="text-align:center;">
</div>
</body>
</html>                                    