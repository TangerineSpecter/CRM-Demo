package com.tangerineSpecter.crm.mapper;

import com.tangerineSpecter.crm.domain.Department;
import java.util.List;

public interface DepartmentMapper {
	int deleteByPrimaryKey(Long id);

	int insert(Department record);

	Department selectByPrimaryKey(Long id);

	List<Department> selectAll();

	int updateByPrimaryKey(Department record);

	List<Department> queryForEmp();
}