<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>员工管理</title>
<%@include file="common.jsp"%>
<script type="text/javascript" src="/js/views/employee.js"></script>
</head>
<body>
	<table id="emp_datagrid"></table>
	<!-- 数据表格的顶部按钮 -->
	<div id="emp_datagrid_tb">
		<div>
			<a class="easyui-linkbutton" iconCls="icon-add" plain="true" data-cmd="add">新增</a>
			<a id="emp_datagrid_edit" class="easyui-linkbutton" iconCls="icon-edit" plain="true" data-cmd="update">编辑</a>
			<a id="emp_datagrid_del" class="easyui-linkbutton" iconCls="icon-remove" plain="true" data-cmd="del">离职</a>
			<a class="easyui-linkbutton" iconCls="icon-reload" plain="true" data-cmd="refresh")>刷新</a>
		</div>
		<div>
			关键字查询：<input name="keyWord" />
			<a class="easyui-linkbutton" iconCls="icon-search" data-cmd="searchBtn">搜索</a>
			<a class="easyui-linkbutton" iconCls="icon-search" data-cmd="cleanBtn">清空</a>
		</div>
	</div>
	<!-- 新增/更新员工窗口 -->
	<div id="emp_dialog">
		<form id="emp_form" method="post">
			<table align="center">
				<input type="hidden" name="id"/>
				<tr>
					<td>帐号</td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>真实姓名</td>
					<td><input type="text" name="realname"></td>
				</tr>
				<tr>
					<td>联系方式</td>
					<td><input type="text" name="phoneNumber"></td>
				</tr>
				<tr>
					<td>邮箱</td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td>部门</td>
					<td><input type="text" name="dept.id" class="easyui-combobox" 
					data-options="valueField:'id',textField:'name',url:'/department_queryForEmp'" editable="editable"></td>
				</tr>
				<tr>
					<td>入职时间</td>
					<td><input type="text" name="inputTime" class="easyui-datebox"></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 窗口底部按钮 -->
	<div id="emp_dialog_bt">
		<a class="easyui-linkbutton" iconCls="icon-save" plain="true" data-cmd="save">保存</a>
		<a class="easyui-linkbutton" iconCls="icon-cancel" plain="true" data-cmd="cancel">取消</a>
	</div>
</body>
</html>