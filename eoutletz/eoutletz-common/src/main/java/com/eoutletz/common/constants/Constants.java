package com.eoutletz.common.constants;

public class Constants {

	 public static final String HMAC_KEY = "00df331725fb99d13bb34a51cf6a9bdc";
	 
	 public enum ProductType{
		
		 NEW (0);
		 private final int type;
		 
		 private ProductType(int type) {
			this.type = type;
		}
		
		 public int getType() {
			return type;
		}
		 
	 }
}
