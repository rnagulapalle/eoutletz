package com.eoutletz.persist.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.eoutletz.persist.db.IdEntity;

@Entity
@Table(name = "Size")
public class Size extends IdEntity<Size> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column(name = "size", nullable = false)
	private String size;
	
	private Set<Product> products = new HashSet<Product>(0);

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "size")
	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	
	
}
