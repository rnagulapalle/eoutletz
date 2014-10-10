package com.eoutletz.persist.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.eoutletz.persist.db.IdEntity;

@Entity
@Table(name = "Partner")
public class Partner extends IdEntity<Partner> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Column(name = "email", unique = true)
	private String email;
	
	@Column(name = "name")
	private String name;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
