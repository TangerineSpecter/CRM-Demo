package com.tangerineSpecter.crm.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date inputTime;
	private Boolean status;
	private Boolean admin;

}