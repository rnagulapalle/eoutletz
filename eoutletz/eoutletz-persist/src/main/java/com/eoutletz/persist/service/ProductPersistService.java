package com.eoutletz.persist.service;

import java.util.List;

import com.eoutletz.persist.entity.Product;

public interface ProductPersistService {

	public Product saveProduct(Product user);

	public List<Product> findByCategory(String email);
	
	public List<Product> getLatestProducts();

	public void deleteById(Long id);
}
