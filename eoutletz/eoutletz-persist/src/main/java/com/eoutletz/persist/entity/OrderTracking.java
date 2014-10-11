package com.eoutletz.persist.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.eoutletz.persist.db.IdEntity;

@Entity
@Table(name = "Order_Tracking",
uniqueConstraints = { @UniqueConstraint(columnNames = { "tracking_number", "order_id", "order_status_id" }) })
public class OrderTracking extends IdEntity<OrderTracking> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Column(name = "tracking_number", nullable = false)
	private String trackingNumber;
	
	@Column(name = "comments")
	private String comments;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "order_id")
	private Order order;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "order_status_id")
	private OrderStatus orderStatus;

	public String getTrackingNumber() {
		return trackingNumber;
	}

	public void setTrackingNumber(String trackingNumber) {
		this.trackingNumber = trackingNumber;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public OrderStatus getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}
}
