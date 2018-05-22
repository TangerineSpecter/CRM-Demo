package com.tangerineSpecter.crm.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tangerineSpecter.crm.domain.Role;
import com.tangerineSpecter.crm.service.IRoleService;
import com.tangerineSpecter.crm.util.AjaxResult;

/**
 * 角色管理控制
 * 
 * @author 丢失的橘子
 *
 */
@Controller
public class RoleController {

	@Autowired
	private IRoleService roleService;

	@RequestMapping("/role_save")
	@ResponseBody
	public AjaxResult save(Role role) {
		AjaxResult result = null;
		try {
			roleService.insert(role);
			result = new AjaxResult(true, "保存成功");
		} catch (Exception e) {
			result = new AjaxResult("保存异常，请联系管理员");
		}
		return result;
	}

	@RequestMapping("/role")
	public String index() {
		return "role";
	}
}
