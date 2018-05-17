package com.tangerineSpecter.crm.mapper;

import com.tangerineSpecter.crm.domain.Permission;
import com.tangerineSpecter.crm.query.QueryObject;

import java.util.List;

public interface PermissionMapper {
	int deleteByPrimaryKey(Long id);

	int insert(Permission record);

	Permission selectByPrimaryKey(Long id);

	List<Permission> selectAll();

	int updateByPrimaryKey(Permission record);

	Long queryPageCount(QueryObject qo);

	List<Permission> queryPage(QueryObject qo);
}