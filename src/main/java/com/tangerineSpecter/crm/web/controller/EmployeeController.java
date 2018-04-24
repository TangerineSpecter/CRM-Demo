package com.tangerineSpecter.crm.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tangerineSpecter.crm.domain.Employee;
import com.tangerineSpecter.crm.page.PageResult;
import com.tangerineSpecter.crm.query.EmployeeQueryOjbect;
import com.tangerineSpecter.crm.service.IEmployeeService;
import com.tangerineSpecter.crm.util.UserContext;

/**
 * 员工管理控制
 * 
 * @author 丢失的橘子
 */
@Controller
public class EmployeeController {

	@Autowired
	private IEmployeeService employeeService;

	@RequestMapping("/employee")
	public String index() {
		return "employee";
	}

	/**
	 * 员工管理列表
	 */
	@ResponseBody
	@RequestMapping("/employee_list")
	public PageResult list(EmployeeQueryOjbect qo) {
		PageResult result = null;
		result = employeeService.queryForPage(qo);
		return result;
	}

	/**
	 * 员工登录
	 */
	@ResponseBody
	@RequestMapping("/login")
	public Map<String, Object> login(String username, String password, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		Employee currentUser = employeeService.getEmployeeForLogin(username, password);
		if (currentUser != null) {
			session.setAttribute(UserContext.USER_IN_SESSION, currentUser);
			result.put("success", true);
			result.put("msg", "登陆成功");
		} else {
			result.put("success", false);
			result.put("msg", "登陆失败");
		}
		return result;
	}
}
