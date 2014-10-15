package com.eoutletz.persist.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eoutletz.common.log.Logger;
import com.eoutletz.persist.entity.Product;
import com.eoutletz.persist.repository.ProductRepository;
import com.eoutletz.persist.service.ProductPersistService;

@Transactional
@Service
public class ProductPersistServiceImpl implements ProductPersistService {

	private final Logger logger = Logger
			.getLogger(ProductPersistServiceImpl.class);

	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public Product saveProduct(Product user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> findByCategory(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> getLatestProducts(int limit) {
		logger.info("fetching latest products by date");
		return productRepository.getLatestProducts(limit);
	}

	@Override
	public void deleteById(Long id) {
		// TODO Auto-generated method stub
		
	}

}
