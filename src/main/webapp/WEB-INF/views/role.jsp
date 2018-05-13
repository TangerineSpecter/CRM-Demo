<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>角色管理</title>
<%@include file="common.jsp"%>
<script type="text/javascript" src="/js/views/role.js"></script>
</head>
<body>
	<table id="role_datagrid"></table>
	<!-- 数据表格的顶部按钮 -->
	<div id="role_datagrid_tb">
		<div>
			<a class="easyui-linkbutton" iconCls="icon-add" plain="true" data-cmd="add">新增</a>
			<a id="role_datagrid_edit" class="easyui-linkbutton" iconCls="icon-edit" plain="true" data-cmd="update">编辑</a>
			<a id="role_datagrid_del" class="easyui-linkbutton" iconCls="icon-remove" plain="true" data-cmd="del">离职</a>
			<a class="easyui-linkbutton" iconCls="icon-reload" plain="true" data-cmd="refresh")>刷新</a>
		</div>
		<div>
			关键字查询：<input name="keyWord" />
			<a class="easyui-linkbutton" iconCls="icon-search" data-cmd="searchBtn">搜索</a>
			<a class="easyui-linkbutton" iconCls="icon-search" data-cmd="cleanBtn">清空</a>
		</div>
	</div>
	<!-- 新增/更新员工窗口 -->
	<div id="role_dialog">
		<form id="role_form" method="post">
			<table align="center">
				<input type="hidden" name="id"/>
				<tr>
					<td>角色名称：<input type="text" name="name"></td>
					<td>角色编号：<input type="text" name="sn"></td>
				</tr>
				<tr>
					<td><table id="allPermissions"></table></td>
					<td><table id="selfPermissions"></table></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 窗口底部按钮 -->
	<div id="role_dialog_bt">
		<a class="easyui-linkbutton" iconCls="icon-save" plain="true" data-cmd="save">保存</a>
		<a class="easyui-linkbutton" iconCls="icon-cancel" plain="true" data-cmd="cancel">取消</a>
	</div>
</body>
</html>