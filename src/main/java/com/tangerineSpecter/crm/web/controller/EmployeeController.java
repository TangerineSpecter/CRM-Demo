package com.tangerineSpecter.crm.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.aspectj.asm.IElementHandleProvider;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmployeeController {
	

	@RequestMapping("/employee")
	public String index() {
		return "employee";
	}

	public Map<String, Object> login() {
		Map<String, Object> result = new HashMap<>();
		return null;
	}
}
