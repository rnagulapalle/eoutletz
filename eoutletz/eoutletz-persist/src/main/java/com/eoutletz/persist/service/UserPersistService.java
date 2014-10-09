package com.eoutletz.persist.service;

import com.eoutletz.persist.entity.User;

public interface UserPersistService {

	public User saveUser(User user);

	public User findByEmail(String email);

	public void deleteById(Long id);
	
	public User findByPassword(String password);
	
	public User updateUser(User user);
}
