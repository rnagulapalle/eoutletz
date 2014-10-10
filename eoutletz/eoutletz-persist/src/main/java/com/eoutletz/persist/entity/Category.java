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
@Table(name = "Category")
public class Category extends IdEntity<Category> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column(name = "name", nullable = false)
	private String name;
	
	private Set<Product> products = new HashSet<Product>(0);

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "categories")
	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}
}
