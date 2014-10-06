package com.eoutletz.persist.db;

import java.util.List;


public interface Repository<T extends Entity> {

    public void setupEntityClass(Class<T> clazz);

    public T save(T object);

    public T update(T object);

    public T saveOrUpdate(T object);

    public void delete(T object);

    public T findById(Long id);

    public List<T> findAll();

}
