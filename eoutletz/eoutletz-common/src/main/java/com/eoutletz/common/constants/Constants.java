package com.eoutletz.common.constants;

import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

public class Constants {

	public static final String HMAC_KEY = "00df331725fb99d13bb34a51cf6a9bdc";

	public enum ProductType {

		NEW(0);

		private static final Map<Integer, ProductType> lookup = new HashMap<Integer, ProductType>();

		static {
			for (ProductType w : EnumSet.allOf(ProductType.class))
				lookup.put(w.getType(), w);
		}

		private final int type;

		private ProductType(int type) {
			this.type = type;
		}

		public int getType() {
			return type;
		}

		public static ProductType get(int code) { 
	          return lookup.get(code); 
	     }
	}
}
