package com.eoutletz.persist.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.eoutletz.persist.db.IdEntity;


@Entity
@Table(name = "Image")
public class Image extends IdEntity<Image> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Column(name = "image", nullable = false)
	private String image;

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "prod_id")
	private Product product;

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
}
