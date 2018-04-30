package com.tangerineSpecter.crm.query;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmployeeQueryOjbect {
	private Integer page;
	private Integer rows;
	private String keyWord;

	public Integer getStart() {
		return (this.page - 1) * this.rows;
	}
}
