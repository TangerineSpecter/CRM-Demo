package com.tangerineSpecter.crm.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Employee {
	private Long id;
	private String username;
	private String realname;
	private String password;
	private String numberPhone;
	private String email;
	private Department dept;
	private Date inputTime;
	private Boolean status;
	private Boolean admin;

}