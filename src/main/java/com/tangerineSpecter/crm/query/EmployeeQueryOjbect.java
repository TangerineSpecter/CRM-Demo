package com.tangerineSpecter.crm.query;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmployeeQueryOjbect {
	private Integer page;
	private Integer rows;

	public Integer getStart() {
		return (this.page - 1) * this.rows;
	}
}
