package com.eoutletz.common.rest.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class UserResponse {

	private Data data;
	
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class Data{
		private BaseResponseResource response;
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
		public BaseResponseResource getResponse() {
			return response;
		}
		public void setResponse(BaseResponseResource response) {
			this.response = response;
		}
	}

	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}
}
