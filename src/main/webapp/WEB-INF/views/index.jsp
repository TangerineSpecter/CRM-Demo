<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="common.jsp"%>
<script type="text/javascript" src="/js/views/index.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<body>
	<div id="crm_layout" class="easyui-layout"
		style="width: 600px; height: 400px;">
		<div data-options="region:'north'"
			style="height: 100px; background: url('/img/banner-pic.gif') no-repeat; background-size: cover">
			<h1>客户关系管理</h1>
		</div>
		<div data-options="region:'south',split:true"
			style="height: 30px; background: url('/img/banner-pic.gif')">
			<center>版权所有</center>
		</div>
		<div data-options="region:'west',split:true" style="width: 180px;">
			<!-- 手风琴效果 -->
			<div class="easyui-accordion" data-options="fit:true">
				<div title="菜单">
					<ul id="menu"></ul>
				</div>
				<div title="帮助"></div>
			</div>
		</div>
		<div data-options="region:'center'"
			style="padding: 5px; background: #eee;">
			<div id="menu_tabs">
				<div title="Come! Boy!" closable="true">
					<h1>WelCome to Manage!</h1>
				</div>
			</div>
		</div>
	</div>
</body>
</html>