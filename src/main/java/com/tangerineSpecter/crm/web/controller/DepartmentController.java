package com.tangerineSpecter.crm.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tangerineSpecter.crm.domain.Department;
import com.tangerineSpecter.crm.service.IDepartmentService;

/**
 * 部门管理控制
 * 
 * @author 丢失的橘子
 *
 */
@Controller
public class DepartmentController {

	@Autowired
	private IDepartmentService departmentService;

	@ResponseBody
	@RequestMapping("/department_queryForEmp")
	public List<Department> queryForEmp() {
		List<Department> result = null;
		result = departmentService.queryForEmp();
		return result;
	}
}
