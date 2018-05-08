package com.tangerineSpecter.crm.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Log {
	private Long id;
	private Employee opuser;
	private Date optime;
	private String opid;
	private String function;
	private String params;

}