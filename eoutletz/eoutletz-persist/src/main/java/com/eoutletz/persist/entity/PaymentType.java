package com.eoutletz.persist.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.eoutletz.persist.db.IdEntity;

@Entity
@Table(name = "Payment_Type")
public class PaymentType extends IdEntity<PaymentType> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6778310087309472867L;
	
	@Column(name = "type", nullable = false)
	private String type;
	
	private Set<Order> orders = new HashSet<Order>(0);

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "paymentType")
	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

}
