package com.eoutletz.persist.repository;

import java.util.List;

import com.eoutletz.persist.db.Repository;
import com.eoutletz.persist.entity.User;

public interface UserRepository extends Repository<User> {

	public List<User> findByEmail(String email);
}
