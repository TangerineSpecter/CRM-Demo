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
	 * 新增员工
	 */
	@ResponseBody
	@RequestMapping("/employee_save")
	public Map<String, Object> save(Employee emp) {
		Map<String, Object> result = new HashMap<>();
		try {
			emp.setPassword("123456");
			emp.setAdmin(false);
			emp.setStatus(true);
			employeeService.insert(emp);
			result.put("success", true);
			result.put("msg", "保存成功");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", "保存异常");
		}
		return result;
	}

	/**
	 * 修改员工
	 */
	@ResponseBody
	@RequestMapping("/employee_update")
	public Map<String, Object> update(Employee emp) {
		Map<String, Object> result = new HashMap<>();
		try {
			employeeService.updateByPrimaryKey(emp);
			result.put("success", true);
			result.put("msg", "更新成功");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", "更新异常");
		}
		return result;
	}

	/**
	 * 删除员工
	 */
	@ResponseBody
	@RequestMapping("/employee_delete")
	public Map<String, Object> delete(Long id) {
		Map<String, Object> result = new HashMap<>();
		try {
			employeeService.updateStatus(id);
			result.put("success", true);
			result.put("msg", "更新成功");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", "更新异常");
		}
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
