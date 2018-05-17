package com.tangerineSpecter.crm.service;

import java.util.List;

import com.tangerineSpecter.crm.domain.Employee;
import com.tangerineSpecter.crm.page.PageResult;
import com.tangerineSpecter.crm.query.EmployeeQueryObject;

public interface IEmployeeService {
    int deleteByPrimaryKey(Long id);

    int insert(Employee record);

    Employee selectByPrimaryKey(Long id);

    List<Employee> selectAll();

    int updateByPrimaryKey(Employee record);

	Employee getEmployeeForLogin(String username, String password);

	PageResult queryForPage(EmployeeQueryObject qo);

	void updateStatus(Long id);

}
