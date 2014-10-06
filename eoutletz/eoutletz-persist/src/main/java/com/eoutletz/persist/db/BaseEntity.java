package com.eoutletz.persist.db;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;

@MappedSuperclass
public abstract class BaseEntity<T> implements Entity, Serializable {
    private static final long serialVersionUID = 1L;

    @Column(name = "createdTime",
            nullable = false,
            columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    @Generated(value = GenerationTime.INSERT)
    protected Date createdTime;

    @Column(name = "updatedTime",
            nullable = false,
            columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    @Generated(value = GenerationTime.ALWAYS)
    protected Date updatedTime;

    public Date getCreatedTime() {
        return createdTime;
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

}
