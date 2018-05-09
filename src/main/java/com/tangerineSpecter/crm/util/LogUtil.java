package com.tangerineSpecter.crm.util;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tangerineSpecter.crm.domain.Employee;
import com.tangerineSpecter.crm.domain.Log;
import com.tangerineSpecter.crm.service.ILogService;

public class LogUtil {

	@Autowired
	private ILogService logService;

	public void writeLog(JoinPoint joinPoint) {
		// 防止切自己死循环
		if (joinPoint.getTarget() instanceof ILogService) {
			return;
		}
		// 通过request来拿用户信息
		HttpServletRequest request = UserContext.get();
		// 通过session获取当前用户
		Employee currentUser = (Employee) request.getSession().getAttribute(UserContext.USER_IN_SESSION);
		String ip = request.getRemoteAddr();
		System.out.println(ip);
		Log log = new Log();
		log.setOptime(new Date());
		log.setOpid(ip);
		log.setOpuser(currentUser);
		String function = joinPoint.getTarget().getClass().getName() + ":" + joinPoint.getSignature().getName();
		log.setFunction(function);
		ObjectMapper mapper = new ObjectMapper();
		String params;
		try {
			params = mapper.writeValueAsString(joinPoint.getArgs());
			log.setParams(params);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		logService.insert(log);
	}
}
