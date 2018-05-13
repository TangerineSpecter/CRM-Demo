package com.tangerineSpecter.crm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 角色管理控制
 * 
 * @author 丢失的橘子
 *
 */
@Controller
public class RoleController {
 
	@RequestMapping("/role")
	public String index() {
		return "role";
	}
}
