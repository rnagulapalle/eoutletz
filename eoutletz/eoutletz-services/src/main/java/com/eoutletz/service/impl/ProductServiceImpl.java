package com.eoutletz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eoutletz.persist.entity.Product;
import com.eoutletz.persist.service.ProductPersistService;
import com.eoutletz.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductPersistService productPersistService;
	
	@Override
	public List<Product> getLatestProducts(int start, int end) {
		return productPersistService.getLatestProducts(start , end);
	}

}
