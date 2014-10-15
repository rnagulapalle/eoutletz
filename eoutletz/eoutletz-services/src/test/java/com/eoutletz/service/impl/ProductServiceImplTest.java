package com.eoutletz.service.impl;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.eoutletz.service.ProductService;

public class ProductServiceImplTest extends SuperServiceImplTest {

	@Autowired
	private ProductService productService;
	
	@Test
	public void testGetLatestProd(){
		//List<Product> prods = productService.getLatestProducts();
	}
}
