package com.eoutletz.service.user.impl;

import org.springframework.stereotype.Service;

import com.eoutletz.service.user.EchoService;

@Service
public class EchoServiceImpl implements EchoService {

	@Override
	public String echo() {
		// TODO Auto-generated method stub
		return "echo";
	}

}
