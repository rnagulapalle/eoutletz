package com.eoutletz.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eoutletz.common.constants.Constants;
import com.eoutletz.common.util.SecurityUtil;
import com.eoutletz.persist.entity.User;
import com.eoutletz.persist.service.UserPersistService;
import com.eoutletz.rest.exceptions.NoSuchResourceFoundException;
import com.eoutletz.rest.exceptions.UserCreationFailedException;
import com.eoutletz.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserPersistService userPersistService;
	
	@Override
	public User createUser(String firstName, String lastName, String email,
			String password, boolean merchant) {
		
		// check user already exists
		if(this.getUser(email) != null){
			//user already exist with this email
			throw new UserCreationFailedException("User already exist with this email " + email);
		}
		
		Calendar cal = Calendar.getInstance(TimeZone.getDefault());
		Date now = cal.getTime();
		//hash password before storing
		String temp = new SimpleDateFormat("yyyy-MM-dd HH").format(now);
		String salt = firstName + temp;
		String hashed = SecurityUtil.hmacSha1(salt + password, Constants.HMAC_KEY);
		
		User user = new User();
		user.setEmail(email);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setMerchant(merchant);
		user.setPassword(hashed);
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
		return userPersistService.findByEmail(email);
	}

	@Override
	public User getUser(String email, String password) {
		// check user already exists
		User user  = this.getUser(email);
		if(user == null){
			//user already exist with this email
			throw new NoSuchResourceFoundException("No user found with email " + email);
		}
		//TODO: build password hash using salt and compare stored in db.
		return null;
	}

}
