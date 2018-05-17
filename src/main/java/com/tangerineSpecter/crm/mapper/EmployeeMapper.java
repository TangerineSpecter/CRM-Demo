package com.tangerineSpecter.crm.mapper;

import com.tangerineSpecter.crm.domain.Employee;
import com.tangerineSpecter.crm.query.EmployeeQueryObject;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface EmployeeMapper {
	int deleteByPrimaryKey(Long id);

	int insert(Employee record);

	Employee selectByPrimaryKey(Long id);

	List<Employee> selectAll();

	int updateByPrimaryKey(Employee record);

	Employee getEmployeeForLogin(@Param("username") String username, @Param("password") String password);

	List<Employee> queryForPage(EmployeeQueryObject qo);

	Long queryForPageCount(EmployeeQueryObject qo);

	void updateStatus(Long id);
}