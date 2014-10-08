package com.eoutletz.service;

import com.eoutletz.persist.entity.User;

public interface MailService {

	//TODO: Order details
	public void orderConfirmationEmail(User user);
}
