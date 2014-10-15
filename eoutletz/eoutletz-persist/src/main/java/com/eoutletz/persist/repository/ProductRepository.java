package com.eoutletz.persist.repository;

import java.util.List;

import com.eoutletz.persist.db.Repository;
import com.eoutletz.persist.entity.Product;


public interface ProductRepository extends Repository<Product> {

	public <T> List<T> getLatestProducts();
}