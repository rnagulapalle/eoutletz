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
@Table(name = "Order_Status")
@JsonIgnoreProperties(ignoreUnknown = true)
public class OrderStatus extends IdEntity<OrderStatus> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4390919623174919126L;
	@Column(name = "status", nullable = false)
	private Long status;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "orderStatus")
	private Set<OrderTracking> orderTrackings = new HashSet<OrderTracking>(0);
	
	public Set<OrderTracking> getOrderTrackings() {
		return orderTrackings;
	}

	public void setOrderTrackings(Set<OrderTracking> orderTrackings) {
		this.orderTrackings = orderTrackings;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}
	
	
}
