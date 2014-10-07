package com.eoutletz.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eoutletz.persist.entity.User;
import com.eoutletz.persist.service.UserPersistService;
import com.eoutletz.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserPersistService userPersistService;
	
	@Override
	public User createUser(String firstName, String lastName, String email,
			String password, boolean merchant) {
		
		//TODO: check user already exists if yes throw exception
		Date now = new Date();
		User user = new User();
		user.setEmail(email);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setMerchant(merchant);
		user.setPassword(password);
		user.setCreatedTime(now);
		user.setUpdatedTime(now);
		
		return userPersistService.saveUser(user);
	}

	@Override
	public User updateUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUser(String email) {
		// TODO Auto-generated method stub
		return null;
	}

}
