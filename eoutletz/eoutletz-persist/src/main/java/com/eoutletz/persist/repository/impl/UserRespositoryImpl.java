package com.eoutletz.persist.repository.impl;

import org.springframework.stereotype.Repository;

import com.eoutletz.persist.entity.User;
import com.eoutletz.persist.repository.UserRepository;

@Repository
public class UserRespositoryImpl extends EoutletzBaseRepository<User> implements UserRepository {

	@Override
	public User findByEmail(String email) {
		return (User) getSession().createQuery("from User where email = ?").setString(0, email).uniqueResult();
	}

	@Override
	public User findByPassword(String password) {
		return (User) getSession().createQuery("from User where password = ?").setString(0, password).uniqueResult();
	}

}
