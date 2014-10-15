package com.eoutletz.service.rest.response;

import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class ProductResponse {

	private Data data;
	private ProductJson productJson;

	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class ProductJson{
		private String name;
		private String descritpion;
		private Long id;
		private Set images;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getDescritpion() {
			return descritpion;
		}
		public void setDescritpion(String descritpion) {
			this.descritpion = descritpion;
		}
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public Set getImages() {
			return images;
		}
		public void setImages(Set images) {
			this.images = images;
		}
	}
	
	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class Data{
		
		private BaseResponseResource response;
		private List<ProductJson> products;
		
		public BaseResponseResource getResponse() {
			return response;
		}
		public void setResponse(BaseResponseResource response) {
			this.response = response;
		}
		public List<ProductJson> getProductJsons() {
			return products;
		}
		public void setProductJsons(List<ProductJson> products) {
			this.products = products;
		}
	}
	
	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}
}
