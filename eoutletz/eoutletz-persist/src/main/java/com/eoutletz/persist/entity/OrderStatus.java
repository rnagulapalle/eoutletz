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

@Entity
@Table(name = "Order_Status")
public class OrderStatus extends IdEntity<OrderStatus> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4390919623174919126L;
	@Column(name = "status", nullable = false)
	private Integer status;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "orderStatus")
	private Set<OrderTracking> orderTrackings = new HashSet<OrderTracking>(0);
	
	public Set<OrderTracking> getOrderTrackings() {
		return orderTrackings;
	}

	public void setOrderTrackings(Set<OrderTracking> orderTrackings) {
		this.orderTrackings = orderTrackings;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}
