package com.eoutletz.persist.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.eoutletz.persist.db.IdEntity;

@Entity
@Table(name = "Address_Type")
public class AddressType extends IdEntity<AddressType> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Column(name = "type", nullable = false)
	private String type;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
