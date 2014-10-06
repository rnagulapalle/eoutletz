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

    @Column(name = "create_date	",
            nullable = false,
            columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    @Generated(value = GenerationTime.INSERT)
    protected Date createdTime;

    @Column(name = "update_date",
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
