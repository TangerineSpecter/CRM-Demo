package com.tangerineSpecter.crm.service;

import java.util.List;

import com.tangerineSpecter.crm.domain.Department;

public interface IDepartmentService {
	int deleteByPrimaryKey(Long id);

	int insert(Department record);

	Department selectByPrimaryKey(Long id);

	List<Department> selectAll();

	int updateByPrimaryKey(Department record);

	List<Department> queryForEmp();

}
