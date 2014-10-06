package com.eoutletz.persist.db;

import java.util.List;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.springframework.transaction.annotation.Transactional;

import com.eoutletz.common.util.ReflectionUtil;

public abstract class BaseRepository<T extends Entity> implements Repository<T> {
    protected Class<T> clazz;
    
    public BaseRepository() {
        this.clazz = ReflectionUtil.getClassGenericType(getClass());
    }

    public void setupEntityClass(Class<T> clazz) {
        this.clazz = clazz;
    }

    protected Session getSession() {
        return null;
    }

    @Transactional
    public T save(final T object) {
        getSession().setFlushMode(FlushMode.AUTO);
        getSession().persist(object);
        getSession().flush();
        return object;
    }

    @Transactional
    public T update(final T object) {
        getSession().setFlushMode(FlushMode.AUTO);
        getSession().update(object);
        getSession().flush();
        return object;
    }

    @Transactional
    public T saveOrUpdate(final T object) {
        getSession().setFlushMode(FlushMode.AUTO);
        getSession().saveOrUpdate(object);
        getSession().flush();
        return object;
    }

    @Transactional
    public void delete(final T object) {
        getSession().setFlushMode(FlushMode.AUTO);
        getSession().delete(object);
        getSession().flush();
    }

    @SuppressWarnings("unchecked")
    public T findById(final Long id) {
        return (T) getSession().get(clazz, id);
    }

    @SuppressWarnings("unchecked")
    public List<T> findAll() {
        return getSession().createCriteria(clazz).list();
    }

}
