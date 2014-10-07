package com.eoutletz.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eoutletz.common.log.Logger;
import com.eoutletz.common.rest.request.CreateUserRequest;
import com.eoutletz.common.rest.response.BaseResponseResource;
import com.eoutletz.persist.entity.User;
import com.eoutletz.rest.exceptions.InvalidArgumentException;
import com.eoutletz.rest.exceptions.UserCreationFailedException;
import com.eoutletz.service.UserService;

@Controller
@RequestMapping("/api/rest/v1")
public class UserController extends BaseController {

	private Logger logger  = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/user/", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<BaseResponseResource> createUser(@RequestBody final CreateUserRequest createUserRequest) {
		logger.info("....create user has been called..");
		
		if(createUserRequest == null) throw new InvalidArgumentException("Invalid request found");
		
		User user = userService.createUser(createUserRequest.getFirstName(), createUserRequest.getLastName(), createUserRequest.getEmail(), createUserRequest.getPassword(), createUserRequest.isMerchant());
		if(user == null) throw new UserCreationFailedException("User creation failed");
		
		BaseResponseResource response = new BaseResponseResource(HttpStatus.OK.value(), "test");
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
		headers.setContentType(org.springframework.http.MediaType.APPLICATION_JSON);

		return new ResponseEntity<>(response, headers, HttpStatus.OK);
	}
}
