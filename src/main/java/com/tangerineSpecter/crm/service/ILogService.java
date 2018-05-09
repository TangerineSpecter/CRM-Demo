package com.tangerineSpecter.crm.service;

import java.util.List;

import com.tangerineSpecter.crm.domain.Log;

public interface ILogService {
	int deleteByPrimaryKey(Long id);

	int insert(Log record);

	Log selectByPrimaryKey(Long id);

	List<Log> selectAll();

	int updateByPrimaryKey(Log record);
}
