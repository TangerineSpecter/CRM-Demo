package com.tangerineSpecter.crm.service;

import java.util.List;

import com.tangerineSpecter.crm.domain.Role;
import com.tangerineSpecter.crm.page.PageResult;
import com.tangerineSpecter.crm.query.RoleQueryObject;

public interface IRoleService {
	int deleteByPrimaryKey(Long id);

	int insert(Role record);

	Role selectByPrimaryKey(Long id);

	List<Role> selectAll();

	int updateByPrimaryKey(Role record);

	PageResult queryForPage(RoleQueryObject qo);

}
