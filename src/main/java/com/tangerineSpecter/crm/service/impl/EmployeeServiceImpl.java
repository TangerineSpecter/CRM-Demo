package com.tangerineSpecter.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tangerineSpecter.crm.domain.Employee;
import com.tangerineSpecter.crm.mapper.EmployeeMapper;
import com.tangerineSpecter.crm.service.IEmployeeService;

public class EmployeeServiceImpl implements IEmployeeService {

	@Autowired
	private EmployeeMapper employeeDao;

	@Override
	public int deleteByPrimaryKey(Long id) {
		return employeeDao.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Employee record) {
		return employeeDao.insert(record);
	}

	@Override
	public Employee selectByPrimaryKey(Long id) {
		return employeeDao.selectByPrimaryKey(id);
	}

	@Override
	public List<Employee> selectAll() {
		return employeeDao.selectAll();
	}

	@Override
	public int updateByPrimaryKey(Employee record) {
		return employeeDao.updateByPrimaryKey(record);
	}

	@Override
	public Employee getEmployeeForLogin(String username, String password) {
		return employeeDao.getEmployeeForLogin(username, password);
	}

}
