package com.eoutletz.persist.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.eoutletz.persist.db.IdEntity;

@Entity
@Table(name="Partner_Contact")
public class PartnerContact extends IdEntity<PartnerContact>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Column(name="address1", nullable=false)
	private String address1;
	
	@Column(name="address2")
	private String address2;
	
	@Column(name="city", nullable=false)
	private String city;
	
	@Column(name="state", nullable=false)
	private String state;
	
	@Column(name="postal_code", nullable=false)
	private String postalCode;

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "partner_id")
	private Partner partner;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "type_id")
	private AddressType addressType;

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public Partner getPartner() {
		return partner;
	}

	public void setPartner(Partner partner) {
		this.partner = partner;
	}

	public AddressType getAddressType() {
		return addressType;
	}

	public void setAddressType(AddressType addressType) {
		this.addressType = addressType;
	}
}
