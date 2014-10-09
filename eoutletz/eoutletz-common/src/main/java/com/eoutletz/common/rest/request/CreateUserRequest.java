package com.eoutletz.common.rest.request;

import java.io.Serializable;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonAutoDetect;

@JsonAutoDetect
public class CreateUserRequest implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@NotEmpty
	private String firstName;
	
	@NotEmpty
	private String lastName;
	
	@Email
	private String email;
	
	@NotEmpty
	private String password;
	
	//TODO: implement custom to validate merchant boolean type
	private Boolean merchant;
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isMerchant() {
		return merchant;
	}
	public void setMerchant(boolean merchant) {
		this.merchant = merchant;
	}
}
