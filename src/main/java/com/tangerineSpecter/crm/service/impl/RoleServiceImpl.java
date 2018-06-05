package com.tangerineSpecter.crm.service.impl;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tangerineSpecter.crm.domain.Permission;
import com.tangerineSpecter.crm.domain.Role;
import com.tangerineSpecter.crm.mapper.RoleMapper;
import com.tangerineSpecter.crm.page.PageResult;
import com.tangerineSpecter.crm.query.RoleQueryObject;
import com.tangerineSpecter.crm.service.IRoleService;

@Service
public class RoleServiceImpl implements IRoleService {

	@Autowired
	private RoleMapper roleDao;

	@Override
	public int deleteByPrimaryKey(Long id) {
		// 删除关系
		roleDao.deleteByPrimaryByRid(id);
		int effectCount = roleDao.deleteByPrimaryKey(id);
		return effectCount;
	}

	@Override
	public int insert(Role record) {
		int effectCount = roleDao.insert(record);
		for (Permission p : record.getPermissions()) {
			roleDao.insertRelation(record.getId(), p.getId());
		}
		return effectCount;
	}

	@Override
	public Role selectByPrimaryKey(Long id) {
		return roleDao.selectByPrimaryKey(id);
	}

	@Override
	public List<Role> selectAll() {
		return roleDao.selectAll();
	}

	@Override
	public int updateByPrimaryKey(Role record) {
		int effectCount = roleDao.updateByPrimaryKey(record);
		// 删除以前的关系
		roleDao.deleteByPrimaryByRid(record.getId());
		// 添加新的关系
		for (Permission p : record.getPermissions()) {
			roleDao.insertRelation(record.getId(), p.getId());
		}
		return effectCount;
	}

	@Override
	public PageResult queryForPage(RoleQueryObject qo) {
		// 查询总计的记录数
		Long count = roleDao.queryPageCount(qo);
		if (count == 0) {
			return new PageResult(0, Collections.EMPTY_LIST);
		}
		List<Role> result = roleDao.queryPage(qo);
		return new PageResult(count.intValue(), result);
	}
}
