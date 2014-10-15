package com.eoutletz.service;

import java.util.List;

import com.eoutletz.persist.entity.Product;

public interface ProductService {

	public List<Product> getLatestProducts(int limit);
}
