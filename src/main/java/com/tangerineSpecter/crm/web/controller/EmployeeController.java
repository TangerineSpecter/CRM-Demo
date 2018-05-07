package com.tangerineSpecter.crm.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tangerineSpecter.crm.domain.Employee;
import com.tangerineSpecter.crm.page.PageResult;
import com.tangerineSpecter.crm.query.EmployeeQueryOjbect;
import com.tangerineSpecter.crm.service.IEmployeeService;
import com.tangerineSpecter.crm.util.AjaxResult;
import com.tangerineSpecter.crm.util.UserContext;

/**
 * 员工管理控制
 * 
 * @author 丢失的橘子
 */
@Controller
public class EmployeeController {
	AjaxResult result = null;

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
	 * 新增员工
	 */
	@ResponseBody
	@RequestMapping("/employee_save")
	public AjaxResult save(Employee emp) {
		try {
			emp.setPassword("123456");
			emp.setAdmin(false);
			emp.setStatus(true);
			employeeService.insert(emp);
			result = new AjaxResult(true, "保存成功");
		} catch (Exception e) {
			e.printStackTrace();
			result = new AjaxResult(false, "保存异常");
		}
		return result;
	}

	/**
	 * 修改员工
	 */
	@ResponseBody
	@RequestMapping("/employee_update")
	public AjaxResult update(Employee emp) {
		try {
			employeeService.updateByPrimaryKey(emp);
			result = new AjaxResult(true, "更新成功");
		} catch (Exception e) {
			e.printStackTrace();
			result = new AjaxResult(false, "更新异常");
		}
		return result;
	}

	/**
	 * 删除员工
	 */
	@ResponseBody
	@RequestMapping("/employee_delete")
	public AjaxResult delete(Long id) {
		try {
			employeeService.updateStatus(id);
			result = new AjaxResult(true, "更新成功");
		} catch (Exception e) {
			e.printStackTrace();
			result = new AjaxResult(false, "更新异常");
		}
		return result;
	}

	/**
	 * 员工登录
	 */
	@ResponseBody
	@RequestMapping("/login")
	public AjaxResult login(String username, String password, HttpSession session) {
		Employee currentUser = employeeService.getEmployeeForLogin(username, password);
		if (currentUser != null) {
			session.setAttribute(UserContext.USER_IN_SESSION, currentUser);
			result = new AjaxResult(true, "登陆成功");
		} else {
			result = new AjaxResult(false, "登陆失败");
		}
		return result;
	}
}
