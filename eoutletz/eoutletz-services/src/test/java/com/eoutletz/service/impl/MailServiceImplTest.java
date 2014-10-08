package com.eoutletz.service.impl;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.eoutletz.persist.entity.User;
import com.eoutletz.service.MailService;

public class MailServiceImplTest extends SuperServiceImplTest{

	@Autowired
	private MailService mailService;
	
	@Test
	public void orderConfirmationEmailTest(){
		
		User user = new User();
		user.setEmail("raj.jsp@gmail.com");
		user.setFirstName("Raj");
		mailService.orderConfirmationEmail(user);
	}
}
