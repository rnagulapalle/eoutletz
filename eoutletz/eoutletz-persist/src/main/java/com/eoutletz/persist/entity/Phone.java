package com.eoutletz.persist.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.eoutletz.persist.db.IdEntity;

@Entity
@Table(name = "Phone")
public class Phone extends IdEntity<Phone> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 35733442766422447L;
	
	@Column(name = "type", nullable = false)
	private String type;
	
	@Column(name = "phone", nullable = false)
	private String phone;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "user_id")
	private User user;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
