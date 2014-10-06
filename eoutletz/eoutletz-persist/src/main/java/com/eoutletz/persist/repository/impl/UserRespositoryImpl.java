package com.eoutletz.persist.repository.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.eoutletz.persist.entity.User;
import com.eoutletz.persist.repository.UserRepository;

@Repository
public class UserRespositoryImpl extends EoutletzBaseRepository<User> implements UserRepository {

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findByEmail(String email) {
		return (List<User>) getSession().createQuery("from User where email = ?").setString(0, email).list();
	}

}
