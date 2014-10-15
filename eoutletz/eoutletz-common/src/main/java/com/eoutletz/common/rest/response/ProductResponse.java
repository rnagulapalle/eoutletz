package com.eoutletz.common.rest.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class ProductResponse {

	private Data data;

	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class Data{
		
		private BaseResponseResource response;
		
		private String name;
		
		public BaseResponseResource getResponse() {
			return response;
		}
		public void setResponse(BaseResponseResource response) {
			this.response = response;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
	}
	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}
}
