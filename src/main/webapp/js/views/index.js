$(function(){
	$("#crm_layout").layout({
		fit:true,
		
	});
	$("#menu").tree({
		url:"/js/data/menu.json",
		
		onClick:function(node){
			// 在新增之前判断选择卡有没有该节点的面板
			if ($("#menu_tabs").tabs("exists", node.text)) {
				// 如果有 选中即可 不需要创建
				$("#menu_tabs").tabs("select",node.text);
			} else {
				// 如果没有则新增
				$("#menu_tabs").tabs("add", {
					title : node.text,
					closable : true,
					
					// 节点中不具备的属性.给他也获取不到,自定义的属性需要
					// 添加到attributes
					//href : node.attributes.url,//只能加载body中的,
					content:'<iframe src="'+node.attributes.url+'" style="width:100%;height:99%" frameborder=0><iframe>',
					//loadingMessage:"我在拼命的加载"
				});
			}
		}
		
	});
	$("#menu_tabs").tabs({
		fit : true,
		
	});
	
});