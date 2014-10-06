package com.eoutletz.service;

import com.eoutletz.persist.entity.User;

public interface UserService {

	public User createUser(String firstname, String lastName, String email, String password, boolean merchant);
	public User updateUser(User user);
	public User getUser(String email);
}
