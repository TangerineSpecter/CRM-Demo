package com.tangerineSpecter.crm.service;

import java.util.List;

import com.tangerineSpecter.crm.domain.Permission;
import com.tangerineSpecter.crm.page.PageResult;
import com.tangerineSpecter.crm.query.PermissionQueryObject;

public interface IPermissionService {
	int deleteByPrimaryKey(Long id);

	int insert(Permission record);

	Permission selectByPrimaryKey(Long id);

	List<Permission> selectAll();

	int updateByPrimaryKey(Permission record);

	PageResult queryForPage(PermissionQueryObject qo);

}
