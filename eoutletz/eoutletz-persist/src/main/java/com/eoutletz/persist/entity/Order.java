package com.eoutletz.persist.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.eoutletz.persist.db.IdEntity;

@Entity
@Table(name = "Order")
public class Order extends IdEntity<Order> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4497790493819373238L;

	@ManyToOne(cascade=CascadeType.ALL)
		@JoinColumn(name = "user_id")
	private User user;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "address_id")
	private Address address;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "payment_type_id")
	private PaymentType paymentType;
	
	private Set<Product> products = new HashSet<Product>(0);

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "orders")
	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public PaymentType getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(PaymentType paymentType) {
		this.paymentType = paymentType;
	}
}
