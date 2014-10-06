package com.eoutletz.rest.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eoutletz.common.log.Logger;
import com.eoutletz.common.rest.request.CreateUserRequest;
import com.eoutletz.common.rest.response.BaseResponseResource;
import com.eoutletz.service.UserService;

@Controller
public class UserController extends BaseController {

	private Logger logger  = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/user/", method = RequestMethod.POST, produces="application/json")
	public ResponseEntity<BaseResponseResource> createUser(@RequestBody final CreateUserRequest createUserRequest) {
		logger.info("....create user has been called..");
		BaseResponseResource response = new BaseResponseResource(HttpStatus.OK.value(), "test");
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
		headers.setContentType(org.springframework.http.MediaType.APPLICATION_JSON);

		return new ResponseEntity<>(response, headers, HttpStatus.OK);
	}
}
