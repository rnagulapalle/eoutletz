package com.eoutletz.persist.repository;

import com.eoutletz.persist.db.Repository;
import com.eoutletz.persist.entity.User;

public interface UserRepository extends Repository<User> {

	public User findByEmail(String email);
	public User findByPassword(String password);
}
