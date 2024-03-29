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
@Table(name = "Color")
public class Color extends IdEntity<Color> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6434056603166500910L;
	@Column(name = "color", nullable = false)
	private String color;
	
	private Set<Product> products = new HashSet<Product>(0);

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "colors")
	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}
}
