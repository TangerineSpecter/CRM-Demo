package com.tangerineSpecter.crm.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Role {
	private Long id;
	private String name;
	private String sn;
	private List<Permission> permissions = new ArrayList<Permission>();

}