package com.eoutletz.persist.repository.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.eoutletz.persist.entity.Product;
import com.eoutletz.persist.repository.ProductRepository;

@Repository
public class ProductRepositoryImpl extends EoutletzBaseRepository<Product> implements ProductRepository {

	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> getLatestProducts(int limit) {
		
		List<Product> products = getSession().createQuery("from Product order by createdTime desc").setMaxResults(limit).list();

        if (products != null && !products.isEmpty()) {
            return (List<T>) products;
        }
        
		return null;
	}

}
