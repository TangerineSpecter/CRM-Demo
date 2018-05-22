package com.tangerineSpecter.crm.mapper;

import com.tangerineSpecter.crm.domain.Role;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface RoleMapper {
	int deleteByPrimaryKey(Long id);

	int insert(Role record);

	Role selectByPrimaryKey(Long id);

	List<Role> selectAll();

	int updateByPrimaryKey(Role record);

	void insertRelation(@Param("rid") Long rid, @Param("pid") Long pid);
}