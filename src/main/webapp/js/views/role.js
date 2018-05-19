$(function() {
	var roleDatagrid, roleDatagridEditAndDel, roleDialog, roleForm, roleFormId, allPermissions, selfPermissions;
	roleDatagrid = $("#role_datagrid");
	roleDatagridEditAndDel = $("#role_datagrid_edit,#role_datagrid_del");
	roleDialog = $("#role_dialog");
	roleForm = $("#role_form");
	roleFormId = $("#role_form [name='id']");
	allPermissions = $("#allPermissions");
	selfPermissions = $("#selfPermissions");
	roleDatagrid.datagrid({
		fit : true,
		fitColumns : true,
		url : '/roleloyee_list',
		rownumbers : true,
		pagination : true,
		toolbar : "#role_datagrid_tb",
		pageList : [ 10, 20, 30, 50, 100 ],
		singleSelect : true,
		onClickRow : function(rowIndex, rowData) {
			if (rowData.status) {
				roleDatagridEditAndDel.linkbutton("enable");
			} else {
				// 禁用按钮
				roleDatagridEditAndDel.linkbutton("disable");
			}
		},
		columns : [ [ {
			field : 'sn',
			algin : 'center',
			title : '角色编号',
			width : 100
		}, {
			field : 'name',
			algin : 'center',
			title : '角色名称',
			width : 100
		} ] ]
	})

	// 新增/编辑窗口
	roleDialog.dialog({
		width : 700,
		height : 450,
		buttons : "#role_dialog_bt",
		closed : true
	});

	allPermissions.datagrid({
		width : 300,
		height : 300,
		title : "所有的权限",
		url : '/permission_list',
		fitColumns : true,
		rownumbers : true,
		pagination : true,
		singleSelect : true,
		onDblClickRow : function(rowIndex, rowData) {
			// 判断selfPermissions是否有这条记录
			var rows = selfPermissions.datagrid("getRows");
			var flag = true;
			var index = -1;
			for (var i = 0; i < rows.length; i++) {
				if (rows[i].id == rowData.id) {
					// 已存在
					flag = false;
					index = i;
					break;
				}
			}
			if (flag) {
				// 拿到selfPermissions
				selfPermissions.datagrid("appendRow", rowData);
			} else {
				selfPermissions.datagrid("selectRow", index);
			}
		},
		columns : [ [ {
			title : "权限名",
			field : "name",
			width : 1,
			align : "center"
		} ] ]
	})

	var pager = allPermissions.datagrid("getPager");
	pager.pagination({
		showPageList : false,
		showRefresh : false,
		displayMsg : ''
	})

	selfPermissions.datagrid({
		width : 300,
		height : 300,
		title : "已有的权限",
		fitColumns : true,
		rownumbers : true,
		singleSelect : true,
		columns : [ [ {
			title : "权限名",
			field : "name",
			width : 1,
			align : "center"
		} ] ]
	})

	// 统计方法管理
	var cmdObj = {
		// 新增员工
		add : function() {
			roleDialog.dialog("open");
			roleDialog.dialog("setTitle", "新增");
			roleForm.form("clear");
		},
		// 编辑员工
		update : function() {
			// 获取选中的数据
			var rowData = roleDatagrid.datagrid("getSelected");
			if (rowData) {
				roleDialog.dialog("open");
				roleDialog.dialog("setTitle", "编辑");
				roleForm.form("clear");
				// 处理特殊属性
				if (rowData.dept) {
					rowData["dept.id"] = rowData.dept.id;
				}
				roleForm.form("load", rowData);
			} else {
				$.messager.alert("温馨提示", "请选中一条需要编辑的数据！", "info");
			}
		},
		// 员工离职
		del : function() {
			// 获取选中的数据
			var rowData = roleDatagrid.datagrid("getSelected");
			if (rowData) {
				$.messager.confirm("温馨提示", "您确定需要离职这个员工吗？", function(yes) {
					if (yes) {
						$.get("/roleloyee_delete?id=" + rowData.id, function(
								data) {
							if (data.success) {
								// 刷新数据表格
								roleDatagrid.datagrid("reload");
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
			roleDatagrid.datagrid("reload");
		},
		// 保存提交
		save : function() {
			var idVal = roleFormId.val();
			var url;
			if (idVal) {
				url = '/roleloyee_update';
			} else {
				url = '/roleloyee_save';
			}
			roleForm.form("submit", {
				url : url,
				success : function(data) {
					data = $.parseJSON(data);
					if (data.success) {
						$.messager.alert("提示", data.msg, "info", function() {
							// 关闭对话框
							roleDialog.dialog("close");
							// 刷新页面
							roleDatagrid.datagrid("load");
						});
					} else {
						$.messager.alert('提示', data.msg, "info");
					}
				}
			})
		},
		// 关闭窗口
		cancel : function() {
			roleDialog.dialog("close");
		},
		// 搜索框
		searchBtn : function() {
			var keyWord = $("[name='keyWord']").val();
			roleDatagrid.datagrid("load", {
				keyWord : keyWord
			});
		},
		// 清空搜索框
		cleanBtn : function() {
			$("[name='keyWord']").val('');
			roleDatagrid.datagrid("load", {
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
