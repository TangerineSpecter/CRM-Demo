package com.tangerineSpecter.crm.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Employee {
	private Long id;
	private String username;
	private String realname;
	private String password;
	private String phoneNumber;
	private String email;
	private Department dept;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date inputTime;
	private Boolean status;
	private Boolean admin;

}