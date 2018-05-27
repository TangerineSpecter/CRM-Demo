package com.tangerineSpecter.crm.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tangerineSpecter.crm.page.PageResult;
import com.tangerineSpecter.crm.query.PermissionQueryObject;
import com.tangerineSpecter.crm.service.IPermissionService;

@Controller
public class PermissionController {
	@Autowired
	private IPermissionService permissionService;

	@RequestMapping("/permission_list")
	@ResponseBody
	public PageResult list(PermissionQueryObject qo) {
		PageResult result = null;
		result = permissionService.queryForPage(qo);
		return result;
	}

	@RequestMapping("/permission_queryByRid")
	@ResponseBody
	public PageResult queryByRid(PermissionQueryObject qo) {
		PageResult result = null;
		result = permissionService.queryForPage(qo);
		return result;
	}
}
