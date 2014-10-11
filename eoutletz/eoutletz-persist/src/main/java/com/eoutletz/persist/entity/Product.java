package com.eoutletz.persist.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.eoutletz.persist.db.IdEntity;

@Entity
@Table(name = "Product")
public class Product extends IdEntity<Product> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Column(name = "name", nullable = false)
	private String name;
	
	@Column(name = "sku", nullable = false)
	private String sku;
	
	@Column(name = "price", nullable = false)
	private Double price;
	
	@Column(name = "description", nullable = false)
	private String decription;
	
	@Column(name = "image", nullable = false)
	private String image;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "partner_id")
	private Partner partner;
	
	@Column(name = "quantity", nullable = false)
	private Integer quantity;
	
	@Column(name = "msrp", nullable = false)
	private Double msrp;
	
	@Column(name = "units_in_stock", nullable = false)
	private Integer unitsInStock;
	
	@Column(name = "unitsInOrder", nullable = false)
	private Integer unitsInOrder;
	
	@Column(name = "unit_price", nullable = false)
	private Double unitPrice;
	
	private Set<Category> categories = new HashSet<Category>(0);
	
	private Set<Color> colors = new HashSet<Color>(0);
	
	private Set<Size> size = new HashSet<Size>(0);
	
	private Set<Order> orders = new HashSet<Order>(0);

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getDecription() {
		return decription;
	}

	public void setDecription(String decription) {
		this.decription = decription;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Partner getPartner() {
		return partner;
	}

	public void setPartner(Partner partner) {
		this.partner = partner;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getMsrp() {
		return msrp;
	}

	public void setMsrp(Double msrp) {
		this.msrp = msrp;
	}

	public Integer getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(Integer unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public Integer getUnitsInOrder() {
		return unitsInOrder;
	}

	public void setUnitsInOrder(Integer unitsInOrder) {
		this.unitsInOrder = unitsInOrder;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "Product_Category", joinColumns = { 
			@JoinColumn(name = "product_id", nullable = false, updatable = false) }, 
			inverseJoinColumns = { @JoinColumn(name = "category_id", 
					nullable = false, updatable = false) })
	public Set<Category> getCategories() {
		return categories;
	}

	public void setCategories(Set<Category> categories) {
		this.categories = categories;
	}

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "Product_Color", joinColumns = { 
			@JoinColumn(name = "product_id", nullable = false, updatable = false) }, 
			inverseJoinColumns = { @JoinColumn(name = "color_id", 
					nullable = false, updatable = false) })
	public Set<Color> getColors() {
		return colors;
	}

	public void setColors(Set<Color> colors) {
		this.colors = colors;
	}

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "Product_Size", joinColumns = { 
			@JoinColumn(name = "product_id", nullable = false, updatable = false) }, 
			inverseJoinColumns = { @JoinColumn(name = "size_id", 
					nullable = false, updatable = false) })
	public Set<Size> getSize() {
		return size;
	}

	public void setSize(Set<Size> size) {
		this.size = size;
	}

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "Product_Order", joinColumns = { 
			@JoinColumn(name = "product_id", nullable = false, updatable = false) }, 
			inverseJoinColumns = { @JoinColumn(name = "order_id", 
					nullable = false, updatable = false) })
	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	
}
