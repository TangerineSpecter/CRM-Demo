$(function() {
	$('#emp_datagrid').datagrid({
		fit : true,
		fitColumns : true,
		url : '/employee_list',
		rownumbers : true,
		pagination : true,
		toolbar : "#emp_datagrid_tb",
		pageList : [ 10, 20, 30, 50, 100 ],
		singleSelect : true,
		onClickRow : function(rowIndex, rowData) {
			if (rowData.status) {
				$("#emp_datagrid_tb a").eq(1).linkbutton("enable");
				$("#emp_datagrid_tb a").eq(2).linkbutton("enable");
			} else {
				// 禁用按钮
				$("#emp_datagrid_tb a").eq(1).linkbutton("disable");
				$("#emp_datagrid_tb a").eq(2).linkbutton("disable");
			}
		},
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
			width : 100,
			formatter : function(value, row, index) {
				return value ? value.name : "";
			}
		}, {
			field : 'inputTime',
			algin : 'center',
			title : '入职时间',
			width : 100
		}, {
			field : 'status',
			algin : 'center',
			title : '状态',
			width : 100,
			formatter : function(value, row, index) {
				if (value) {
					return "<font color='green'>正常</font>";
				}
				return "<font color='red'>离职</font>";
			}
		}, {
			field : 'admin',
			algin : 'center',
			title : '是否超级管理员',
			width : 100,
			formatter : function(value, row, index) {
				if (value) {
					return "是";
				}
				return "否";
			}
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
	// 获取选中的数据
	var rowData = $("#emp_datagrid").datagrid("getSelected");
	if (rowData) {
		$("#emp_dialog").dialog("open");
		$("#emp_dialog").dialog("setTitle", "编辑");
		$("#emp_form").form("clear");
		// 处理特殊属性
		if (rowData.dept) {
			rowData["dept.id"] = rowData.dept.id;
		}
		$("#emp_form").form("load", rowData);
	} else {
		$.messager.alert("温馨提示", "请选中一条需要编辑的数据！", "info");
	}
}

// 员工离职
function del() {
	// 获取选中的数据
	var rowData = $("#emp_datagrid").datagrid("getSelected");
	if (rowData) {
		$.messager.confirm("温馨提示", "您确定需要离职这个员工吗？", function(yes) {
			if (yes) {
				$.get("/employee_delete?id=" + rowData.id, function(data) {
					if (data.success) {
						// 刷新数据表格
						$("#emp_datagrid").datagrid("reload");
					} else {
						$.messager.alert("温馨提示", data.msg, "info");
					}
				}, "JSON");
			}
		});
	} else {
		$.messager.alert("温馨提示", "请选中需要离职的员工！", "info");
	}
}

// 刷新列表
function refresh() {
	$("#emp_datagrid").datagrid("reload");
}

// 保存提交
function save() {
	var idVal = $("#emp_form [name='id']").val();
	var url;
	if (idVal) {
		url = '/employee_update';
	} else {
		url = '/employee_save';
	}
	$("#emp_form").form("submit", {
		url : url,
		success : function(data) {
			data = $.parseJSON(data);
			if (data.success) {
				$.messager.alert("提示", data.msg, "info", function() {
					// 关闭对话框
					$("#emp_dialog").dialog("close");
					// 刷新页面
					$("#emp_datagrid").datagrid("load");
				});
			} else {
				$.messager.alert('提示', data.msg, "info");
			}
		}
	})
}

// 关闭窗口
function cancel() {
	$("#emp_dialog").dialog("close");
}