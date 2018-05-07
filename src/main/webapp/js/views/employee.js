$(function() {
	var empDatagrid, empDatagridEditAndDel, empDialog, empForm, empFormId;
	empDatagrid = $("#emp_datagrid");
	empDatagridEditAndDel = $("#emp_datagrid_edit,#emp_datagrid_del");
	empDialog = $("#emp_dialog");
	empForm = $("#emp_form");
	empFormId = $("#emp_form [name='id']");
	empDatagrid.datagrid({
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
				empDatagridEditAndDel.linkbutton("enable");
			} else {
				// 禁用按钮
				empDatagridEditAndDel.linkbutton("disable");
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
	empDialog.dialog({
		width : 250,
		height : 300,
		buttons : "#emp_dialog_bt",
		closed : true
	});

	// 统计方法管理
	var cmdObj = {
		// 新增员工
		add : function() {
			empDialog.dialog("open");
			empDialog.dialog("setTitle", "新增");
			empForm.form("clear");
		},
		// 编辑员工
		update : function() {
			// 获取选中的数据
			var rowData = empDatagrid.datagrid("getSelected");
			if (rowData) {
				empDialog.dialog("open");
				empDialog.dialog("setTitle", "编辑");
				empForm.form("clear");
				// 处理特殊属性
				if (rowData.dept) {
					rowData["dept.id"] = rowData.dept.id;
				}
				empForm.form("load", rowData);
			} else {
				$.messager.alert("温馨提示", "请选中一条需要编辑的数据！", "info");
			}
		},
		// 员工离职
		del : function() {
			// 获取选中的数据
			var rowData = empDatagrid.datagrid("getSelected");
			if (rowData) {
				$.messager.confirm("温馨提示", "您确定需要离职这个员工吗？", function(yes) {
					if (yes) {
						$.get("/employee_delete?id=" + rowData.id, function(
								data) {
							if (data.success) {
								// 刷新数据表格
								empDatagrid.datagrid("reload");
							} else {
								$.messager.alert("温馨提示", data.msg, "info");
							}
						}, "JSON");
					}
				});
			} else {
				$.messager.alert("温馨提示", "请选中需要离职的员工！", "info");
			}
		},
		// 刷新列表
		refresh : function() {
			empDatagrid.datagrid("reload");
		},
		// 保存提交
		save : function() {
			var idVal = empFormId.val();
			var url;
			if (idVal) {
				url = '/employee_update';
			} else {
				url = '/employee_save';
			}
			empForm.form("submit", {
				url : url,
				success : function(data) {
					data = $.parseJSON(data);
					if (data.success) {
						$.messager.alert("提示", data.msg, "info", function() {
							// 关闭对话框
							empDialog.dialog("close");
							// 刷新页面
							empDatagrid.datagrid("load");
						});
					} else {
						$.messager.alert('提示', data.msg, "info");
					}
				}
			})
		},
		// 关闭窗口
		cancel : function() {
			empDialog.dialog("close");
		},
		// 搜索框
		searchBtn : function() {
			var keyWord = $("[name='keyWord']").val();
			empDatagrid.datagrid("load", {
				keyWord : keyWord
			});
		},
		// 清空搜索框
		cleanBtn : function() {
			$("[name='keyWord']").val('');
			empDatagrid.datagrid("load", {
				keyWord : ''
			});
		}
	};
	// 对所有按钮进行监听
	$("a[data-cmd]").on("click", function() {
		var cmd = $(this).data("cmd");
		if (cmd) {
			cmdObj[cmd]();
		}
	})
})
