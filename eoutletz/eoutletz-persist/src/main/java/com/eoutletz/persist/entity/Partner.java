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
@Table(name = "Partner")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Partner extends IdEntity<Partner> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Column(name = "email", unique = true)
	private String email;
	
	@Column(name = "name")
	private String name;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "partner")
	private Set<PartnerContact> partnerContacts = new HashSet<PartnerContact>(0);
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "partner")
	private Set<Product> products = new HashSet<Product>(0);
		
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Set<PartnerContact> getPartnerContacts() {
		return partnerContacts;
	}
	public void setPartnerContacts(Set<PartnerContact> partnerContacts) {
		this.partnerContacts = partnerContacts;
	}
	
	public Set<Product> getProducts() {
		return products;
	}
	
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	
	
}
