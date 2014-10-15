package com.eoutletz.persist.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.eoutletz.persist.db.IdEntity;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "Payment_Type")
@JsonIgnoreProperties(ignoreUnknown = true)
public class PaymentType extends IdEntity<PaymentType> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6778310087309472867L;
	
	@Column(name = "type", nullable = false)
	private String type;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "paymentType")
	private Set<Order> orders = new HashSet<Order>(0);

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	
}
