package com.eoutletz.common.rest.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class UserResponse {

	private Data data;
	private BaseResponseResource baseResponseResource;
	
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class Data{
		private String firstname;
		private String lastname;
		private String email;
		public String getFirstname() {
			return firstname;
		}
		public void setFirstname(String firstname) {
			this.firstname = firstname;
		}
		public String getLastname() {
			return lastname;
		}
		public void setLastname(String lastname) {
			this.lastname = lastname;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
	}

	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	public BaseResponseResource getBaseResponseResource() {
		return baseResponseResource;
	}

	public void setBaseResponseResource(BaseResponseResource baseResponseResource) {
		this.baseResponseResource = baseResponseResource;
	}
}
