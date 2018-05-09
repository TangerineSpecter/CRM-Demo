package com.tangerineSpecter.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tangerineSpecter.crm.domain.Log;
import com.tangerineSpecter.crm.mapper.LogMapper;
import com.tangerineSpecter.crm.service.ILogService;

@Service
public class LogServiceImpl implements ILogService {

	@Autowired
	private LogMapper logMapper;

	@Override
	public int deleteByPrimaryKey(Long id) {
		return logMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Log record) {
		return logMapper.insert(record);
	}

	@Override
	public Log selectByPrimaryKey(Long id) {
		return logMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Log> selectAll() {
		return logMapper.selectAll();
	}

	@Override
	public int updateByPrimaryKey(Log record) {
		return logMapper.updateByPrimaryKey(record);
	}

}
