$(function() {
	$('#emp_datagrid').datagrid({
		fit : true,
		fitColumns : true,
		url : '/employee_list',
		rownumbers : true,
		pagination : true,
		toolbar : "#emp_datagrid_tb",
		pageList : [ 10, 20, 30, 50, 100 ],
		columns : [ [ {
			field : 'username',
			algin : 'center',
			title : '用户名',
			width : 100
		}, {
			field : 'realname',
			algin : 'center',
			title : '真实姓名',
			width : 100
		}, {
			field : 'phoneNumber',
			algin : 'center',
			title : '电话',
			width : 100
		}, {
			field : 'email',
			algin : 'center',
			title : '邮箱',
			width : 100
		}, {
			field : 'dept',
			algin : 'center',
			title : '部门',
			width : 100
		}, {
			field : 'inputTime',
			algin : 'center',
			title : '入职时间',
			width : 100
		}, {
			field : 'status',
			algin : 'center',
			title : '状态',
			width : 100
		}, {
			field : 'admin',
			algin : 'center',
			title : '是否超级管理员',
			width : 100
		} ] ]
	})

	// 新增/编辑窗口
	$("#emp_dialog").dialog({
		width : 250,
		height : 300,
		buttons : "#emp_dialog_bt",
		closed : true
	})
})

// 新增员工
function add() {
	$("#emp_dialog").dialog("open");
	$("#emp_dialog").dialog("setTitle", "新增");
	$("#emp_form").form("clear");
}

// 编辑员工
function update() {
	$("#emp_dialog").dialog("open");
	$("#emp_dialog").dialog("setTitle", "编辑");
}

// 删除员工
function del() {

}

// 刷新列表
function refresh() {
	$("#emp_datagrid").datagrid("reload");
}

// 保存提交
function save() {

}

// 关闭窗口
function cancel() {
	$("#emp_dialog").dialog("close");
}