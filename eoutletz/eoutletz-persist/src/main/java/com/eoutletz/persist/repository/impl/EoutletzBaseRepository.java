package com.eoutletz.persist.repository.impl;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import com.eoutletz.persist.db.BaseRepository;
import com.eoutletz.persist.db.DataAccess;
import com.eoutletz.persist.db.Entity;

public abstract class EoutletzBaseRepository<T extends Entity> extends BaseRepository<T> {

	@Autowired
    protected DataAccess dataAccess;

    @Override
    protected Session getSession() {
        return dataAccess.getSession();
    }
}
