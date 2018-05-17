package com.tangerineSpecter.crm.service.impl;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tangerineSpecter.crm.domain.Permission;
import com.tangerineSpecter.crm.mapper.PermissionMapper;
import com.tangerineSpecter.crm.page.PageResult;
import com.tangerineSpecter.crm.query.PermissionQueryObject;
import com.tangerineSpecter.crm.service.IPermissionService;

@Service
public class PermissionServiceImpl implements IPermissionService {

	@Autowired
	private PermissionMapper permissionDao;

	@Override
	public int deleteByPrimaryKey(Long id) {
		return permissionDao.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Permission record) {
		return permissionDao.insert(record);
	}

	@Override
	public Permission selectByPrimaryKey(Long id) {
		return permissionDao.selectByPrimaryKey(id);
	}

	@Override
	public List<Permission> selectAll() {
		return permissionDao.selectAll();
	}

	@Override
	public int updateByPrimaryKey(Permission record) {
		return permissionDao.updateByPrimaryKey(record);
	}

	@Override
	public PageResult queryForPage(PermissionQueryObject qo) {
		// 查询总计的记录数
		Long count = permissionDao.queryPageCount(qo);
		if (count == 0) {
			return new PageResult(0, Collections.EMPTY_LIST);
		}
		List<Permission> result = permissionDao.queryPage(qo);
		return new PageResult(count.intValue(), result);
	}
}
