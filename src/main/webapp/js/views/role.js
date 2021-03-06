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
		url : '/role_list',
		rownumbers : true,
		pagination : true,
		toolbar : "#role_datagrid_tb",
		pageList : [ 10, 20, 30, 50, 100 ],
		singleSelect : true,
		columns : [ [ {
			title : '角色编号',
			field : 'sn',
			width : 100,
			align : 'center'
		}, {
			title : '角色名称',
			field : 'name',
			width : 100,
			align : 'center'
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
	});

	var allPager = allPermissions.datagrid("getPager");
	allPager.pagination({
		showPageList : false,
		showRefresh : false,
		displayMsg : ''
	});

	selfPermissions.datagrid({
		width : 300,
		height : 300,
		title : "已有的权限",
		fitColumns : true,
		rownumbers : true,
		pagination : true,
		singleSelect : true,
		onDblClickRow : function(rowIndex, rowData) {
			selfPermissions.datagrid("deleteRow", rowIndex);
		},
		columns : [ [ {
			title : "权限名",
			field : "name",
			width : 1,
			align : "center"
		} ] ]
	});

	var selfPager = selfPermissions.datagrid("getPager");
	selfPager.pagination({
		showPageList : false,
		showRefresh : false,
		displayMsg : ''
	});

	// 统计方法管理
	var cmdObj = {
		// 新增员工
		add : function() {
			roleDialog.dialog("open");
			roleDialog.dialog("setTitle", "新增");
			$("[name='id'],[name='sn'],[name='name']").val("");
		},
		// 编辑员工
		update : function() {
			// 获取选中的数据
			var rowData = roleDatagrid.datagrid("getSelected");
			if (rowData) {
				roleDialog.dialog("open");
				roleDialog.dialog("setTitle", "编辑");
				$("[name='id'],[name='sn'],[name='name']").val("");
				// 处理特殊属性
				if (rowData.dept) {
					rowData["dept.id"] = rowData.dept.id;
				}
				// 需要查询该角色的权限
				var options = selfPermissions.datagrid("options");
				options.url = "/permission_queryByRid";
				selfPermissions.datagrid("load", {
					rid : rowData.id
				});
				roleForm.form("load", rowData);
			} else {
				$.messager.alert("温馨提示", "请选中一条需要编辑的数据！", "info");
			}
		},
		// 角色移除
		del : function() {
			// 获取选中的数据
			var rowData = roleDatagrid.datagrid("getSelected");
			if (rowData) {
				$.messager.confirm("温馨提示", "您确定需要移除这个角色吗？", function(yes) {
					if (yes) {
						$.get("/role_delete?id=" + rowData.id, function(data) {
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
				url = '/role_update';
			} else {
				url = '/role_save';
			}
			roleForm.form("submit", {
				url : url,
				// 给表单添加额外参数
				onSubmit : function(param) {
					var rows = selfPermissions.datagrid("getRows");
					for (var i = 0; i < rows.length; i++) {
						param["permissions[" + i + "].id"] = rows[i].id;
					}
				},
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
